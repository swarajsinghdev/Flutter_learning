import 'package:flutter/material.dart';

/// **StatelessWidget** — describes UI from [BuildContext] + constructor only.
/// No [setState]; if this needed changing data, a parent would pass new params
/// or you’d lift state up / use a [StatefulWidget].
///
/// This section teaches the **layout system**:
///
/// - **[Column] / [Row]** — lay out children along the vertical or horizontal
///   axis. Main axis = direction of flow; cross axis = perpendicular.
///
/// - **[Expanded]** — in a [Row] or [Column], takes **flex** space along the
///   main axis. Here three [Expanded] children share the row **equally** (default
///   flex 1), so each box gets one third of the width.
///
/// - **[SizedBox]** — fixed width/height **or** empty gap. Use it for explicit
///   spacing between siblings. It does not add margin outside the parent’s box
///   model beyond that size.
///
/// - **[Padding]** — wraps a child and insets it on all or selected sides.
///   Unlike [SizedBox], padding is **inside** the parent’s bounds before the
///   child is laid out.
///
/// - **[Container]** — convenience widget: can combine decoration, size,
///   alignment, padding, etc. Here we use it as a colored box with a fixed height
///   for the row demo, and again for a bordered panel.
class LayoutDemoSection extends StatelessWidget {
  const LayoutDemoSection({super.key});

  static const double _boxHeight = 52;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'B. Layout demo (StatelessWidget)',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Row + Expanded (equal thirds)',
              style: theme.textTheme.labelLarge,
            ),
            const SizedBox(height: 8),
            // Row lays children horizontally. Expanded forces each child to
            // expand along the main axis so all three boxes share width evenly.
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: _boxHeight,
                    alignment: Alignment.center,
                    color: Colors.teal.shade100,
                    child: const Text('1'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: _boxHeight,
                    alignment: Alignment.center,
                    color: Colors.teal.shade300,
                    child: const Text('2'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: _boxHeight,
                    alignment: Alignment.center,
                    color: Colors.teal.shade500,
                    child: const Text(
                      '3',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Column + SizedBox (vertical gaps)',
              style: theme.textTheme.labelLarge,
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Line A'),
                const SizedBox(height: 12),
                const Text('Line B'),
                const SizedBox(height: 12),
                const Text('Line C'),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Padding + Container (inset panel)',
              style: theme.textTheme.labelLarge,
            ),
            const SizedBox(height: 8),
            // Padding shrinks the area available to the child; Container
            // draws a border and background inside that padded region.
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.teal),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.teal.shade50,
                ),
                child: const Text(
                  'Text inside a padded Container with a border.',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
