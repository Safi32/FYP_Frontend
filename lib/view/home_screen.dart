import 'package:dine_deal/widgets/main_auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import 'auth_screens/login.dart';
import 'auth_screens/singup.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final fontName = 'NunitoSans';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Welcome to \n  Dine Deal",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  fontFamily: fontName,
                ),
              ),
              Column(
                children: [
                  MainAuthButton(
                    function: () {
                      Get.to(() => LoginScreen(),
                          transition: Transition.native);
                    },
                    text: "Login",
                    textColor: Colors.white,
                    buttonColor: black,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MainAuthButton(
                    function: () {
                      Get.to(() => SignUp(), transition: Transition.native);
                    },
                    text: "Signup",
                    textColor: black,
                    buttonColor: Colors.white,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
