import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/colors.dart';

class OTPFields extends StatelessWidget {
  const OTPFields({super.key, required this.hintText});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      width: 64,
      child: TextField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "NunitoSans",
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: black,
            ),
          ),
        ),
        style: Theme.of(context).textTheme.titleLarge,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
