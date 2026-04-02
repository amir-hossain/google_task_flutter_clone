import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home/home_cubit.dart';

class AddTaskListPage extends StatefulWidget {
  const AddTaskListPage({
    super.key,
    this.renameTabIndex,
    this.initialName,
  });

  final int? renameTabIndex;
  final String? initialName;

  @override
  State<AddTaskListPage> createState() => _AddTaskListPageState();
}

class _AddTaskListPageState extends State<AddTaskListPage> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialName ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final name = _controller.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a list name')),
      );
      return;
    }
    final cubit = context.read<HomeCubit>();
    final renameIndex = widget.renameTabIndex;
    if (renameIndex != null) {
      await cubit.renameTab(tabIndex: renameIndex, newName: name);
    } else {
      await cubit.addTab(name);
    }
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final isRename = widget.renameTabIndex != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(isRename ? 'Rename list' : 'New list'),
        actions: [
          TextButton(
            onPressed: _save,
            child: const Text('Save'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          controller: _controller,
          decoration: const InputDecoration(
            labelText: 'List name',
            border: OutlineInputBorder(),
          ),
          textCapitalization: TextCapitalization.sentences,
          autofocus: true,
          onSubmitted: (_) => _save(),
        ),
      ),
    );
  }
}