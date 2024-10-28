import 'package:dine_deal/utils/colors.dart';
import 'package:dine_deal/view/admin_side/personal_details.dart';
import 'package:dine_deal/view/user_side/accout_access.dart';
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
                      color: orange,
                      textColor: Colors.white,
                      onPressed: () {
                        Get.to(() => const PersonalDetails());
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Button(
                      title: "User",
                      color: orange,
                      textColor: Colors.white,
                      onPressed: () {
                        Get.to(() => const AccoutAccess());
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
