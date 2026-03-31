import '../repositories/task_repository.dart';
import '../../data/models/tab_ui_model.dart';

class SaveTaskTabUseCase {
  SaveTaskTabUseCase(this._repository);

  final TaskRepository _repository;

  Future<TabUiModel> call(String tabName) {
    return _repository.saveTaskTab(tabName);
  }
}
