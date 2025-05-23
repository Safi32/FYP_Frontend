import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DealType extends StatelessWidget {
  const DealType({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.08,
      width: Get.width * 0.4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.baige,
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: AppColors.orange,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
