import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/admin_side/admin_auth/presentation/pages/admin_login.dart';
import 'package:dine_deal/features/user_side/presentation/pages/accout_access.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAdmin extends StatelessWidget {
  const UserAdmin({super.key});

  final String fontName = "NunitoSans";
  Future<void> _storeRole(String role) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('role', role);
    print("Role stored: $role");
  }

  Future<String> _getRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String role = prefs.getString('role') ?? '';
    print("Stored role: $role");
    return role;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      onPressed: () async {
                        await _storeRole("restaurant");
                        Get.to(() => AdminLogin());
                      },
                    ),
                    const SizedBox(height: 10),
                    Button(
                      title: "User",
                      color: AppColors.orange,
                      textColor: Colors.white,
                      onPressed: () async {
                        await _storeRole("user");
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
