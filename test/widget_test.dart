import 'package:flutter_test/flutter_test.dart';
import 'package:foodapp/main.dart';

void main() {
  testWidgets('FoodApp smoke test and launch verification', (WidgetTester tester) async {
    await tester.pumpWidget(const FoodApp());
    expect(find.byType(FoodApp), findsOneWidget);
  });
}
