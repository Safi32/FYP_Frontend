import 'package:dine_deal/utils/colors.dart';
import 'package:dine_deal/view/user_side/user_admin.dart';
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
      backgroundColor: orange,
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
