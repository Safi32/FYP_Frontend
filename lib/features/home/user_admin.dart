import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/admin_side/admin_auth/presentation/pages/admin_login.dart';
import 'package:dine_deal/features/user_side/user_auth/presentation/pages/login.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAdmin extends StatefulWidget {
  const UserAdmin({super.key});

  @override
  State<UserAdmin> createState() => _UserAdminState();
}

class _UserAdminState extends State<UserAdmin> {
  final String fontName = "NunitoSans";
  Future<void> saveRole(String role, int roleId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_role', role);
    await prefs.setInt('role_id', roleId);
    print("Role saved: $role, Role ID: $roleId");
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
                        await saveRole("Admin", 2);
                        Get.to(() => AdminLogin());
                      },
                    ),
                    const SizedBox(height: 10),
                    Button(
                      title: "User",
                      color: AppColors.orange,
                      textColor: Colors.white,
                      onPressed: () async {
                        await saveRole("User", 1);
                        Get.to(() => LoginScreen());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
