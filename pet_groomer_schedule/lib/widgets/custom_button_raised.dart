import 'package:flutter/material.dart';

class CustomButtonRaised extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  CustomButtonRaised({@required this.onPressed, @required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      textColor: Colors.white,
      color: Theme.of(context).accentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      child: Text(buttonText),
    );
  }
}
