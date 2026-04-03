import 'package:flutter/material.dart';

/// Second screen: user types a title and returns it to the previous route.
///
/// ### Navigator.pop with a result
/// `Navigator.pop(context, value)` closes this route and completes the
/// [Future] from [Navigator.push] on [HomeScreen]. That is how you **pass data
/// backward** without global variables.
///
/// ### TextEditingController
/// Owns the text field’s content. Always [dispose] it in [State.dispose] to
/// free listeners and avoid leaks.
class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final text = _controller.text.trim();
    if (text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Enter a task title')));
      return;
    }
    Navigator.of(context).pop<String>(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Task')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Task title',
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.sentences,
              autofocus: true,
              onSubmitted: (_) => _submit(),
            ),
            const SizedBox(height: 20),
            FilledButton(onPressed: _submit, child: const Text('Save task')),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}
