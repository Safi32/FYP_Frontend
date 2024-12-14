import 'package:flutter/material.dart';

class RestaurantTypeCheckBox extends StatefulWidget {
  const RestaurantTypeCheckBox({super.key, required this.title});

  final String title;

  @override
  _CheckBoxWithTextState createState() => _CheckBoxWithTextState();
}

class _CheckBoxWithTextState extends State<RestaurantTypeCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value ?? false;
            });
          },
        ),
        Text(
          widget.title,
          style: const TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}
