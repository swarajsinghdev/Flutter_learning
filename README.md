# Flutter learning

Personal workspace for learning [Flutter](https://flutter.dev/) and Dart. Each numbered folder is a self-contained exercise or sample app.

## Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (stable channel)
- A code editor (VS Code or Android Studio with Flutter plugins works well)

Check your setup:

```bash
flutter doctor
```

## Projects

| Folder               | Description                                                                 |
| -------------------- | --------------------------------------------------------------------------- |
| `1.hello`            | Starter Flutter app (default counter demo template).                        |
| `2.material_cupertino` | MaterialApp home menu; **Material** vs **Cupertino** screens via `Navigator.push`. |

### Run a project

```bash
cd 1.hello   # or: cd 2.material_cupertino
flutter pub get
flutter run
```

Pick a device when prompted (Chrome, macOS, iOS Simulator, Android emulator, or a physical device).

## Repo layout

```
Flutter_learning/
├── README.md                 # This file
├── 1.hello/                  # First exercise — standard `flutter create` app
└── 2.material_cupertino/     # Lesson 2 — Material vs Cupertino in one app (`lib/main.dart`)
```

Add new lessons as `2.*`, `3.*`, etc., to keep the order clear.

## Useful links

- [Flutter documentation](https://docs.flutter.dev/)
- [Dart language tour](https://dart.dev/guides/language/language-tour)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)

## License

This repository is for learning. Sample app code follows Flutter’s default project template licensing where applicable.
