import '../../data/models/sub_task.dart';
import '../repositories/task_repository.dart';

class SaveSubTaskUseCase {
  SaveSubTaskUseCase(this._repository);

  final TaskRepository _repository;

  Future<void> call({
    required String taskId,
    required SubTask subTask,
  }) {
    return _repository.saveSubTask(taskId: taskId, subTask: subTask);
  }
}
