import '../repositories/task_repository.dart';

class UpdateTaskTabUseCase {
  UpdateTaskTabUseCase(this._repository);

  final TaskRepository _repository;

  Future<void> call({required int tabId, required String tabName}) {
    return _repository.updateTaskTabName(tabId: tabId, tabName: tabName);
  }
}
