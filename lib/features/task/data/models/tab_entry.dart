import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_todo_clone/features/task/data/models/task_entity.dart';
part 'tab_entry.freezed.dart';

@freezed
abstract class TabEntry with _$TabEntry {
  const factory TabEntry({
    int? id,
    required String tabName,
    @Default(<TaskEntity>[]) List<TaskEntity> tasks,
  }) = _TabEntry;
}
