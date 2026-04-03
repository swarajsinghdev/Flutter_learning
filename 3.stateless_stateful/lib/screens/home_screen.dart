import 'package:flutter/material.dart';

import '../widgets/counter_section.dart';
import '../widgets/layout_demo_section.dart';

/// One scrollable page that combines two teaching blocks:
/// **A)** counter + [setState], **B)** core layout widgets.
///
/// [SingleChildScrollView] avoids overflow on small screens when both sections
/// are tall. Spacing between sections uses [SizedBox] (fixed gap), not padding
/// on the parent—both are valid; here we only need vertical separation.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const double _sectionSpacing = 28;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Foundation')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            CounterSection(),
            SizedBox(height: _sectionSpacing),
            LayoutDemoSection(),
          ],
        ),
      ),
    );
  }
}
