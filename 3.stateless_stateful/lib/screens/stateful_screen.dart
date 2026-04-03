import 'package:flutter/material.dart';

import '../core/constants/app_layout.dart';
import '../widgets/section_heading.dart';

/// Demonstrates [StatefulWidget]: **mutable data lives on [State]**.
///
/// The widget class ([StatefulScreen]) is immutable configuration. The long-lived
/// [State] subclass ([_StatefulScreenState]) holds [_count] across frames.
///
/// ### What [State.setState] does
/// 1. Marks this [State] object as needing rebuild.
/// 2. Flutter schedules [build] on the next frame.
/// 3. [build] reads the new [_count], so [Text] and styles update.
///
/// ### Learning outcome
/// Changing fields inside `setState(() { ... })` + rebuild → UI reflects new data.
class StatefulScreen extends StatefulWidget {
  const StatefulScreen({super.key});

  @override
  State<StatefulScreen> createState() => _StatefulScreenState();
}

class _StatefulScreenState extends State<StatefulScreen> {
  /// Tap counter; survives until this route is popped or disposed.
  int _count = 0;

  /// When count exceeds this, the headline uses an accent color (bonus lesson).
  static const int _highCountThreshold = 5;

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

  String _hintLine() {
    if (_count > _highCountThreshold) {
      return 'Count > $_highCountThreshold: text color turns red (still using setState).';
    }
    return 'Tap "Click Me" to increment. Use Reset to go back to 0.';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final headline = theme.textTheme.headlineSmall;
    final countStyle = headline?.copyWith(
      color: _count > _highCountThreshold ? Colors.red : null,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Stateful Example')),
      body: Center(
        child: Padding(
          padding: AppLayout.screenPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SectionHeading('StatefulWidget + State'),
              const SizedBox(height: AppLayout.sectionGap),
              Text(
                'You clicked $_count times',
                style: countStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppLayout.buttonGap),
              Text(
                _hintLine(),
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppLayout.beforeActionsGap),
              FilledButton(
                onPressed: _increment,
                child: const Text('Click Me'),
              ),
              const SizedBox(height: AppLayout.buttonGap),
              OutlinedButton(onPressed: _reset, child: const Text('Reset')),
            ],
          ),
        ),
      ),
    );
  }
}
