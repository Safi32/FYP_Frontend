import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/admin_side/presentation/pages/personal_details.dart';
import 'package:dine_deal/features/user_side/presentation/pages/accout_access.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAdmin extends StatelessWidget {
  const UserAdmin({super.key});

  final String fontName = "NunitoSans";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Who are You?",
                  style: TextStyle(
                    fontFamily: fontName,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    Button(
                      title: "Be Partner",
                      color: AppColors.orange,
                      textColor: Colors.white,
                      onPressed: () {
                        Get.to(() => PersonalDetails());
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Button(
                      title: "User",
                      color: AppColors.orange,
                      textColor: Colors.white,
                      onPressed: () {
                        Get.to(() => const AccountAccess());
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
