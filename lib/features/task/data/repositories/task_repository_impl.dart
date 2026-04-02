import '../../domain/repositories/task_repository.dart';
import '../datasources/local_task_datasource.dart';
import '../models/tab_ui_model.dart';
import '../models/task_ui_model.dart';

class TaskRepositoryImpl implements TaskRepository {
  TaskRepositoryImpl(this._localDataSource);

  final LocalTaskDataSource _localDataSource;

  @override
  Future<TabUiModel> saveTaskTab(String tabName) {
    return _localDataSource.saveTaskTab(tabName);
  }

  @override
  Future<void> updateTaskTabName({
    required int tabId,
    required String tabName,
  }) {
    return _localDataSource.updateTaskTabName(
      tabId: tabId,
      tabName: tabName,
    );
  }

  @override
  Future<List<TabUiModel>> getTaskTabs() {
    return _localDataSource.getTaskTabs();
  }

  @override
  Future<void> saveTask({required int tabId, required TaskUiModel task}) {
    return _localDataSource.saveTask(tabId: tabId, task: task);
  }

  @override
  Future<void> deleteCompletedTasks({required int tabId}) {
    return _localDataSource.deleteCompletedTasks(tabId: tabId);
  }

  @override
  Future<void> deleteTaskTab({required int tabId}) {
    return _localDataSource.deleteTaskTab(tabId: tabId);
  }
}