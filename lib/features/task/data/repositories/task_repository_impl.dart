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
  Future<List<TabUiModel>> getTaskTabs() {
    return _localDataSource.getTaskTabs();
  }

  @override
  Future<void> saveTask({
    required int tabId,
    required TaskUiModel task,
  }) {
    return _localDataSource.saveTask(tabId: tabId, task: task);
  }
}
