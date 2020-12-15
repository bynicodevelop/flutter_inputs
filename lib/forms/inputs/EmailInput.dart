import 'package:flutter/material.dart';
import 'package:flutter_inputs/forms/Input.dart';

// ignore: must_be_immutable
class EmailInput extends StatelessWidget {
  final Function(String) onChanged;
  Function(String) validator;
  final String value;
  final String placeholder;
  final bool autofocus;
  final TextEditingController controller;

  EmailInput({
    Key key,
    this.value,
    this.placeholder,
    this.onChanged,
    this.validator,
    this.controller,
    this.autofocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegExp emailRegex = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");

    if (validator == null) {
      validator = (value) => value.isEmpty || !emailRegex.hasMatch(value)
          ? 'Please enter a valid email'
          : null;
    }

    return Input(
      value: value,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      keyboardType: TextInputType.emailAddress,
      autofocus: autofocus,
      placeholder: placeholder,
    );
  }
}
