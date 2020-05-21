import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../matchers/matchers.dart';
import '../mocks/mocks.dart';

void main() {
  group('when dashboard is opened', () {
    final mockContactDao = MockContactDao();
    testWidgets('should display the main image', (WidgetTester tester) async {
      await _openDashboard(tester, mockContactDao);
      final mainImage = find.byType(Image);
      expect(mainImage, findsOneWidget);
    });
    testWidgets('should display the transfer feature in the dashboard',
        (WidgetTester tester) async {
      await _openDashboard(tester, mockContactDao);
      final transferFeature = find.byWidgetPredicate((widget) =>
          featureItemMatcher(widget, 'Transfer', Icons.monetization_on));
      expect(transferFeature, findsOneWidget);
    });
    testWidgets('should display the transaction feed feature in the dashboard',
        (WidgetTester tester) async {
      await _openDashboard(tester, mockContactDao);
      final feature = find.byWidgetPredicate((widget) =>
          featureItemMatcher(widget, 'Transaction feed', Icons.description));
      expect(feature, findsOneWidget);
    });
  });
}

Future _openDashboard(
    WidgetTester tester, MockContactDao mockContactDao) async {
  await tester.pumpWidget(MaterialApp(home: Dashboard()));
}
