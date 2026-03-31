import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/tab_ui_model.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({required List<TabUiModel> tabs}) = _HomeState;

  factory HomeState.init() {
    return HomeState(
      tabs: [TabUiModel(tabName: 'My task')],
    );
  }

}