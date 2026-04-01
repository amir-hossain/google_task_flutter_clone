import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_ui_model.freezed.dart';

@freezed
abstract class TaskUiModel with _$TaskUiModel {
  const factory TaskUiModel({
    required String id,
    required String title,
    @Default(false) bool isFavourite,
  }) = _TaskUiModel;
}
