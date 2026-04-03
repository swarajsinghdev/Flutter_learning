import 'package:flutter/material.dart';

/// Small wrapper around Material buttons so the counter UI stays DRY.
///
/// Reusing one widget for “Increment” and “Reset” shows how **composition**
/// works: parent passes different [label] and [onPressed] callbacks; the child
/// does not need to know *what* happens—only how it looks and that it invokes
/// the callback when tapped.
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.filled = true,
  });

  final String label;
  final VoidCallback? onPressed;
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
