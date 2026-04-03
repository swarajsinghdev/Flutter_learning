# Lesson 3 — Stateless vs Stateful

Interactive demo: **StatelessWidget** (UI never updates) vs **StatefulWidget** + **`setState`** (counter, reset, red text when count > 5).

## Project layout

| Path | Role |
|------|------|
| `lib/main.dart` | `main()` only |
| `lib/app.dart` | `MaterialApp`, theme, `home` |
| `lib/theme/app_theme.dart` | `ThemeData` |
| `lib/routes/app_routes.dart` | `MaterialPageRoute` factories |
| `lib/screens/` | `HomeScreen`, `StatelessScreen`, `StatefulScreen` |
| `lib/widgets/section_heading.dart` | Shared title style |
| `lib/core/constants/app_layout.dart` | Padding / gaps |

Run: `flutter run` from this directory.
