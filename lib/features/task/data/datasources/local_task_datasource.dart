import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

import '../models/tab_ui_model.dart';

class LocalTaskDataSource {
  static const _databaseName = 'task_lists.db';
  static const _tableName = 'task_tabs';
  static const _columnId = 'id';
  static const _columnName = 'name';

  Database? _db;

  Future<Database> _database() async {
    if (_db != null) return _db!;
    final dbPath = await getDatabasesPath();
    final path = p.join(dbPath, _databaseName);
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableName (
            $_columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $_columnName TEXT NOT NULL
          )
        ''');
      },
    );
    return _db!;
  }

  Future<TabUiModel> saveTaskTab(String tabName) async {
    final db = await _database();
    final id = await db.insert(
      _tableName,
      {_columnName: tabName},
      conflictAlgorithm: ConflictAlgorithm.abort,
    );
    return TabUiModel(id: id, tabName: tabName);
  }

  Future<List<TabUiModel>> getTaskTabs() async {
    final db = await _database();
    final rows = await db.query(_tableName, orderBy: '$_columnId ASC');
    return rows
        .map(
          (row) => TabUiModel(
            id: row[_columnId] as int?,
            tabName: (row[_columnName] as String?) ?? '',
          ),
        )
        .where((tab) => tab.tabName.trim().isNotEmpty)
        .toList(growable: false);
  }
}
