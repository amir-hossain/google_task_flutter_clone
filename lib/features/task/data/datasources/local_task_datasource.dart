import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

import '../models/sub_task.dart';
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
  static const _subtasksTable = 'subtasks';
  static const _subtaskColumnId = 'id';
  static const _subtaskColumnTaskId = 'task_id';
  static const _subtaskColumnValue = 'value';

  Database? _db;

  Future<Database> _database() async {
    if (_db != null) return _db!;
    final dbPath = await getDatabasesPath();
    final path = p.join(dbPath, _databaseName);
    _db = await openDatabase(
      path,
      version: 5,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tabsTable (
            $_tabColumnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $_tabColumnName TEXT NOT NULL
          )
        ''');
        await _createTasksTable(db);
        await _createSubtasksTable(db);
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
        if (oldVersion < 5) {
          await _createSubtasksTable(db);
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

  Future<void> _createSubtasksTable(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS $_subtasksTable (
        $_subtaskColumnId TEXT PRIMARY KEY,
        $_subtaskColumnTaskId TEXT NOT NULL,
        $_subtaskColumnValue TEXT NOT NULL DEFAULT '',
        FOREIGN KEY ($_subtaskColumnTaskId) REFERENCES $_tasksTable ($_taskColumnId)
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
    await db.rawDelete(
      '''
      DELETE FROM $_subtasksTable
      WHERE $_subtaskColumnTaskId IN (
        SELECT $_taskColumnId FROM $_tasksTable
        WHERE $_taskColumnTabId = ? AND $_taskColumnIsCompleted = ?
      )
      ''',
      [tabId, 1],
    );
    await db.delete(
      _tasksTable,
      where: '$_taskColumnTabId = ? AND $_taskColumnIsCompleted = ?',
      whereArgs: [tabId, 1],
    );
  }

  Future<void> saveSubTask({
    required String taskId,
    required SubTask subTask,
  }) async {
    final sid = subTask.subTaskId;
    if (sid == null) return;
    final db = await _database();
    await db.insert(_subtasksTable, {
      _subtaskColumnId: sid,
      _subtaskColumnTaskId: taskId,
      _subtaskColumnValue: subTask.value,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> updateSubTaskValue({
    required String subTaskId,
    required String value,
  }) async {
    final db = await _database();
    await db.update(
      _subtasksTable,
      {_subtaskColumnValue: value},
      where: '$_subtaskColumnId = ?',
      whereArgs: [subTaskId],
    );
  }

  Future<void> deleteSubTask({required String subTaskId}) async {
    final db = await _database();
    await db.delete(
      _subtasksTable,
      where: '$_subtaskColumnId = ?',
      whereArgs: [subTaskId],
    );
  }

  Future<List<SubTask>> getSubTasksForTabs(List<TabUiModel> tabs) async {
    if (tabs.isEmpty) return const [];
    final tabIdToIndex = <int, int>{};
    for (var i = 0; i < tabs.length; i++) {
      final id = tabs[i].id;
      if (id != null) tabIdToIndex[id] = i;
    }
    if (tabIdToIndex.isEmpty) return const [];

    final db = await _database();
    final rows = await db.rawQuery(
      '''
      SELECT s.$_subtaskColumnId AS sid,
             s.$_subtaskColumnTaskId AS stask_id,
             s.$_subtaskColumnValue AS svalue,
             t.$_taskColumnTabId AS tab_id
      FROM $_subtasksTable s
      INNER JOIN $_tasksTable t ON s.$_subtaskColumnTaskId = t.$_taskColumnId
      ''',
    );

    final out = <SubTask>[];
    for (final row in rows) {
      final tabId = row['tab_id'] as int?;
      final taskId = row['stask_id'] as String?;
      final sid = row['sid'] as String?;
      if (tabId == null || taskId == null || sid == null) continue;
      final tabIndex = tabIdToIndex[tabId];
      if (tabIndex == null) continue;
      out.add(
        SubTask(
          tabIndex: tabIndex,
          taskId: taskId,
          subTaskId: sid,
          value: (row['svalue'] as String?) ?? '',
        ),
      );
    }
    return out;
  }

  Future<void> deleteTaskTab({required int tabId}) async {
    final db = await _database();

    await db.rawDelete(
      '''
      DELETE FROM $_subtasksTable
      WHERE $_subtaskColumnTaskId IN (
        SELECT $_taskColumnId FROM $_tasksTable
        WHERE $_taskColumnTabId = ?
      )
      ''',
      [tabId],
    );

    // Delete tasks after subtasks to avoid foreign-key violations.
    await db.delete(
      _tasksTable,
      where: '$_taskColumnTabId = ?',
      whereArgs: [tabId],
    );

    await db.delete(
      _tabsTable,
      where: '$_tabColumnId = ?',
      whereArgs: [tabId],
    );
  }
}