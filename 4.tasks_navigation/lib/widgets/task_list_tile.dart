import 'package:flutter/material.dart';

import '../models/task.dart';

/// One row in the task list: checkbox, title (struck when done), delete.
///
/// Callbacks lift actions to [HomeScreen] so this widget stays **stateless** and
/// reusable—the parent owns the list and calls [setState].
class TaskListTile extends StatelessWidget {
  const TaskListTile({
    super.key,
    required this.task,
    required this.onCompletedChanged,
    required this.onDelete,
  });

  final Task task;
  final ValueChanged<bool> onCompletedChanged;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey<String>(task.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        color: Colors.red.shade700,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) => onDelete(),
      child: ListTile(
        leading: Checkbox(
          value: task.completed,
          onChanged: (v) {
            if (v != null) onCompletedChanged(v);
          },
        ),
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.completed ? TextDecoration.lineThrough : null,
            color: task.completed ? Theme.of(context).disabledColor : null,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline),
          onPressed: onDelete,
          tooltip: 'Delete task',
        ),
      ),
    );
  }
}
