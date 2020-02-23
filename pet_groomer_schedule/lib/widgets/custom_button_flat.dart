import 'package:flutter/material.dart';

class CustomButtonFlat extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  CustomButtonFlat({@required this.onPressed, @required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      textColor: Colors.black,
      child: Text(buttonText),
    );
  }
}
