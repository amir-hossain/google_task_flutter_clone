import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

import '../models/tab_ui_model.dart';
import '../models/task_ui_model.dart';

class LocalTaskDataSource {
  static const _databaseName = 'task_lists.db';
  static const _tabsTable = 'task_tabs';
  static const _tabColumnId = 'id';
  static const _tabColumnName = 'name';
  static const _tasksTable = 'tasks';
  static const _taskColumnId = 'id';
  static const _taskColumnTitle = 'title';
  static const _taskColumnTabId = 'tab_id';
  static const _taskColumnIsFavourite = 'is_favourite';
  static const _taskColumnIsCompleted = 'is_completed';

  Database? _db;

  Future<Database> _database() async {
    if (_db != null) return _db!;
    final dbPath = await getDatabasesPath();
    final path = p.join(dbPath, _databaseName);
    _db = await openDatabase(
      path,
      version: 4,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tabsTable (
            $_tabColumnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $_tabColumnName TEXT NOT NULL
          )
        ''');
        await _createTasksTable(db);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await _createTasksTable(db);
        }
        if (oldVersion < 3) {
          await db.execute('''
            ALTER TABLE $_tasksTable
            ADD COLUMN $_taskColumnIsFavourite INTEGER NOT NULL DEFAULT 0
          ''');
        }
        if (oldVersion < 4) {
          await db.execute('''
            ALTER TABLE $_tasksTable
            ADD COLUMN $_taskColumnIsCompleted INTEGER NOT NULL DEFAULT 0
          ''');
        }
      },
    );
    return _db!;
  }

  Future<void> _createTasksTable(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS $_tasksTable (
        $_taskColumnId TEXT PRIMARY KEY,
        $_taskColumnTitle TEXT NOT NULL,
        $_taskColumnTabId INTEGER NOT NULL,
        $_taskColumnIsFavourite INTEGER NOT NULL DEFAULT 0,
        $_taskColumnIsCompleted INTEGER NOT NULL DEFAULT 0,
        FOREIGN KEY ($_taskColumnTabId) REFERENCES $_tabsTable ($_tabColumnId)
      )
    ''');
  }

  Future<TabUiModel> saveTaskTab(String tabName) async {
    final db = await _database();
    final id = await db.insert(_tabsTable, {
      _tabColumnName: tabName,
    }, conflictAlgorithm: ConflictAlgorithm.abort);
    return TabUiModel(id: id, tabName: tabName);
  }

  Future<void> updateTaskTabName({
    required int tabId,
    required String tabName,
  }) async {
    final db = await _database();
    await db.update(
      _tabsTable,
      {_tabColumnName: tabName},
      where: '$_tabColumnId = ?',
      whereArgs: [tabId],
    );
  }

  Future<List<TabUiModel>> getTaskTabs() async {
    final db = await _database();
    final rows = await db.query(_tabsTable, orderBy: '$_tabColumnId ASC');
    final taskRows = await db.query(_tasksTable, orderBy: '$_taskColumnId ASC');

    final tasksByTabId = <int, List<TaskUiModel>>{};
    for (final row in taskRows) {
      final tabId = row[_taskColumnTabId] as int?;
      final taskId = row[_taskColumnId] as String?;
      final title = row[_taskColumnTitle] as String?;
      final isFavourite = (row[_taskColumnIsFavourite] as int? ?? 0) == 1;
      final isCompleted = (row[_taskColumnIsCompleted] as int? ?? 0) == 1;
      if (tabId == null || taskId == null || title == null) continue;

      tasksByTabId
          .putIfAbsent(tabId, () => <TaskUiModel>[])
          .add(
        TaskUiModel(
          id: taskId,
          title: title,
          isFavourite: isFavourite,
          isCompleted: isCompleted,
        ),
      );
    }

    return rows
        .map(
          (row) => TabUiModel(
        id: row[_tabColumnId] as int?,
        tabName: (row[_tabColumnName] as String?) ?? '',
        tasks:
        tasksByTabId[(row[_tabColumnId] as int?) ?? -1] ??
            const <TaskUiModel>[],
      ),
    )
        .where((tab) => tab.tabName.trim().isNotEmpty)
        .toList(growable: false);
  }

  Future<void> saveTask({required int tabId, required TaskUiModel task}) async {
    final db = await _database();
    await db.insert(_tasksTable, {
      _taskColumnId: task.id,
      _taskColumnTitle: task.title,
      _taskColumnTabId: tabId,
      _taskColumnIsFavourite: task.isFavourite ? 1 : 0,
      _taskColumnIsCompleted: task.isCompleted ? 1 : 0,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteCompletedTasks({required int tabId}) async {
    final db = await _database();
    await db.delete(
      _tasksTable,
      where: '$_taskColumnTabId = ? AND $_taskColumnIsCompleted = ?',
      whereArgs: [tabId, 1],
    );
  }
}