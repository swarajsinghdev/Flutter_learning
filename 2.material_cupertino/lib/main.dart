import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Root app uses [MaterialApp] as required; child routes demonstrate Material vs Cupertino UIs.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material & Cupertino',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Material + Cupertino'),
        backgroundColor: theme.colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pick a screen',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Compare Material Design vs iOS-style Cupertino widgets.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade700,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 36),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    Navigator.of(context).push<void>(
                      MaterialPageRoute<void>(
                        builder: (context) => const MaterialScreen(),
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Material Screen',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push<void>(
                      MaterialPageRoute<void>(
                        builder: (context) => const CupertinoScreen(),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Cupertino Screen',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MaterialScreen extends StatelessWidget {
  const MaterialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Screen'),
        backgroundColor: Colors.deepPurple.shade100,
        foregroundColor: Colors.deepPurple.shade900,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.palette_outlined,
                size: 72,
                color: Colors.deepPurple.shade400,
              ),
              const SizedBox(height: 28),
              Text(
                'This is Material UI',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.grey.shade900,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Scaffold · AppBar · Elevated-style actions',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.touch_app, size: 22),
                label: const Text('ElevatedButton'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star_rounded, size: 32, color: Colors.amber.shade700),
                  const SizedBox(width: 20),
                  Icon(Icons.favorite_rounded, size: 32, color: Colors.red.shade400),
                  const SizedBox(width: 20),
                  Icon(Icons.info_outline_rounded, size: 32, color: Colors.blue.shade400),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CupertinoScreen extends StatelessWidget {
  const CupertinoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey6.resolveFrom(context),
        middle: const Text(
          'Cupertino Screen',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            inherit: false,
          ),
        ),
        leading: CupertinoNavigationBarBackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      child: ColoredBox(
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.device_phone_portrait,
                    size: 72,
                    color: CupertinoColors.activeBlue,
                  ),
                  const SizedBox(height: 28),
                  Text(
                    'This is Cupertino UI',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.label.resolveFrom(context),
                      decoration: TextDecoration.none,
                      inherit: false,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'CupertinoPageScaffold · NavigationBar · iOS-style controls',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: CupertinoColors.secondaryLabel.resolveFrom(context),
                      decoration: TextDecoration.none,
                      inherit: false,
                    ),
                  ),
                  const SizedBox(height: 32),
                  CupertinoButton.filled(
                    onPressed: () {},
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                    child: const Text(
                      'CupertinoButton',
                      style: TextStyle(fontSize: 16, inherit: false),
                    ),
                  ),
                  const SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        CupertinoIcons.star_fill,
                        size: 30,
                        color: CupertinoColors.systemYellow,
                      ),
                      SizedBox(width: 20),
                      Icon(
                        CupertinoIcons.heart_fill,
                        size: 30,
                        color: CupertinoColors.systemPink,
                      ),
                      SizedBox(width: 20),
                      Icon(
                        CupertinoIcons.info_circle_fill,
                        size: 30,
                        color: CupertinoColors.activeBlue,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
