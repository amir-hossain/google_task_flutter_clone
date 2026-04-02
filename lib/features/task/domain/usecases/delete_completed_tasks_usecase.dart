import '../repositories/task_repository.dart';

class DeleteCompletedTasksUseCase {
  DeleteCompletedTasksUseCase(this._repository);

  final TaskRepository _repository;

  Future<void> call({required int tabId}) {
    return _repository.deleteCompletedTasks(tabId: tabId);
  }
}
