import 'package:flutter/material.dart';

import 'app_button.dart';

/// **StatefulWidget** = immutable configuration + a separate [State] object
/// that Flutter keeps alive between frames.
///
/// - The widget class ([CounterSection]) only holds constructor args.
/// - [_CounterSectionState] holds [_count] and is where you call [setState].
///
/// ### Why [setState]?
/// When the user taps Increment, `_count` changes. Flutter must **run [build]
/// again** so [Text] can show the new number. Wrapping the mutation in
/// `setState(() { ... })` tells the framework: “schedule a rebuild for this
/// [State]’s widget subtree.”
///
/// ### Lifecycle (simplified)
/// 1. First frame: `createState` → `initState` (optional) → `build`.
/// 2. Tap → `setState` → Flutter marks dirty → later `build` runs again.
/// 3. Widget removed from tree → `dispose` on [State].
class CounterSection extends StatefulWidget {
  const CounterSection({super.key});

  @override
  State<CounterSection> createState() => _CounterSectionState();
}

class _CounterSectionState extends State<CounterSection> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _reset() {
    setState(() {
      _count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'A. Counter (StatefulWidget + setState)',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Counter: $_count',
              style: theme.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    label: 'Increment',
                    onPressed: _increment,
                    filled: true,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: AppButton(
                    label: 'Reset',
                    onPressed: _reset,
                    filled: false,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
