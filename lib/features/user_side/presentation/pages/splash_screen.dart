import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/home/user_admin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  final fontName = 'NunitoSans';

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Get.off(() => const UserAdmin());
    });
    return Scaffold(
      backgroundColor: AppColors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/Logo.png",
              height: 150,
              width: 150,
            ),
          ],
        ),
      ),
    );
  }
}
