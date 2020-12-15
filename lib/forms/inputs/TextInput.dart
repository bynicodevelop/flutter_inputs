import 'package:flutter/material.dart';
import 'package:flutter_inputs/forms/Input.dart';

class TextInput extends StatelessWidget {
  final Function(String) onChanged;
  final Function(String) validator;
  final String placeholder;
  final String value;
  final TextEditingController controller;
  final bool autofocus;
  final int maxLength;

  const TextInput({
    Key key,
    this.placeholder,
    this.value,
    this.controller,
    this.validator,
    this.maxLength,
    @required this.onChanged,
    this.autofocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Input(
      value: value,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      keyboardType: TextInputType.text,
      autofocus: autofocus,
      placeholder: placeholder,
      maxLength: maxLength,
    );
  }
}
