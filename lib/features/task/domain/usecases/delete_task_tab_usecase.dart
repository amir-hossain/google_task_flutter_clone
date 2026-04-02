import '../repositories/task_repository.dart';

class DeleteTaskTabUseCase {
  DeleteTaskTabUseCase(this._repository);

  final TaskRepository _repository;

  Future<void> call({required int tabId}) {
    return _repository.deleteTaskTab(tabId: tabId);
  }
}

