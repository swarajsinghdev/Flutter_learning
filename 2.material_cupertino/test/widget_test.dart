import 'package:flutter_test/flutter_test.dart';

import 'package:material_cupertino_demo/app.dart';

void main() {
  testWidgets('Home menu shows Material and Cupertino actions', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Material Screen'), findsOneWidget);
    expect(find.text('Cupertino Screen'), findsOneWidget);
  });
}
