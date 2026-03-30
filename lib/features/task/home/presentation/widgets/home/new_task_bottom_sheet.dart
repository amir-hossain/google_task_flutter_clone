import 'package:flutter/material.dart';

import '../../../../data/models/tab_entry.dart';

class NewTaskBottomSheet extends StatefulWidget {
  const NewTaskBottomSheet({
    super.key,
    required this.tabs,
    required this.initialTabIndex,
    required this.onSubmit,
  });

  final List<TabEntry> tabs;
  final int initialTabIndex;
  final void Function(int tabIndex, String title) onSubmit;

  @override
  State<NewTaskBottomSheet> createState() => _NewTaskBottomSheetState();
}

class _NewTaskBottomSheetState extends State<NewTaskBottomSheet> {
  static const _sheetBg = Color(0xFF3D322C);
  static const _accent = Color(0xFFE8C4A8);
  static const _accentMuted = Color(0xFF9A8478);

  late int _selectedTabIndex;
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    final max = widget.tabs.length - 1;
    final initial = widget.initialTabIndex.clamp(0, max < 0 ? 0 : max);
    _selectedTabIndex = widget.tabs.isEmpty ? 0 : initial;
    _controller = TextEditingController();
    _focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tabs.isEmpty) {
      return const SizedBox.shrink();
    }

    final listName = widget.tabs[_selectedTabIndex.clamp(0, widget.tabs.length - 1)].tabName;
    final trimmed = _controller.text.trim();
    final canSave = trimmed.isNotEmpty;

    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 20, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: PopupMenuButton<int>(
                  color: _sheetBg,
                  surfaceTintColor: Colors.transparent,
                  offset: const Offset(0, 8),
                  initialValue: _selectedTabIndex,
                  onSelected: (i) => setState(() => _selectedTabIndex = i),
                  itemBuilder: (ctx) => [
                    for (var i = 0; i < widget.tabs.length; i++)
                      PopupMenuItem<int>(
                        value: i,
                        child: Text(
                          widget.tabs[i].tabName,
                          style: const TextStyle(color: _accent),
                        ),
                      ),
                  ],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          listName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: _accent,
                          ),
                        ),
                        const SizedBox(width: 2),
                        const Icon(Icons.keyboard_arrow_down_rounded, size: 22, color: _accent),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                autofocus: true,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: _accent,
                ),
                cursorColor: _accent,
                decoration: const InputDecoration(
                  hintText: 'New task',
                  hintStyle: TextStyle(color: _accentMuted, fontSize: 18),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
                onChanged: (_) => setState(() {}),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 12, 16),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.subject_rounded, color: _accentMuted),
                    tooltip: 'Details',
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.schedule_rounded, color: _accentMuted),
                    tooltip: 'Due date',
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.star_border_rounded, color: _accentMuted),
                    tooltip: 'Star',
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: canSave
                        ? () {
                            widget.onSubmit(_selectedTabIndex, trimmed);
                          }
                        : null,
                    style: TextButton.styleFrom(
                      foregroundColor: _accent,
                      disabledForegroundColor: _accentMuted,
                    ),
                    child: const Text('Save', style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> showNewTaskBottomSheet({
  required BuildContext context,
  required List<TabEntry> tabs,
  required int initialTabIndex,
  required void Function(int tabIndex, String title) onSubmit,
}) {
  if (tabs.isEmpty) return Future<void>.value();

  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: const Color(0xFF3D322C),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (ctx) => NewTaskBottomSheet(
      tabs: tabs,
      initialTabIndex: initialTabIndex,
      onSubmit: (i, title) {
        onSubmit(i, title);
        Navigator.of(ctx).pop();
      },
    ),
  );
}
