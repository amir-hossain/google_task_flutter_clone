import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/task_ui_model.dart';
import '../cubit/home/home_cubit.dart';
import '../cubit/home/home_state.dart';
import '../widgets/edit_task/info_action_row.dart';
import '../widgets/edit_task/info_chip_row.dart';
import '../widgets/edit_task/info_row.dart';
import '../widgets/edit_task/sub_task.dart' as subtask_ui;

class TaskEditPage extends StatelessWidget {
  const TaskEditPage({super.key, required this.tabIndex, required this.taskId});

  final int tabIndex;
  final String taskId;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeCubit>().state;
    final task = _findTask(state);
    final title = task?.title ?? '';
    final isFavourite = task?.isFavourite ?? false;
    final isCompleted = task?.isCompleted ?? false;
    final subTasksForTask = state.subTasks
        .where(
          (s) => s.tabIndex == tabIndex && s.taskId == taskId,
    )
        .toList(growable: false);

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final panelColor = isDark
        ? const Color(0xFF251812)
        : theme.colorScheme.surfaceContainerHigh;
    final subtle = isDark
        ? const Color(0xFFE8C4B8).withValues(alpha: 0.9)
        : theme.colorScheme.onSurfaceVariant;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        _saveTitle(context, title);
        // context.read<HomeCubit>().hideSubtaskComposer();
        Navigator.of(context).pop();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              // context.read<HomeCubit>().hideSubtaskComposer();
              Navigator.of(context).pop();
            },
          ),
          title: const Text('My Tasks'),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {
                context.read<HomeCubit>().toggleTaskFavourite(
                  tabIndex: tabIndex,
                  taskId: taskId,
                );
              },
              icon: Icon(
                isFavourite ? Icons.star : Icons.star_border,
                color: isFavourite ? Colors.amber : null,
              ),
            ),
            const SizedBox(width: 6),
            const Icon(Icons.more_vert),
            const SizedBox(width: 8),
          ],
        ),
        body: Container(
          color: panelColor,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          key: ValueKey(taskId),
                          initialValue: title,
                          onChanged: (value) {
                            context.read<HomeCubit>().updateTaskTitle(
                              tabIndex: tabIndex,
                              taskId: taskId,
                              title: value,
                            );
                          },
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter title',
                          ),
                        ),
                        const SizedBox(height: 24),
                        InfoRow(
                          icon: Icons.subject,
                          label: 'Add details',
                          color: subtle,
                        ),
                        const SizedBox(height: 18),
                        InfoChipRow(
                          icon: Icons.schedule,
                          text: 'Tue, Mar 17, 4 PM',
                          color: subtle,
                        ),
                        const SizedBox(height: 12),
                        InfoChipRow(
                          icon: Icons.repeat,
                          text: 'Weekly on Tuesday, 4 PM',
                          color: subtle,
                          withClose: true,
                        ),
                        const SizedBox(height: 6),
                        for (final row in subTasksForTask) ...[
                          const SizedBox(height: 10),
                          subtask_ui.SubTask(
                            key: ValueKey(row.subTaskId),
                            color: subtle,
                            value: row.value,
                            onChanged: (value) {
                              context.read<HomeCubit>().updateSubtaskValue(
                                rowId: row.subTaskId!,
                                value: value,
                              );
                            },
                            onClose: () {
                              context.read<HomeCubit>().closeSubtask(
                                row.subTaskId!,
                              );
                            },
                          ),
                        ],
                        if (subTasksForTask.isNotEmpty)
                          const SizedBox(height: 6),
                        InfoActionRow(
                          icon: Icons.add,
                          label: 'Add subtasks',
                          color: subtle,
                          onTap: () {
                            context.read<HomeCubit>().createSubtask(
                              tabIndex: tabIndex,
                              taskId: taskId,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FilledButton(
                    onPressed: () {
                      context.read<HomeCubit>().toggleTaskCompleted(
                        tabIndex: tabIndex,
                        taskId: taskId,
                      );
                    },
                    child: Text(
                      isCompleted ? 'Mark uncompleted' : 'Mark completed',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _saveTitle(BuildContext context, String title) {
    context.read<HomeCubit>().updateTaskTitle(
      tabIndex: tabIndex,
      taskId: taskId,
      title: title,
    );
  }

  TaskUiModel? _findTask(HomeState state) {
    if (tabIndex < 0 || tabIndex >= state.tabs.length) return null;
    final tab = state.tabs[tabIndex];
    final taskIndex = tab.tasks.indexWhere((task) => task.id == taskId);
    if (taskIndex < 0) return null;
    return tab.tasks[taskIndex];
  }
}