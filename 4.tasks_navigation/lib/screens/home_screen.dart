import 'package:flutter/material.dart';

import '../models/task.dart';
import '../widgets/empty_tasks_placeholder.dart';
import '../widgets/task_list_tile.dart';
import 'add_task_screen.dart';

/// Task list home: holds [List<Task>] in [State] and rebuilds via [setState].
///
/// ### Navigator.push / async result
/// `final title = await Navigator.push<String>(...)` opens [AddTaskScreen].
/// When that screen calls `pop(title)`, the [Future] completes and you can
/// append a new [Task]—classic **forward navigation + return value** flow.
///
/// ### ListView.builder
/// Builds only visible rows. [itemCount] and [itemBuilder] map index → widget;
/// use a stable [Key] per row ([ValueKey] on [Dismissible]) so Flutter can
/// match items when the list changes.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Task> _tasks = [];

  Future<void> _openAddTask() async {
    final title = await Navigator.of(context).push<String>(
      MaterialPageRoute<String>(builder: (context) => const AddTaskScreen()),
    );

    if (!mounted) return;
    if (title == null || title.trim().isEmpty) return;

    setState(() {
      _tasks.add(
        Task(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          title: title.trim(),
        ),
      );
    });
  }

  void _setCompleted(int index, bool completed) {
    setState(() {
      _tasks[index] = _tasks[index].copyWith(completed: completed);
    });
  }

  void _removeAt(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Tasks')),
      body: _tasks.isEmpty
          ? const EmptyTasksPlaceholder()
          : ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return TaskListTile(
                  task: task,
                  onCompletedChanged: (v) => _setCompleted(index, v),
                  onDelete: () => _removeAt(index),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddTask,
        tooltip: 'Add task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
