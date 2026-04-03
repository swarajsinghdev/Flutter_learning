import 'package:flutter/material.dart';

/// Shared layout values so padding stays consistent across screens.
///
/// Using one place for spacing makes the demo easier to tweak and matches
/// the idea of **single source of truth** for UI constants.
abstract final class AppLayout {
  AppLayout._();

  /// Horizontal + vertical padding around screen body content.
  static const EdgeInsets screenPadding = EdgeInsets.all(24);

  /// Space between stacked sections (e.g. title → body text).
  static const double sectionGap = 16;

  /// Space before primary actions at the bottom of a column.
  static const double beforeActionsGap = 32;

  /// Space between two buttons.
  static const double buttonGap = 12;
}
