import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tea_app/screens/home_screen.dart';

void main() {
  testWidgets('Home screen loads main UI elements', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: HomeScreen(
          onNavigate: (index) {},
        ),
      ),
    );

    expect(find.text('ETHEREAL HARVEST'), findsOneWidget);
    expect(find.text('Estate Pulse'), findsOneWidget);
    expect(find.text('Tea Disease Identification'), findsOneWidget);
    expect(find.text('Soil Condition Checker'), findsOneWidget);
  });
}