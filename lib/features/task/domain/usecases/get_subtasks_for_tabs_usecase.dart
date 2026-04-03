import '../../data/models/sub_task.dart';
import '../../data/models/tab_ui_model.dart';
import '../repositories/task_repository.dart';

class GetSubTasksForTabsUseCase {
  GetSubTasksForTabsUseCase(this._repository);

  final TaskRepository _repository;

  Future<List<SubTask>> call(List<TabUiModel> tabs) {
    return _repository.getSubTasksForTabs(tabs);
  }
}
