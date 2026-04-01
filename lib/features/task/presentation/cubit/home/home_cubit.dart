import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/datasources/local_task_datasource.dart';
import '../../../data/models/tab_ui_model.dart';
import '../../../data/models/task_ui_model.dart';
import '../../../data/repositories/task_repository_impl.dart';
import '../../../domain/usecases/get_task_tabs_usecase.dart';
import '../../../domain/usecases/save_task_usecase.dart';
import '../../../domain/usecases/save_task_tab_usecase.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    SaveTaskTabUseCase? saveTaskTabUseCase,
    GetTaskTabsUseCase? getTaskTabsUseCase,
    SaveTaskUseCase? saveTaskUseCase,
  })  : _saveTaskTabUseCase = saveTaskTabUseCase ??
      SaveTaskTabUseCase(TaskRepositoryImpl(LocalTaskDataSource())),
        _getTaskTabsUseCase = getTaskTabsUseCase ??
            GetTaskTabsUseCase(TaskRepositoryImpl(LocalTaskDataSource())),
        _saveTaskUseCase = saveTaskUseCase ??
            SaveTaskUseCase(TaskRepositoryImpl(LocalTaskDataSource())),
        super(HomeState.init()) {
    _loadTabs();
  }

  final SaveTaskTabUseCase _saveTaskTabUseCase;
  final GetTaskTabsUseCase _getTaskTabsUseCase;
  final SaveTaskUseCase _saveTaskUseCase;

  void addTask(int tabIndex, String title) {
    final name = title.trim();
    if (name.isEmpty) return;
    if (tabIndex < 0 || tabIndex >= state.tabs.length) return;
    final tab = state.tabs[tabIndex];
    final task = TaskUiModel(
      id: '${DateTime.now().microsecondsSinceEpoch}',
      title: name,
    );
    final next = List<TabUiModel>.from(state.tabs);
    next[tabIndex] = tab.copyWith(tasks: [...tab.tasks, task]);
    if (tab.id != null) {
      unawaited(_saveTaskUseCase(tabId: tab.id!, task: task));
    }
    emit(state.copyWith(tabs: next));
  }

  Future<void> addTab(String tabName) async {
    final name = tabName.trim();
    if (name.isEmpty) return;
    final savedTab = await _saveTaskTabUseCase(name);
    emit(state.copyWith(tabs: [...state.tabs, savedTab]));
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

    final nextTasks = List<TaskUiModel>.from(tab.tasks);
    nextTasks[taskIndex] = nextTasks[taskIndex].copyWith(title: nextTitle);

    final nextTabs = List<TabUiModel>.from(state.tabs);
    nextTabs[tabIndex] = tab.copyWith(tasks: nextTasks);
    if (tab.id != null) {
      unawaited(_saveTaskUseCase(tabId: tab.id!, task: nextTasks[taskIndex]));
    }
    emit(state.copyWith(tabs: nextTabs));
  }

  void toggleTaskFavourite({
    required int tabIndex,
    required String taskId,
  }) {
    if (tabIndex < 0 || tabIndex >= state.tabs.length) return;
    final tab = state.tabs[tabIndex];
    final taskIndex = tab.tasks.indexWhere((task) => task.id == taskId);
    if (taskIndex < 0) return;

    final nextTasks = List<TaskUiModel>.from(tab.tasks);
    final currentTask = nextTasks[taskIndex];
    nextTasks[taskIndex] = currentTask.copyWith(
      isFavourite: !currentTask.isFavourite,
    );

    final nextTabs = List<TabUiModel>.from(state.tabs);
    nextTabs[tabIndex] = tab.copyWith(tasks: nextTasks);
    if (tab.id != null) {
      unawaited(_saveTaskUseCase(tabId: tab.id!, task: nextTasks[taskIndex]));
    }
    emit(state.copyWith(tabs: nextTabs));
  }

  Future<void> _loadTabs() async {
    final savedTabs = await _getTaskTabsUseCase();
    if (savedTabs.isEmpty) return;
    emit(state.copyWith(tabs: savedTabs));
  }
}