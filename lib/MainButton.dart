import 'package:flutter/material.dart';

class MainButton extends StatefulWidget {
  final Function onPressed;
  final String label;

  const MainButton({
    Key key,
    @required this.label,
    @required this.onPressed,
  }) : super(key: key);

  @override
  _MainButtonState createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
      ),
      onPressed: _loading
          ? null
          : () async {
              setState(() => _loading = !_loading);
              await widget.onPressed();
              setState(() => _loading = !_loading);
            },
      child: Text(
        widget.label.toUpperCase(),
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
