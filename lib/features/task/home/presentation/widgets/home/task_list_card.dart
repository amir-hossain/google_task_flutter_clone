import 'package:flutter/material.dart';

import '../../../../data/models/task_entity.dart';

/// List panel styled like Google Tasks: header row + empty state or task list.
class TaskListCard extends StatelessWidget {
  const TaskListCard({
    super.key,
    required this.title,
    required this.tasks,
  });

  final String title;
  final List<TaskEntity> tasks;

  static const _darkCard = Color(0xFF251812);
  static const _darkAccent = Color(0xFFE8C4B8);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final cardColor =
        isDark ? _darkCard : theme.colorScheme.surfaceContainerHighest;
    final subtle = isDark
        ? _darkAccent.withValues(alpha: 0.88)
        : theme.colorScheme.onSurfaceVariant;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 88),
      child: Material(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        title,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.onSurface,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.swap_vert),
                    color: subtle,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    color: subtle,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: tasks.isEmpty
                  ? _EmptyTasksBody(subtle: subtle, theme: theme)
                  : ListView.builder(
                      padding: const EdgeInsets.only(bottom: 16),
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final t = tasks[index];
                        return ListTile(
                          title: Text(t.title),
                          leading: const Icon(Icons.radio_button_unchecked),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyTasksBody extends StatelessWidget {
  const _EmptyTasksBody({
    required this.subtle,
    required this.theme,
  });

  final Color subtle;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(size: 120),
            const SizedBox(height: 28),
            Text(
              'No tasks yet',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'Add your to-dos and keep track of them across Google Workspace',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: subtle,
                height: 1.45,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
