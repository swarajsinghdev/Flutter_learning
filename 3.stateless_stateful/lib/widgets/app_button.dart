import 'package:flutter/material.dart';

/// Project-wide text button: **filled** (strong action) or **outlined** (secondary).
///
/// Keeps the counter row DRY and shows **composition**—the parent supplies
/// [label] and [onPressed]; this widget only handles Material styling.
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.filled = true,
  });

  final String label;
  final VoidCallback? onPressed;

  /// When `true`, uses [FilledButton]; when `false`, [OutlinedButton].
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final child = Text(label);
    if (filled) {
      return FilledButton(onPressed: onPressed, child: child);
    }
    return OutlinedButton(onPressed: onPressed, child: child);
  }
}
