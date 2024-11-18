import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateTimeTable extends StatelessWidget {
  const DateTimeTable(
      {super.key,
      required this.title,
      required this.btnColor,
      required this.textColor});

  final String title;
  final Color btnColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.05,
      width: Get.width * 0.25,
      decoration: BoxDecoration(
        color: btnColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
