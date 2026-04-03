import 'package:flutter/material.dart';

import '../models/user.dart';
import '../services/api_service.dart';

/// Fetches users once and renders async UI with [FutureBuilder].
///
/// ### Why [StatefulWidget]?
/// The [Future] is stored in [State] (`late` + [initState]) so the same instance
/// is reused each [build]. If you wrote `FutureBuilder(future: ApiService.fetchUsers())`
/// directly in [build], every rebuild would start a **new** request.
///
/// ### [FutureBuilder] states
/// - **[ConnectionState.waiting]** — still running → show loading.
/// - **[ConnectionState.done]** + [AsyncSnapshot.hasError] — failed → message.
/// - **[ConnectionState.done]** + [AsyncSnapshot.hasData] — success → list.
///
/// [snapshot.connectionState] and [snapshot.data] / [snapshot.error] drive
/// what you paint without manual flags like `_loading` / `_error`.
class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  /// Same [Future] instance across rebuilds until [_retry] assigns a new one.
  late Future<List<User>> _usersFuture;

  @override
  void initState() {
    super.initState();
    _usersFuture = ApiService.fetchUsers();
  }

  Future<void> _retry() async {
    setState(() {
      _usersFuture = ApiService.fetchUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users (API demo)'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Retry fetch',
            onPressed: _retry,
          ),
        ],
      ),
      body: FutureBuilder<List<User>>(
        future: _usersFuture,
        builder: (context, snapshot) {
          // Waiting / active: request in flight
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading users…'),
                ],
              ),
            );
          }

          // Finished with error
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 48,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Could not load users',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${snapshot.error}',
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    FilledButton.icon(
                      onPressed: _retry,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Try again'),
                    ),
                  ],
                ),
              ),
            );
          }

          // Success
          final users = snapshot.data ?? [];
          if (users.isEmpty) {
            return const Center(child: Text('No users returned.'));
          }

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                leading: CircleAvatar(child: Text('${user.id}')),
                title: Text(user.name),
                subtitle: Text(user.email),
              );
            },
          );
        },
      ),
    );
  }
}
