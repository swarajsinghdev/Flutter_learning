import 'package:flutter/material.dart';

import 'screens/user_list_screen.dart';

void main() {
  runApp(const ApiUsersApp());
}

/// Lesson 5 entry: [UserListScreen] + [ApiService] + [FutureBuilder].
class ApiUsersApp extends StatelessWidget {
  const ApiUsersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API & FutureBuilder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UserListScreen(),
    );
  }
}
