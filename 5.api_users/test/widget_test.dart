import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:api_users_demo/main.dart';

void main() {
  testWidgets('Shows loading indicator while Future pending', (tester) async {
    await tester.pumpWidget(const ApiUsersApp());

    expect(find.text('Users (API demo)'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
