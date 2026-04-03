import 'package:flutter/material.dart';

import '../screens/stateful_screen.dart';
import '../screens/stateless_screen.dart';

/// Named route builders for this small app.
///
/// Centralizing [MaterialPageRoute] construction avoids duplicating
/// `Navigator.push` boilerplate and keeps navigation discoverable in one file.
abstract final class AppRoutes {
  AppRoutes._();

  static Route<void> statelessExample() {
    return MaterialPageRoute<void>(builder: (_) => const StatelessScreen());
  }

  static Route<void> statefulExample() {
    return MaterialPageRoute<void>(builder: (_) => const StatefulScreen());
  }
}
