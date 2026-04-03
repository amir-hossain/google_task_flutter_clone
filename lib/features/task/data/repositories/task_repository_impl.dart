import '../../domain/repositories/task_repository.dart';
import '../datasources/local_task_datasource.dart';
import '../models/sub_task.dart';
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

  @override
  Future<void> saveSubTask({
    required String taskId,
    required SubTask subTask,
  }) {
    return _localDataSource.saveSubTask(taskId: taskId, subTask: subTask);
  }

  @override
  Future<void> updateSubTaskValue({
    required String subTaskId,
    required String value,
  }) {
    return _localDataSource.updateSubTaskValue(
      subTaskId: subTaskId,
      value: value,
    );
  }

  @override
  Future<void> deleteSubTask({required String subTaskId}) {
    return _localDataSource.deleteSubTask(subTaskId: subTaskId);
  }

  @override
  Future<List<SubTask>> getSubTasksForTabs(List<TabUiModel> tabs) {
    return _localDataSource.getSubTasksForTabs(tabs);
  }
}