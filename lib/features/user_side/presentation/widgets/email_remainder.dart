import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class EmailReminder extends StatelessWidget {
  final ValueNotifier<bool> isChecked = ValueNotifier<bool>(false);

  final String title;

  EmailReminder({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder<bool>(
          valueListenable: isChecked,
          builder: (context, value, child) {
            return Checkbox(
              value: value,
              onChanged: (newValue) {
                isChecked.value = newValue!;
              },
              activeColor: AppColors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            );
          },
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
