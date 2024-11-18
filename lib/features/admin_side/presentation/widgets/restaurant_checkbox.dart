import 'package:flutter/material.dart';

class RestaurantCheckbox extends StatefulWidget {
  final String title;

  const RestaurantCheckbox({super.key, required this.title});

  @override
  State<RestaurantCheckbox> createState() => _RestaurantCheckboxState();
}

class _RestaurantCheckboxState extends State<RestaurantCheckbox> {
  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChanged,
          onChanged: (bool? value) {
            setState(() {
              isChanged = value ?? false;
            });
          },
        ),
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
