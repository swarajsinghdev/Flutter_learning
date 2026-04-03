import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

/// Flutter entry point. [runApp] inflates the root widget and attaches it to
/// the engine—your **widget tree** starts here.
///
/// ### Widget tree (high level)
/// ```
/// MaterialApp
/// └── HomeScreen (Scaffold)
///     └── SingleChildScrollView
///         └── Column
///             ├── CounterSection (StatefulWidget → owns changing count)
///             └── LayoutDemoSection (StatelessWidget → pure layout)
/// ```
///
/// **Stateless** widgets describe UI from inputs only. **Stateful** widgets
/// delegate mutable data to a [State] object; calling [State.setState] schedules
/// a rebuild so the subtree can reflect new values.
void main() {
  runApp(const FlutterFoundationApp());
}

/// Root [MaterialApp]: theme, title, and the single demo [HomeScreen].
class FlutterFoundationApp extends StatelessWidget {
  const FlutterFoundationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Foundation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
