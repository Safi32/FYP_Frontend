import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/admin_side/admin_auth/presentation/pages/admin_login.dart';
import 'package:dine_deal/features/user_side/presentation/pages/accout_access.dart';
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
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 150,
                        height: 250,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE1CCCC),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 120,
                  left: 100,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "Restaurant",
                      style: TextStyle(
                        color: AppColors.surface,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 150,
                        height: 250,
                        decoration: BoxDecoration(
                          color: AppColors.yellowishBrown,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 120,
                  left: 200,
                  child: SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        "User",
                        style: TextStyle(
                          color: AppColors.surface,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Welcome To Dine Deal !",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppColors.orange,
                      ),
                    ),
                    const Text(
                      "Explore exclusive dinning deals, reserve tables at \n your favorite restaurants, or  join us as a partner.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const Text(
                      "Select your role to get started!",
                      style: TextStyle(
                        color: AppColors.orange,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        Button(
                          title: "Apply For Partnership",
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
                            Get.to(() => const AccountAccess());
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: GestureDetector(
                              onTap: () {},
                              child: const Text.rich(
                                TextSpan(
                                  text: "Explore as ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "Guest",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.orange,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
