import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Root of the demo: [MaterialApp] hosts [HomeScreen].
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

// -----------------------------------------------------------------------------
// HOME
// -----------------------------------------------------------------------------

/// Entry menu: navigate to the stateless vs stateful examples.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Management Demo'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Compare how widgets behave when data changes.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push<void>(
                    MaterialPageRoute<void>(
                      builder: (context) => const StatelessScreen(),
                    ),
                  );
                },
                child: const Text('Stateless Example'),
              ),
              const SizedBox(height: 16),
              FilledButton.tonal(
                onPressed: () {
                  Navigator.of(context).push<void>(
                    MaterialPageRoute<void>(
                      builder: (context) => const StatefulScreen(),
                    ),
                  );
                },
                child: const Text('Stateful Example'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// STATELESS EXAMPLE
// -----------------------------------------------------------------------------

/// A [StatelessWidget] has **no mutable state** tied to the widget instance.
///
/// - Flutter calls [build] to draw the UI. What you return is fixed from inputs
///   (`context`, constructor args) only.
/// - There is **no `setState`** on a [StatelessWidget]. You cannot ask Flutter
///   to "re-run build" for *this* widget when some internal counter changes,
///   because there is nowhere to store that counter across frames in the widget
///   itself.
/// - Tapping the button can run code (e.g. [debugPrint]), but the tree you
///   already built still shows "0 times" until something **above** this widget
///   rebuilds and passes new data—which never happens here.
///
/// **Learning outcome:** same widget tree → same pixels; clicks do not update UI.
class StatelessScreen extends StatelessWidget {
  const StatelessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // This value is effectively constant for this widget: we never rebuild with
    // a different display count.
    const displayedClicks = 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless Example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'StatelessWidget',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                'You clicked $displayedClicks times',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'The text stays at 0: there is no state to update and no setState.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              FilledButton(
                onPressed: () {
                  // Optional: prove the handler runs even though UI does not change.
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

// -----------------------------------------------------------------------------
// STATEFUL EXAMPLE
// -----------------------------------------------------------------------------

/// A [StatefulWidget] splits configuration ([StatefulWidget]) from **mutable
/// state** ([State]).
///
/// - The [State] object **lives across frames** and can hold fields like [_count].
/// - Calling [setState] tells Flutter: "something this [State] cares about
///   changed; schedule [build] again."
/// - After [setState], [build] runs and reads the new [_count], so the [Text]
///   shows the updated value.
///
/// **Learning outcome:** changing state + [setState] → new UI.
class StatefulScreen extends StatefulWidget {
  const StatefulScreen({super.key});

  @override
  State<StatefulScreen> createState() => _StatefulScreenState();
}

class _StatefulScreenState extends State<StatefulScreen> {
  /// Lives in [State]; survives until the widget is removed from the tree.
  int _count = 0;

  void _increment() {
    // setState marks this State object dirty and schedules build().
    // Inside the callback you only update fields; Flutter calls build() after.
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
    // Bonus: visual feedback when count crosses 5.
    final countStyle = Theme.of(context).textTheme.headlineSmall!.copyWith(
          color: _count > 5 ? Colors.red : null,
        );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'StatefulWidget + State',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                'You clicked $_count times',
                style: countStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                _count > 5
                    ? 'Count > 5: text color turns red (still using setState).'
                    : 'Tap "Click Me" to increment. Use Reset to go back to 0.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              FilledButton(
                onPressed: _increment,
                child: const Text('Click Me'),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: _reset,
                child: const Text('Reset'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
