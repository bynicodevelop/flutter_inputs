import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_inputs/forms/inputs/TextInput.dart';

void main() {
  testWidgets('Should see placeholder', (WidgetTester tester) async {
    final String localValue = 'Enter your value';

    await tester.pumpWidget(
      MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: TextInput(
            placeholder: localValue,
            onChanged: (value) {},
          ),
        ),
      ),
    );

    final Finder textFinder = find.text(localValue);

    expect(textFinder, findsOneWidget);
  });

  testWidgets('Should see value', (WidgetTester tester) async {
    final String localValue = 'value';

    await tester.pumpWidget(
      MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: TextInput(
            value: localValue,
            onChanged: (value) {},
          ),
        ),
      ),
    );

    final Finder textFinder = find.text(localValue);

    expect(textFinder, findsOneWidget);
  });

  testWidgets('Should see value from controller', (WidgetTester tester) async {
    final TextEditingController controller = TextEditingController();
    final String localValue = 'text value';

    controller.text = localValue;

    await tester.pumpWidget(
      MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: TextInput(
            controller: controller,
            onChanged: (value) {},
          ),
        ),
      ),
    );

    final valueFinder = find.text(localValue);

    expect(valueFinder, findsOneWidget);
  });

  testWidgets('Should the onchange method', (WidgetTester tester) async {
    final String localValue = 'value';
    String stringTest = '';

    await tester.pumpWidget(
      MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: TextInput(
            onChanged: (value) => stringTest = value,
          ),
        ),
      ),
    );

    final Finder fieldFinder = find.byType(TextInput);
    await tester.enterText(fieldFinder, localValue);

    expect(stringTest, localValue);
  });

  testWidgets('Should the validate method', (WidgetTester tester) async {
    final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
    final String localValue = 'Error message';

    await tester.pumpWidget(
      MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: Form(
            key: _keyForm,
            child: TextInput(
              onChanged: (value) {},
              validator: (value) => localValue,
            ),
          ),
        ),
      ),
    );

    _keyForm.currentState.validate();

    await tester.pump();

    final Finder messageFinder = find.text(localValue);

    expect(messageFinder, findsOneWidget);
  });
}
