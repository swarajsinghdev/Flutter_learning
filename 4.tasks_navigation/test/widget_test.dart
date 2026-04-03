import 'package:flutter_test/flutter_test.dart';

import 'package:navigation_tasks_demo/main.dart';

void main() {
  testWidgets('Home shows app bar and empty state', (tester) async {
    await tester.pumpWidget(const TaskLessonApp());

    expect(find.text('My Tasks'), findsOneWidget);
    expect(find.textContaining('No tasks'), findsOneWidget);
  });
}
