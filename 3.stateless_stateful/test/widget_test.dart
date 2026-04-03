import 'package:flutter_test/flutter_test.dart';

import 'package:stateless_stateful_demo/main.dart';

void main() {
  testWidgets('Home shows counter and layout sections', (tester) async {
    await tester.pumpWidget(const FlutterFoundationApp());

    expect(find.text('Flutter Foundation'), findsOneWidget);
    expect(find.text('Increment'), findsOneWidget);
    expect(find.text('Reset'), findsOneWidget);
    expect(find.textContaining('Counter:'), findsOneWidget);
    expect(find.text('Row + Expanded (equal thirds)'), findsOneWidget);
  });

  testWidgets('Increment updates counter via setState', (tester) async {
    await tester.pumpWidget(const FlutterFoundationApp());

    expect(find.text('Counter: 0'), findsOneWidget);
    await tester.tap(find.text('Increment'));
    await tester.pump();
    expect(find.text('Counter: 1'), findsOneWidget);
  });
}
