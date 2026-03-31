import '../../data/models/tab_ui_model.dart';
import '../repositories/task_repository.dart';

class GetTaskTabsUseCase {
  GetTaskTabsUseCase(this._repository);

  final TaskRepository _repository;

  Future<List<TabUiModel>> call() {
    return _repository.getTaskTabs();
  }
}
