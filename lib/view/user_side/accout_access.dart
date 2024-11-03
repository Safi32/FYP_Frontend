import 'package:dine_deal/utils/colors.dart';
import 'package:dine_deal/view/auth_screens/login.dart';
import 'package:dine_deal/view/auth_screens/singup.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:dine_deal/widgets/social_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountAccess extends StatelessWidget {
  const AccountAccess({super.key});

  @override
  Widget build(BuildContext context) {
    // Screen dimensions
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double fontSizeMultiplier =
        screenWidth / 400; // Adjust font size relative to screen width

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                "assets/burger.jpg",
                fit: BoxFit.cover,
              ),
            ),

            // Back Button
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

            // Bottom Content
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
                                color: black,
                                fontSize: 20 * fontSizeMultiplier,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),

                            // Login and Register Buttons
                            Button(
                              title: "Login",
                              color: orange,
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
                              textColor: black,
                              borderColor: Colors.black.withOpacity(0.3),
                            ),
                            SizedBox(height: screenHeight * 0.02),

                            // Divider with "Register with" text
                            Row(
                              children: <Widget>[
                                const Expanded(
                                  child: Divider(
                                    thickness: 1,
                                    color: black,
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
                                      color: black,
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
                                    color: black,
                                  ),
                                  children: const <TextSpan>[
                                    TextSpan(
                                      text: " Guest",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: orange,
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
