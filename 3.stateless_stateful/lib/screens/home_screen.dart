import 'package:flutter/material.dart';

import '../core/constants/app_layout.dart';
import '../routes/app_routes.dart';

/// Landing screen: chooses between the stateless and stateful lessons.
///
/// Navigation uses the imperative [Navigator] API (`push` + [MaterialPageRoute])
/// so beginners see the explicit stack model before named routes or `go_router`.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('State Management Demo')),
      body: Center(
        child: Padding(
          padding: AppLayout.screenPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Compare how widgets behave when data changes.',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppLayout.beforeActionsGap),
              FilledButton(
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push<void>(AppRoutes.statelessExample());
                },
                child: const Text('Stateless Example'),
              ),
              const SizedBox(height: AppLayout.sectionGap),
              FilledButton.tonal(
                onPressed: () {
                  Navigator.of(context).push<void>(AppRoutes.statefulExample());
                },
                child: const Text('Stateful Example'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
