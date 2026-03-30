import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_entity.freezed.dart';

@freezed
abstract class TaskEntity with _$TaskEntity {
  const factory TaskEntity({
    required String id,
    required String title,
  }) = _TaskEntity;
}
