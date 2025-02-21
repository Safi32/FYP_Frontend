import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/user_auth/presentation/getX/controller/logout_controller.dart';
import 'package:dine_deal/features/user_side/user_auth/presentation/pages/my_profile.dart';
import 'package:dine_deal/features/user_side/user_auth/presentation/pages/password_security.dart';
import 'package:dine_deal/features/user_side/user_auth/widgets/user_profile_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final LogoutController logoutController = Get.find<LogoutController>();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.orange,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Safiullah Shahid",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Text(
                  "DineDeal@gmail.com",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Wrap(
                  runSpacing: 30,
                  children: [
                    UserProfileDetails(
                      imageUrl: "assets/profile.png",
                      title: "My Profile",
                      onPressed: () {
                        Get.to(() => const MyProfile());
                      },
                    ),
                    UserProfileDetails(
                      imageUrl: "assets/review.png",
                      title: "Reviews",
                      onPressed: () {},
                    ),
                    UserProfileDetails(
                      imageUrl: "assets/location.png",
                      title: "Password & Security",
                      onPressed: () {
                        Get.to(() => PasswordSecurity());
                      },
                    ),
                    UserProfileDetails(
                      imageUrl: "assets/payment_methods.png",
                      title: "Payment Methods",
                      onPressed: () {},
                    ),
                    UserProfileDetails(
                      imageUrl: "assets/customer_support.png",
                      title: "Contact Customer Support",
                      onPressed: () {},
                    ),
                    UserProfileDetails(
                      imageUrl: "assets/setting.png",
                      title: "Settings",
                      onPressed: () {},
                    ),
                    UserProfileDetails(
                      imageUrl: "assets/faqs.png",
                      title: "Help & FAQ",
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        bool confirmLogout = await _showLogoutDialog(context);
                        if (confirmLogout) {
                          logoutController.logout();
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.orange,
                          ),
                          borderRadius: BorderRadius.circular(
                            50,
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image(
                              image: AssetImage(
                                "assets/logout.png",
                              ),
                            ),
                            Text(
                              "Log out",
                              style: TextStyle(
                                color: AppColors.orange,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
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

Future<bool> _showLogoutDialog(BuildContext context) async {
  return await Get.dialog(
        AlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () => Get.back(result: false),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () => Get.back(result: true),
              child: const Text(
                "Logout",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ) ??
      false;
}
