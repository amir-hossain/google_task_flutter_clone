import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_todo_clone/features/task/data/models/task_ui_model.dart';

part 'tab_ui_model.freezed.dart';

@freezed
abstract class TabUiModel with _$TabUiModel {
  const factory TabUiModel({
    int? id,
    required String tabName,
    @Default(<TaskUiModel>[]) List<TaskUiModel> tasks,
  }) = _TabUiModel;
}
