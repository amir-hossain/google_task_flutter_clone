import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/sub_task.dart';
import '../../../data/models/task_ui_model.dart';
import '../../cubit/home/home_cubit.dart';
import '../../pages/task_edit_page.dart';

List<SubTask> _visibleSubtasksForTask(String taskId, List<SubTask> subTasks) {
  return [
    for (final s in subTasks)
      if (s.taskId == taskId && s.value.trim().isNotEmpty) s,
  ];
}

class TaskListCard extends StatelessWidget {
  const TaskListCard({
    super.key,
    required this.title,
    required this.tasks,
    this.subTasks = const [],
    this.onRenameList,
    this.onDeleteList,
    this.onDeleteAllCompleted,
    this.completedTaskCount = 0,
    this.currentSortLabel = 'My order',
    this.onSortSelected,
    required this.tabIndex,
  });

  final String title;
  final List<TaskUiModel> tasks;
  final List<SubTask> subTasks;
  final VoidCallback? onRenameList;
  final VoidCallback? onDeleteList;
  final VoidCallback? onDeleteAllCompleted;
  final int completedTaskCount;
  final String currentSortLabel;
  final ValueChanged<String>? onSortSelected;
  final int tabIndex;

  static const _darkCard = Color(0xFF251812);
  static const _darkAccent = Color(0xFFE8C4B8);
  static const _kLeadingSlot = 48.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final cardColor = isDark
        ? _darkCard
        : theme.colorScheme.surfaceContainerHighest;
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
                    onPressed: () => _showTaskListSortMenu(
                      context,
                      theme: theme,
                      isDark: isDark,
                      selectedLabel: currentSortLabel,
                      onSortSelected: onSortSelected,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    color: subtle,
                    onPressed: () => _showTaskListOverflowMenu(
                      context,
                      theme: theme,
                      isDark: isDark,
                      onRenameList: onRenameList,
                      onDeleteList: onDeleteList,
                      onDeleteAllCompleted: onDeleteAllCompleted,
                      canDeleteCompleted: completedTaskCount > 0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: tasks.isEmpty
                  ? _EmptyTasksBody(subtle: subtle, theme: theme)
                  : ListView(
                padding: const EdgeInsets.only(bottom: 16),
                children: [
                  for (final t in tasks) ...[
                    _TaskListRow(
                      subtle: subtle,
                      theme: theme,
                      indent: 0,
                      title: t.title,
                      isCompleted: t.isCompleted,
                      isFavourite: t.isFavourite,
                      isSubtask: false,
                      onRowTap: () {
                        Navigator.of(context).push<void>(
                          MaterialPageRoute<void>(
                            builder: (_) => BlocProvider.value(
                              value: context.read<HomeCubit>(),
                              child: TaskEditPage(
                                tabIndex: tabIndex,
                                taskId: t.id,
                              ),
                            ),
                          ),
                        );
                      },
                      onToggleCompleted: () {
                        context.read<HomeCubit>().toggleTaskCompleted(
                          tabIndex: tabIndex,
                          taskId: t.id,
                        );
                      },
                      onToggleFavourite: () {
                        context.read<HomeCubit>().toggleTaskFavourite(
                          tabIndex: tabIndex,
                          taskId: t.id,
                        );
                      },
                    ),
                    for (final st in _visibleSubtasksForTask(
                      t.id,
                      subTasks,
                    ))
                      _TaskListRow(
                        subtle: subtle,
                        theme: theme,
                        indent: _kLeadingSlot,
                        title: st.value.trim(),
                        isCompleted: false,
                        isFavourite: false,
                        isSubtask: true,
                        onRowTap: () {
                          Navigator.of(context).push<void>(
                            MaterialPageRoute<void>(
                              builder: (_) => BlocProvider.value(
                                value: context.read<HomeCubit>(),
                                child: TaskEditPage(
                                  tabIndex: tabIndex,
                                  taskId: t.id,
                                ),
                              ),
                            ),
                          );
                        },
                        onToggleCompleted: null,
                        onToggleFavourite: null,
                      ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TaskListRow extends StatelessWidget {
  const _TaskListRow({
    required this.subtle,
    required this.theme,
    required this.indent,
    required this.title,
    required this.isCompleted,
    required this.isFavourite,
    required this.isSubtask,
    required this.onRowTap,
    required this.onToggleCompleted,
    required this.onToggleFavourite,
  });

  final Color subtle;
  final ThemeData theme;
  final double indent;
  final String title;
  final bool isCompleted;
  final bool isFavourite;
  final bool isSubtask;
  final VoidCallback onRowTap;
  final VoidCallback? onToggleCompleted;
  final VoidCallback? onToggleFavourite;

  @override
  Widget build(BuildContext context) {
    final textStyle = theme.textTheme.bodyLarge?.copyWith(
      decoration: isSubtask
          ? TextDecoration.none
          : (isCompleted
          ? TextDecoration.lineThrough
          : TextDecoration.none),
      color: isSubtask
          ? theme.colorScheme.onSurface
          : (isCompleted ? subtle : theme.colorScheme.onSurface),
    );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onRowTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: indent),
              SizedBox(
                width: TaskListCard._kLeadingSlot,
                child: Center(
                  child: isSubtask
                      ? Icon(
                    Icons.radio_button_unchecked,
                    size: 24,
                    color: subtle,
                  )
                      : IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: TaskListCard._kLeadingSlot,
                      minHeight: TaskListCard._kLeadingSlot,
                    ),
                    onPressed: onToggleCompleted,
                    icon: Icon(
                      isCompleted
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      color: isCompleted
                          ? theme.colorScheme.primary
                          : subtle,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle,
                ),
              ),
              SizedBox(
                width: TaskListCard._kLeadingSlot,
                child: Center(
                  child: isSubtask
                      ? Icon(Icons.star_border, size: 24, color: subtle)
                      : IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: TaskListCard._kLeadingSlot,
                      minHeight: TaskListCard._kLeadingSlot,
                    ),
                    onPressed: onToggleFavourite,
                    icon: Icon(
                      isFavourite ? Icons.star : Icons.star_border,
                      color: isFavourite ? Colors.amber : subtle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showTaskListOverflowMenu(
    BuildContext context, {
      required ThemeData theme,
      required bool isDark,
      VoidCallback? onRenameList,
      VoidCallback? onDeleteList,
      VoidCallback? onDeleteAllCompleted,
      required bool canDeleteCompleted,
    }) {
  _showTaskListActionSheet(
    context,
    theme: theme,
    isDark: isDark,
    items: [
      _TaskListSheetItem(
        label: 'Rename list',
        enabled: onRenameList != null,
        onTap: onRenameList,
      ),
      _TaskListSheetItem(
        label: 'Delete list',
        enabled: onDeleteList != null,
        onTap: onDeleteList,
      ),
      _TaskListSheetItem(
        label: 'Delete all completed tasks',
        enabled: canDeleteCompleted && onDeleteAllCompleted != null,
        onTap: onDeleteAllCompleted,
      ),
    ],
  );
}

void _showTaskListSortMenu(
    BuildContext context, {
      required ThemeData theme,
      required bool isDark,
      required String selectedLabel,
      ValueChanged<String>? onSortSelected,
    }) {
  const options = ['My order', 'Date', 'Deadline', 'Starred recently', 'Title'];

  _showTaskListActionSheet(
    context,
    theme: theme,
    isDark: isDark,
    header: 'Sort by',
    items: [
      for (final option in options)
        _TaskListSheetItem(
          label: option,
          selected: option == selectedLabel,
          onTap: () => onSortSelected?.call(option),
        ),
    ],
  );
}

void _showTaskListActionSheet(
    BuildContext context, {
      required ThemeData theme,
      required bool isDark,
      String? header,
      required List<_TaskListSheetItem> items,
    }) {
  final sheetBg = isDark
      ? TaskListCard._darkCard
      : theme.colorScheme.surfaceContainerHigh;
  final onPrimary = theme.colorScheme.onSurface;
  final muted = theme.colorScheme.onSurfaceVariant;

  showModalBottomSheet<void>(
    context: context,
    backgroundColor: sheetBg,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (ctx) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (header != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
                child: Text(
                  header,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: onPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            for (final item in items)
              _overflowMenuTile(
                context: ctx,
                label: item.label,
                enabled: item.enabled,
                selected: item.selected,
                textColor: onPrimary,
                mutedColor: muted,
                theme: theme,
                onTap: item.onTap,
              ),
          ],
        ),
      );
    },
  );
}

Widget _overflowMenuTile({
  required BuildContext context,
  required String label,
  required bool enabled,
  required bool selected,
  required Color textColor,
  required Color mutedColor,
  required ThemeData theme,
  VoidCallback? onTap,
}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: enabled
          ? () {
        Navigator.of(context).pop();
        onTap?.call();
      }
          : null,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 18, 24, 18),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: enabled ? textColor : mutedColor,
                ),
              ),
            ),
            if (selected)
              Icon(
                Icons.check,
                color: enabled ? textColor : mutedColor,
                size: 20,
              ),
          ],
        ),
      ),
    ),
  );
}

class _TaskListSheetItem {
  const _TaskListSheetItem({
    required this.label,
    this.enabled = true,
    this.selected = false,
    this.onTap,
  });

  final String label;
  final bool enabled;
  final bool selected;
  final VoidCallback? onTap;
}

class _EmptyTasksBody extends StatelessWidget {
  const _EmptyTasksBody({required this.subtle, required this.theme});

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