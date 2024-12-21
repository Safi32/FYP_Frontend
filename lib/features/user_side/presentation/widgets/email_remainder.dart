import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class EmailReminder extends StatelessWidget {
  final ValueNotifier<bool> isChecked = ValueNotifier<bool>(false);

  EmailReminder({super.key});

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
        const Text(
          "Email Reminder",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
