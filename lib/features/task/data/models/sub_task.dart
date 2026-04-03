import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_task.freezed.dart';

@freezed
abstract class SubTask with _$SubTask {
  const factory SubTask({
    @Default(-1) int tabIndex,
    String? taskId,
    String? subTaskId,
    @Default("") String value,
  }) = _SubTask;
}