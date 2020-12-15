import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final Function(String) validator;
  final String value;
  final String placeholder;
  final bool autofocus;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget suffixIcon;
  final int maxLength;

  Input({
    Key key,
    this.controller,
    this.value,
    this.placeholder,
    this.onChanged,
    this.validator,
    this.autofocus = false,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(maxLength);
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      initialValue: value,
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType,
      autofocus: autofocus,
      maxLengthEnforced: true,
      maxLength: maxLength,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: placeholder,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
      ),
    );
  }
}
