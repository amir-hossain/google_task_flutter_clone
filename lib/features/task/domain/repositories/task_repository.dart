import '../../data/models/tab_ui_model.dart';

abstract class TaskRepository {
  Future<TabUiModel> saveTaskTab(String tabName);
  Future<List<TabUiModel>> getTaskTabs();
}
