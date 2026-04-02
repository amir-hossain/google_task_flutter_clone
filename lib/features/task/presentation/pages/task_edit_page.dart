import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/task_ui_model.dart';
import '../cubit/home/home_cubit.dart';
import '../cubit/home/home_state.dart';

class TaskEditPage extends StatelessWidget {
  const TaskEditPage({
    super.key,
    required this.tabIndex,
    required this.taskId,
  });

  final int tabIndex;
  final String taskId;

  @override
  Widget build(BuildContext context) {
    final task = _findTask(context.watch<HomeCubit>().state);
    final title = task?.title ?? '';
    final isFavourite = task?.isFavourite ?? false;
    final isCompleted = task?.isCompleted ?? false;

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
        Navigator.of(context).pop();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
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
                _InfoRow(
                  icon: Icons.subject,
                  label: 'Add details',
                  color: subtle,
                ),
                const SizedBox(height: 18),
                _InfoChipRow(
                  icon: Icons.schedule,
                  text: 'Tue, Mar 17, 4 PM',
                  color: subtle,
                ),
                const SizedBox(height: 12),
                _InfoChipRow(
                  icon: Icons.repeat,
                  text: 'Weekly on Tuesday, 4 PM',
                  color: subtle,
                  withClose: true,
                ),
                const Spacer(),
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

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color),
        const SizedBox(width: 14),
        Text(
          label,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: color),
        ),
      ],
    );
  }
}

class _InfoChipRow extends StatelessWidget {
  const _InfoChipRow({
    required this.icon,
    required this.text,
    required this.color,
    this.withClose = false,
  });

  final IconData icon;
  final String text;
  final Color color;
  final bool withClose;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color),
        const SizedBox(width: 14),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withValues(alpha: 0.45)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(color: color),
              ),
              if (withClose) ...[
                const SizedBox(width: 8),
                Icon(Icons.close, size: 16, color: color),
              ],
            ],
          ),
        ),
      ],
    );
  }
}