# Lesson 5 — API + FutureBuilder

Fetches **https://jsonplaceholder.typicode.com/users** with the **`http`** package and shows **loading / error / list** using **`FutureBuilder`** and **`ListView.builder`**.

## Layout

```
lib/
├── main.dart
├── models/
│   └── user.dart
├── screens/
│   └── user_list_screen.dart
└── services/
    └── api_service.dart
```

Run: `flutter pub get` then `flutter run` (device needs network).
