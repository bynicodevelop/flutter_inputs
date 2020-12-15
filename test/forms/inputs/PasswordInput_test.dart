import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_inputs/forms/Input.dart';
import 'package:flutter_inputs/forms/inputs/PasswordInput.dart';

void main() {
  testWidgets('Should see placeholder', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: PasswordInput(
            placeholder: 'Enter your password',
          ),
        ),
      ),
    );

    final valueFinder = find.text('Enter your password');

    expect(valueFinder, findsOneWidget);
  });

  testWidgets('Should be secret password by default',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: PasswordInput(
            key: Key('pass'),
            placeholder: 'Enter your password',
          ),
        ),
      ),
    );

    final inputFinder = find.byType(Input);

    expect((inputFinder.evaluate().first.widget as Input).obscureText, true);
  });

  testWidgets('Should be secret password then can see password',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: PasswordInput(
            key: Key('pass'),
            placeholder: 'Enter your password',
          ),
        ),
      ),
    );

    final inputFinder = find.byType(Input);

    expect((inputFinder.evaluate().first.widget as Input).obscureText, true);

    final iconVisibiltyOffFinder = find.byIcon(Icons.visibility_off);

    expect(iconVisibiltyOffFinder, findsOneWidget);

    await tester.tap(iconVisibiltyOffFinder);

    await tester.pump();

    expect((inputFinder.evaluate().first.widget as Input).obscureText, false);
    final iconVisibilityFinder = find.byIcon(Icons.visibility);

    expect(iconVisibilityFinder, findsOneWidget);
  });

  testWidgets('Should the onchange method', (WidgetTester tester) async {
    String testValue = 'password';
    String localValue = '';

    await tester.pumpWidget(
      MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: PasswordInput(
            key: Key('pass'),
            placeholder: 'Enter your password',
            onChanged: (value) => localValue = value,
          ),
        ),
      ),
    );

    final widgetFinder = find.byKey(Key('pass'));

    await tester.enterText(widgetFinder, testValue);

    expect(localValue, testValue);
  });

  testWidgets('Should the validate method', (WidgetTester tester) async {
    final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
    String testValue = 'error';

    await tester.pumpWidget(
      MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: Form(
            key: _keyForm,
            child: PasswordInput(
              key: Key('pass'),
              placeholder: 'Enter your password',
              validator: (value) => testValue,
            ),
          ),
        ),
      ),
    );

    _keyForm.currentState.validate();
    await tester.pump();

    final valueFinder = find.text(testValue);

    expect(valueFinder, findsOneWidget);
  });
}
