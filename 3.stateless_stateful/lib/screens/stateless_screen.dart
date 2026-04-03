import 'package:flutter/material.dart';

import '../core/constants/app_layout.dart';
import '../widgets/section_heading.dart';

/// Demonstrates [StatelessWidget]: **no built-in place to store changing data**.
///
/// ### Why the UI never updates
/// - [StatelessWidget.build] runs with **only** [BuildContext] and constructor
///   parameters. There is no [State] object holding a counter.
/// - After the first frame, nothing in this widget’s inputs changes, so Flutter
///   has no reason to call [build] again.
/// - There is **no [State.setState]** on a [StatelessWidget]. Even if you tap
///   the button and run code, the subtree you already built still shows the same
///   [Text] until a **parent** rebuilds and passes new data (which never happens
///   in this isolated screen).
///
/// ### Learning outcome
/// Same configuration → same pixels. Handlers can run; the widget tree does not
/// “remember” a click count unless state lives elsewhere (e.g. parent, global).
class StatelessScreen extends StatelessWidget {
  const StatelessScreen({super.key});

  /// Shown in the UI: fixed at `0` to show that nothing ever increments here.
  static const int _displayedClicks = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Stateless Example')),
      body: Center(
        child: Padding(
          padding: AppLayout.screenPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SectionHeading('StatelessWidget'),
              const SizedBox(height: AppLayout.sectionGap),
              Text(
                'You clicked $_displayedClicks times',
                style: theme.textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppLayout.buttonGap),
              Text(
                'The text stays at 0: there is no state to update and no setState.',
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppLayout.beforeActionsGap),
              FilledButton(
                onPressed: () {
                  // Proves the tap handler runs even though [build] is not
                  // scheduled again for this widget.
                  debugPrint('Stateless: button pressed (UI will not update)');
                },
                child: const Text('Click Me'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
