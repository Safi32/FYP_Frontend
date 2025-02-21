import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/social_login.dart';
import 'package:dine_deal/features/user_side/user_auth/presentation/pages/login.dart';
import 'package:dine_deal/features/user_side/user_auth/presentation/pages/singup.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountAccess extends StatelessWidget {
  const AccountAccess({super.key});

  Future<String> _getRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String role = prefs.getString('role') ?? '';
    print("User role: $role");
    return role;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double fontSizeMultiplier = screenWidth / 400;
    _getRole();

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Column(
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
                            height: 200,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE1CCCC),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 90,
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
                        height: 200,
                        decoration: BoxDecoration(
                          color: AppColors.yellowishBrown,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 90,
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
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: SizedBox(
                    height: screenHeight * 0.45,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.05,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 5,
                              width: 200,
                              color: AppColors.black,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Let's Get Started !",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.orange,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Log In or register an account",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Button(
                              title: "Login",
                              color: AppColors.orange,
                              onPressed: () {
                                Get.to(() => LoginScreen());
                              },
                              textColor: Colors.white,
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Button(
                              title: "Register",
                              color: Colors.grey.shade300,
                              onPressed: () {
                                Get.to(() => SignUp());
                              },
                              textColor: AppColors.black,
                              borderColor: Colors.black.withOpacity(0.3),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Row(
                              children: <Widget>[
                                const Expanded(
                                  child: Divider(
                                    thickness: 1,
                                    color: AppColors.black,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.025),
                                  child: Text(
                                    'Or',
                                    style: TextStyle(
                                      fontSize: 18 * fontSizeMultiplier,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                                const Expanded(
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SocialLogin(
                                  image: "assets/search.png",
                                  title: "Continue with Google",
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => SignUp());
                              },
                              child: Text.rich(
                                TextSpan(
                                  text: "explore as",
                                  style: TextStyle(
                                    fontSize: 15 * fontSizeMultiplier,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.black,
                                  ),
                                  children: const <TextSpan>[
                                    TextSpan(
                                      text: " Guest",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.orange,
                                      ),
                                    ),
                                  ],
                                ),
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
    );
  }
}
