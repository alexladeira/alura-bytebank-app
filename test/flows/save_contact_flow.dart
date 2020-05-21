import 'package:bytebank/main.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/contact_form.dart';
import 'package:bytebank/screens/contact_list.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../matchers/matchers.dart';
import '../mocks/mocks.dart';
import 'actions.dart';

void main() {
  testWidgets('should save a contact', (tester) async {
    final mockContactDao = MockContactDao();
    final mockTransactionWebClient = MockTransactionWebClient();
    await tester.pumpWidget(BytebankApp(
      contactDao: mockContactDao,
      transactionWebClient: mockTransactionWebClient,
    ));
    final dashboard = find.byType(Dashboard);
    expect(dashboard, findsOneWidget);

    await clickOnTheTransferFeatureItem(tester);
    await tester.pumpAndSettle();

    final contactsList = find.byType(ContactList);
    expect(contactsList, findsOneWidget);

    verify(mockContactDao.findAll()).called(1);

    final fabNewContact = find.widgetWithIcon(FloatingActionButton, Icons.add);
    expect(fabNewContact, findsOneWidget);
    await tester.tap(fabNewContact);
    await tester.pumpAndSettle();

    final contactForm = find.byType(ContactForm);
    expect(contactForm, findsOneWidget);

    final nameTextField = find
        .byWidgetPredicate((widget) => textFieldMatcher(widget, 'Full name'));
    await tester.enterText(nameTextField, 'Elaine');

    final accountNumberTextField = find.byWidgetPredicate(
        (widget) => textFieldMatcher(widget, 'Account number'));
    expect(accountNumberTextField, findsOneWidget);
    await tester.enterText(nameTextField, '1000');

    final createButton = find.widgetWithText(RaisedButton, 'Create');
    expect(createButton, findsOneWidget);
    await tester.tap(createButton);
    await tester.pumpAndSettle();

    verify(mockContactDao.save(Contact(0, 'Elaine', 1000)));

    //expecting tha list is showing
    final contactListBack = find.byType(ContactList);
    expect(contactListBack, findsOneWidget);

    verify(mockContactDao.findAll()).called(1);
  });
}
