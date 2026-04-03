import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';

/// Thin HTTP layer: one place for URLs and status handling.
///
/// ### [Future] and async/await
/// A **[Future]** represents work that finishes later (here: network I/O).
/// **`async`** marks a function that may `await` those operations without
/// blocking the UI isolate. **`await`** pauses the function until the Future
/// completes, then continues with the result—or jumps to `catch`/`on` if it
/// failed.
///
/// The UI does not run inside this class; it calls these methods and reacts
/// when the Future completes (via [FutureBuilder] on the screen).
class ApiService {
  ApiService._();

  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  /// GET `/users` — returns a list or throws so the UI can show an error.
  static Future<List<User>> fetchUsers() async {
    final uri = Uri.parse('$_baseUrl/users');
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('HTTP ${response.statusCode}');
    }

    final decoded = jsonDecode(response.body);
    if (decoded is! List<dynamic>) {
      throw const FormatException('Expected JSON array');
    }

    return decoded
        .map((e) => User.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
