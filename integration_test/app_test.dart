import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:tea_app/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Login to Home test', (WidgetTester tester) async {
    await tester.pumpWidget(const TeaApp());

    await tester.pump(const Duration(seconds: 4));
    await tester.pumpAndSettle();

    expect(find.text('Welcome Back'), findsOneWidget);

    await tester.tap(find.text('Login to Estate  →'));
    await tester.pumpAndSettle();

    expect(find.text('ETHEREAL HARVEST'), findsOneWidget);
  });
}