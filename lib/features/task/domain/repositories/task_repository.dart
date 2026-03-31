import '../../data/models/tab_ui_model.dart';
import '../../data/models/task_ui_model.dart';

abstract class TaskRepository {
  Future<TabUiModel> saveTaskTab(String tabName);
  Future<List<TabUiModel>> getTaskTabs();
  Future<void> saveTask({
    required int tabId,
    required TaskUiModel task,
  });
}
