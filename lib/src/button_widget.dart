import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback onPressed;

  const RoundedButtonWidget({
    Key? key,
    required this.buttonText,
    this.buttonColor = Colors.deepPurple,
    this.textColor = Colors.white,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 35.0,
      minWidth: 370.0,
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      onPressed: onPressed,
      splashColor: Colors.deepPurple[300],
      child: Text(buttonText),
    );
  }
}
