import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_todo_clone/features/task/home/presentation/widgets/home/task_list_card.dart';

import '../../cubit/home/home_cubit.dart';
import '../../cubit/home/home_state.dart';

/// Starred / favourite tab — uses same empty layout until favourites are modeled.
class FavouriteTaskListPane extends StatelessWidget {
  const FavouriteTaskListPane({super.key});

  @override
  Widget build(BuildContext context) {
    return const TaskListCard(
      title: 'Starred',
      tasks: [],
    );
  }
}

/// One user list tab; rebuilds when that tab's tasks or name change.
class TaskListPane extends StatelessWidget {
  const TaskListPane({super.key, required this.tabIndex});

  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (prev, curr) {
        if (prev.tabs.length != curr.tabs.length) return true;
        if (tabIndex < 0 || tabIndex >= curr.tabs.length) return true;
        if (tabIndex >= prev.tabs.length) return true;
        return prev.tabs[tabIndex] != curr.tabs[tabIndex];
      },
      builder: (context, state) {
        if (tabIndex >= state.tabs.length) {
          return const SizedBox.shrink();
        }
        final tab = state.tabs[tabIndex];
        return TaskListCard(title: tab.tabName, tasks: tab.tasks);
      },
    );
  }
}
