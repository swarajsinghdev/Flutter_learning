import 'package:flutter/material.dart';

/// Application [ThemeData]. Kept separate from [MaterialApp] so theme
/// tweaks do not clutter `app.dart`.
abstract final class AppTheme {
  AppTheme._();

  static ThemeData light() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      useMaterial3: true,
    );
  }
}
