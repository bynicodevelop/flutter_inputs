import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_inputs/forms/inputs/EmailInput.dart';

void main() {
  testWidgets('Should see placeholder', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: EmailInput(
            placeholder: 'Enter your email',
          ),
        ),
      ),
    );

    final errorMessageFinder = find.text('Please enter a valid email');
    final valueFinder = find.text('Enter your email');

    expect(errorMessageFinder, findsNothing);
    expect(valueFinder, findsOneWidget);
  });

  testWidgets('Should see value', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: EmailInput(
            value: 'john.doe@domain.tld',
            placeholder: 'Enter your email',
          ),
        ),
      ),
    );

    final valueFinder = find.text('john.doe@domain.tld');

    expect(valueFinder, findsOneWidget);
  });

  testWidgets('Should see value form controller', (WidgetTester tester) async {
    final TextEditingController controller = TextEditingController();

    controller.text = 'john.doe@domain.tld';

    await tester.pumpWidget(
      MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: EmailInput(
            controller: controller,
            placeholder: 'Enter your email',
          ),
        ),
      ),
    );

    final valueFinder = find.text('john.doe@domain.tld');

    expect(valueFinder, findsOneWidget);
  });

  testWidgets('Should change value', (WidgetTester tester) async {
    String value = '';

    await tester.pumpWidget(
      MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: EmailInput(
            placeholder: 'Enter your email',
            onChanged: (val) => value = val,
          ),
        ),
      ),
    );

    final fieldFinder = find.byType(EmailInput);

    await tester.enterText(fieldFinder, 'john.doe@domain.tld');

    expect(value, 'john.doe@domain.tld');
  });

  testWidgets('Should see error message', (WidgetTester tester) async {
    final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

    await tester.pumpWidget(MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Form(
          key: _keyForm,
          child: Column(
            children: [
              EmailInput(
                value: '',
                placeholder: 'Enter your email',
              ),
            ],
          ),
        ),
      ),
    ));

    _keyForm.currentState.validate();

    await tester.pump();

    final valueFinder = find.text('Please enter a valid email');

    expect(valueFinder, findsOneWidget);
  });
}
