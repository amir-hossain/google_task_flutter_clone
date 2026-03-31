import '../../data/models/task_ui_model.dart';
import '../repositories/task_repository.dart';

class SaveTaskUseCase {
  SaveTaskUseCase(this._repository);

  final TaskRepository _repository;

  Future<void> call({
    required int tabId,
    required TaskUiModel task,
  }) {
    return _repository.saveTask(tabId: tabId, task: task);
  }
}
