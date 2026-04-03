import 'package:flutter/cupertino.dart';

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
