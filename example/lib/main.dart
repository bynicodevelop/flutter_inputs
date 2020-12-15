import 'package:flutter/material.dart';
import 'package:flutter_inputs/MainButton.dart';
import 'package:flutter_inputs/forms/inputs/EmailInput.dart';
import 'package:flutter_inputs/forms/inputs/PasswordInput.dart';
import 'package:flutter_inputs/forms/inputs/TextInput.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _emailController;
  TextEditingController _usernameController;
  TextEditingController _passwordController;

  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        buttonTheme:
            ButtonThemeData(buttonColor: Theme.of(context).primaryColor),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Form(
            key: _keyForm,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: EmailInput(
                    controller: _emailController,
                    placeholder: 'Enter your email',
                    onChanged: (value) => print(value),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextInput(
                    controller: _usernameController,
                    placeholder: 'Enter your username',
                    onChanged: (value) => print(value),
                    validator: (value) =>
                        value.isEmpty ? 'Please enter your username' : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PasswordInput(
                    controller: _passwordController,
                    placeholder: 'Enter your password',
                    onChanged: (value) => print(value),
                    validator: (value) => value.isEmpty
                        ? 'Enter a password (min: 6 chars)'
                        : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MainButton(
                    label: 'Main Button',
                    onPressed: () async {
                      if (_keyForm.currentState.validate()) {
                        await Future.delayed(Duration(seconds: 2));

                        print(_emailController.text);
                        print(_usernameController.text);
                        print(_passwordController.text);
                      }
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}
