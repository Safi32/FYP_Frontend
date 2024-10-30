import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget(
      {super.key,
      required this.color,
      required this.title,
      required this.textColor});

  final String title;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.20,
      height: Get.height * 0.04,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
