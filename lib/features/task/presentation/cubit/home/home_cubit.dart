import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/tab_entry.dart';
import '../../../data/models/task_entity.dart';
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

  void updateTaskTitle({
    required int tabIndex,
    required String taskId,
    required String title,
  }) {
    if (tabIndex < 0 || tabIndex >= state.tabs.length) return;
    final nextTitle = title.trim();
    if (nextTitle.isEmpty) return;

    final tab = state.tabs[tabIndex];
    final taskIndex = tab.tasks.indexWhere((task) => task.id == taskId);
    if (taskIndex < 0) return;

    final nextTasks = List<TaskEntity>.from(tab.tasks);
    nextTasks[taskIndex] = nextTasks[taskIndex].copyWith(title: nextTitle);

    final nextTabs = List<TabEntry>.from(state.tabs);
    nextTabs[tabIndex] = tab.copyWith(tasks: nextTasks);
    emit(state.copyWith(tabs: nextTabs));
  }
}