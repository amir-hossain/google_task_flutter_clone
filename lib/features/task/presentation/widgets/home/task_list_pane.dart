import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_todo_clone/features/task/presentation/widgets/home/task_list_card.dart';

import '../../../data/models/task_ui_model.dart';
import '../../cubit/home/home_cubit.dart';
import '../../cubit/home/home_state.dart';
import '../../pages/task_edit_page.dart';

typedef _FavouriteItem = ({int tabIndex, TaskUiModel task});

/// Starred / favourite tab.
class FavouriteTaskListPane extends StatelessWidget {
  const FavouriteTaskListPane({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final favourites = <_FavouriteItem>[
          for (var tabIndex = 0; tabIndex < state.tabs.length; tabIndex++)
            for (final task in state.tabs[tabIndex].tasks)
              if (task.isFavourite) (tabIndex: tabIndex, task: task),
        ];

        final theme = Theme.of(context);
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 88),
          child: Material(
            color: theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(16),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Text(
                    'Starred',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  child: favourites.isEmpty
                      ? const Center(child: Text('No starred tasks yet'))
                      : ListView.builder(
                    itemCount: favourites.length,
                    itemBuilder: (context, index) {
                      final item = favourites[index];
                      return ListTile(
                        leading: const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        title: Text(item.task.title),
                        onTap: () {
                          Navigator.of(context).push<void>(
                            MaterialPageRoute<void>(
                              builder: (_) => BlocProvider.value(
                                value: context.read<HomeCubit>(),
                                child: TaskEditPage(
                                  tabIndex: item.tabIndex,
                                  taskId: item.task.id,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
        return TaskListCard(
          title: tab.tabName,
          tasks: tab.tasks,
          tabIndex: tabIndex,
        );
      },
    );
  }
}
