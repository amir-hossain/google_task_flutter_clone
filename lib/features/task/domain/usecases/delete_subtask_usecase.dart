import '../repositories/task_repository.dart';

class DeleteSubTaskUseCase {
  DeleteSubTaskUseCase(this._repository);

  final TaskRepository _repository;

  Future<void> call({required String subTaskId}) {
    return _repository.deleteSubTask(subTaskId: subTaskId);
  }
}
