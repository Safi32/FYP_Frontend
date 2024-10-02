import 'package:flutter/material.dart';

class MainAuthButton extends StatelessWidget {
  const MainAuthButton(
      {super.key,
      required this.text,
      required this.textColor,
      required this.buttonColor,
      required this.function});

  final fontName = 'NunitoSans';
  final String text;
  final Color textColor;
  final Color buttonColor;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.05,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            elevation: 0,
          ),
          onPressed: function,
          child: Text(
            text,
            style: TextStyle(
              fontFamily: fontName,
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
