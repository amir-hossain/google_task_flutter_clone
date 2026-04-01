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

  Database? _db;

  Future<Database> _database() async {
    if (_db != null) return _db!;
    final dbPath = await getDatabasesPath();
    final path = p.join(dbPath, _databaseName);
    _db = await openDatabase(
      path,
      version: 2,
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
        FOREIGN KEY ($_taskColumnTabId) REFERENCES $_tabsTable ($_tabColumnId)
      )
    ''');
  }

  Future<TabUiModel> saveTaskTab(String tabName) async {
    final db = await _database();
    final id = await db.insert(
      _tabsTable,
      {_tabColumnName: tabName},
      conflictAlgorithm: ConflictAlgorithm.abort,
    );
    return TabUiModel(id: id, tabName: tabName);
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
      if (tabId == null || taskId == null || title == null) continue;

      tasksByTabId.putIfAbsent(tabId, () => <TaskUiModel>[]).add(
        TaskUiModel(
          id: taskId,
          title: title,
        ),
      );
    }

    return rows
        .map(
          (row) => TabUiModel(
        id: row[_tabColumnId] as int?,
        tabName: (row[_tabColumnName] as String?) ?? '',
        tasks: tasksByTabId[(row[_tabColumnId] as int?) ?? -1] ??
            const <TaskUiModel>[],
      ),
    )
        .where((tab) => tab.tabName.trim().isNotEmpty)
        .toList(growable: false);
  }

  Future<void> saveTask({
    required int tabId,
    required TaskUiModel task,
  }) async {
    final db = await _database();
    await db.insert(
      _tasksTable,
      {
        _taskColumnId: task.id,
        _taskColumnTitle: task.title,
        _taskColumnTabId: tabId,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
