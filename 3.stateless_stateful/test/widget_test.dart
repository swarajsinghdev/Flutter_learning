import 'package:flutter_test/flutter_test.dart';

import 'package:stateless_stateful_demo/main.dart';

void main() {
  testWidgets('Home shows navigation to both examples', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Stateless Example'), findsOneWidget);
    expect(find.text('Stateful Example'), findsOneWidget);
  });
}
