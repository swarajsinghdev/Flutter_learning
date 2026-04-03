import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const TaskLessonApp());
}

/// Root widget for lesson 4: navigation, lists, and local state.
class TaskLessonApp extends StatelessWidget {
  const TaskLessonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasks & Navigation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
