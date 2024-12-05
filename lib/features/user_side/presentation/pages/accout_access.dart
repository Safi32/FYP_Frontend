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

  // Method to get the stored role
  Future<String> _getRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String role = prefs.getString('role') ??
        ''; // Get the stored role or empty string if not set
    print("User role: $role"); // Print the role to the console
    return role;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double fontSizeMultiplier = screenWidth / 400;

    // Call _getRole() to print the user role
    _getRole();

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/burger.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: Colors.white,
                ),
              ),
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
                            Text(
                              "Do you have an account?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.black,
                                fontSize: 20 * fontSizeMultiplier,
                              ),
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
                              color: Colors.white,
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
                                    'Register with',
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
                                  text: "or continue as",
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
