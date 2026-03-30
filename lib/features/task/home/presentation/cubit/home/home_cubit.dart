import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/tab_entry.dart';
import '../../../../data/models/task_entity.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.init());

  void addTask(int tabIndex, String title) {
    final name = title.trim();
    if (name.isEmpty) return;
    final tab = state.tabs[tabIndex];
    final task = TaskEntity(
      id: '${DateTime.now().microsecondsSinceEpoch}',
      title: name,
    );
    final next = List<TabEntry>.from(state.tabs);
    next[tabIndex] = tab.copyWith(tasks: [...tab.tasks, task]);
    emit(state.copyWith(tabs: next));
  }

  void addTab(String tabName) {
    final name = tabName.trim();
    if (name.isEmpty) return;
    emit(state.copyWith(tabs: [
      ...state.tabs,
      TabEntry(tabName: name),
    ]));
  }
}