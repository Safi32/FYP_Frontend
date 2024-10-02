import 'package:dine_deal/widgets/forgot_password.dart';
import 'package:dine_deal/widgets/otp.dart';
import 'package:dine_deal/widgets/save_skip_password.dart';
import 'package:dine_deal/widgets/sign_up_fields.dart';
import 'package:dine_deal/widgets/user_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/login_controller.dart';
import '../../utils/colors.dart';
import 'singup.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final String fontName = 'NunitoSans';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final LoginController loginController = Get.put(LoginController());

  void _userEmail(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return EmailInputModal(
          fontName: 'NunitoSans',
          emailController: emailController,
          onContinue: () {
            Navigator.pop(context);
            _userOTP(context);
          },
        );
      },
    );
  }

  void showSlidingUpContainer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return SaveInformationModal(
          fontName: 'NunitoSans',
          onSave: () {
            Navigator.pop(context);
          },
          onSkip: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void _userOTP(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return UserOTPModal(
          fontName: 'NunitoSans',
          onContinue: () {
            Navigator.pop(context);
            _showPasswordResetModal(context);
          },
        );
      },
    );
  }

  void _showPasswordResetModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return PasswordResetModal(
          passwordController: passwordController,
          fontName: "NunitoSans",
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isPasswordVisible = ValueNotifier<bool>(false);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_rounded,
                            size: 30,
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: fontName,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SignUpFields(
                      controller: emailController,
                      hintText: "example@gmail.com",
                      tag: "Email",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    ValueListenableBuilder(
                      valueListenable: isPasswordVisible,
                      builder: (context, value, child) {
                        return SignUpFields(
                          controller: passwordController,
                          hintText: "Password",
                          tag: "Password",
                          keyboardType: TextInputType.text,
                          obscureText: !isPasswordVisible.value,
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              isPasswordVisible.value =
                                  !isPasswordVisible.value;
                            },
                          ),
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _userEmail(context);
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: black,
                              fontWeight: FontWeight.bold,
                              fontFamily: fontName,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Obx(
                      () {
                        return loginController.isLoading.value
                            ? const CircularProgressIndicator()
                            : SizedBox(
                                width: Get.width,
                                height: Get.height * 0.05,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: black,
                                  ),
                                  onPressed: () {
                                    String email = emailController.text;
                                    String password = passwordController.text;
                                    loginController.loginUser(email, password);
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: fontName,
                                    ),
                                  ),
                                ),
                              );
                      },
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: <Widget>[
                        const Expanded(
                          child: Divider(
                            thickness: 1,
                            color: black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'or Login with',
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
                    const SizedBox(height: 50),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => SignUp());
                        },
                        child: Text.rich(
                          TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: fontName,
                              fontWeight: FontWeight.bold,
                              color: black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Signup",
                                style: TextStyle(
                                  fontFamily: fontName,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
