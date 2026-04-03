import '../repositories/task_repository.dart';

class UpdateSubTaskUseCase {
  UpdateSubTaskUseCase(this._repository);

  final TaskRepository _repository;

  Future<void> call({
    required String subTaskId,
    required String value,
  }) {
    return _repository.updateSubTaskValue(
      subTaskId: subTaskId,
      value: value,
    );
  }
}
