import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home/home_cubit.dart';
import '../cubit/home/home_state.dart';
import '../widgets/home/new_task_bottom_sheet.dart';
import '../widgets/home/task_list_pane.dart';
import 'add_task_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  late int _currentLength;

  @override
  void initState() {
    super.initState();
    final tabs = context.read<HomeCubit>().state.tabs;
    _currentLength = tabs.length + 1;

    _tabController = TabController(length: _currentLength, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return SafeArea(
      top: true,
      bottom: true,
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (prev, curr) => prev.tabs.length != curr.tabs.length,
        builder: (BuildContext context, state) {
          _updateTabController(state.tabs.length + 1);
          return Scaffold(
            appBar: AppBar(
              title: _Header(),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(48),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      TabBar(
                        controller: _tabController,
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        dividerColor: Colors.transparent,
                        tabs: [
                          const Tab(child: Icon(Icons.star)),

                          for (var tab in state.tabs)
                            Tab(child: Text(tab.tabName)),
                        ],
                      ),

                      InkWell(
                        onTap: () => _openAddListPage(context, cubit),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(width: 8),

                            Icon(Icons.add),

                            const SizedBox(width: 4),

                            Text("New list"),

                            const SizedBox(width: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              children: [
                const FavouriteTaskListPane(),
                for (var i = 0; i < state.tabs.length; i++)
                  TaskListPane(tabIndex: i),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                final s = cubit.state;
                if (s.tabs.isEmpty) return;
                final i = _tabController.index;
                final listIndex = i == 0 ? 0 : (i - 1).clamp(0, s.tabs.length - 1);
                showNewTaskBottomSheet(
                  context: context,
                  tabs: s.tabs,
                  initialTabIndex: listIndex,
                  onSubmit: cubit.addTask,
                );
              },
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }

  void _openAddListPage(BuildContext context, HomeCubit cubit) {
    Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (ctx) => BlocProvider.value(
          value: cubit,
          child: const AddTaskListPage(),
        ),
      ),
    );
  }

  void _updateTabController(int newLength) {
    if (_currentLength == newLength) return;

    _tabController.dispose();
    _currentLength = newLength;

    _tabController = TabController(length: newLength, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text(
            "Tasks",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: CircleAvatar(child: Text("A")),
        ),
      ],
    );
  }
}