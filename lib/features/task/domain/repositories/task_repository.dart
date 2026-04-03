import '../../data/models/sub_task.dart';
import '../../data/models/tab_ui_model.dart';
import '../../data/models/task_ui_model.dart';

abstract class TaskRepository {
  Future<TabUiModel> saveTaskTab(String tabName);
  Future<void> updateTaskTabName({required int tabId, required String tabName});
  Future<List<TabUiModel>> getTaskTabs();
  Future<void> saveTask({required int tabId, required TaskUiModel task});
  Future<void> deleteCompletedTasks({required int tabId});
  Future<void> deleteTaskTab({required int tabId});
  Future<void> saveSubTask({
    required String taskId,
    required SubTask subTask,
  });
  Future<void> updateSubTaskValue({
    required String subTaskId,
    required String value,
  });
  Future<void> deleteSubTask({required String subTaskId});
  Future<List<SubTask>> getSubTasksForTabs(List<TabUiModel> tabs);
}