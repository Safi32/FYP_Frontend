import 'package:dine_deal/utils/colors.dart';
import 'package:dine_deal/view/auth_screens/login.dart';
import 'package:dine_deal/view/auth_screens/singup.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:dine_deal/widgets/social_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccoutAccess extends StatelessWidget {
  const AccoutAccess({super.key});

  final String fontName = "NunitoSans";

  @override
  Widget build(BuildContext context) {
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
                    height: Get.height * 0.45,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Do you have an account?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: black,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Column(
                              children: [
                                Button(
                                  title: "Login",
                                  color: orange,
                                  onPressed: () {
                                    Get.to(() => LoginScreen());
                                  },
                                  textColor: Colors.white,
                                ),
                                const SizedBox(height: 20),
                                Button(
                                  title: "Register",
                                  color: Colors.white,
                                  onPressed: () {
                                    Get.to(() => SignUp());
                                  },
                                  textColor: black,
                                  borderColor: Colors.black.withOpacity(0.3),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: <Widget>[
                                    const Expanded(
                                      child: Divider(
                                        thickness: 1,
                                        color: black,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                        'Register with',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: fontName,
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
                                const SizedBox(height: 20),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SocialLogin(
                                      image: "assets/communication.png",
                                      title: "Login with",
                                    ),
                                    SocialLogin(
                                      image: "assets/search.png",
                                      title: "Login with",
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Positioned(
                                  bottom: 20,
                                  left: 0,
                                  right: 0,
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to(() => SignUp());
                                      },
                                      child: Text.rich(
                                        TextSpan(
                                          text: "or continue as",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: fontName,
                                            fontWeight: FontWeight.bold,
                                            color: black,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: " Guest",
                                              style: TextStyle(
                                                fontFamily: fontName,
                                                fontWeight: FontWeight.bold,
                                                color: orange,
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
