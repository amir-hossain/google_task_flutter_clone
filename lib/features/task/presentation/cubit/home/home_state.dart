import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/tab_entry.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({required List<TabEntry> tabs}) = _HomeState;

  factory HomeState.init() {
    return HomeState(
      tabs: [TabEntry(tabName: 'My task')],
    );
  }

}

