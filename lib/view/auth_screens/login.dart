import 'package:dine_deal/controller/verify_otp_controller.dart';
import 'package:dine_deal/view/auth_screens/singup.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:dine_deal/widgets/forgot_password.dart';
import 'package:dine_deal/widgets/otp.dart';
import 'package:dine_deal/widgets/save_skip_password.dart';
import 'package:dine_deal/widgets/sign_up_fields.dart';
import 'package:dine_deal/widgets/social_login.dart';
import 'package:dine_deal/widgets/user_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/login_controller.dart';
import '../../controller/otp_controller.dart';
import '../../utils/colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final String fontName = 'NunitoSans';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController otpEmailController = TextEditingController();

  final LoginController loginController = Get.put(LoginController());

  void _userEmail(BuildContext context) {
    final OtpController otpController = Get.put(OtpController());
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return EmailInputModal(
          fontName: 'NunitoSans',
          emailController: otpEmailController,
          onContinue: () {
            String email = otpEmailController.text.trim();
            if (email.isNotEmpty) {
              otpController.sendOtp(email).then((_) {
                if (otpController.otpSent.value) {
                  Navigator.pop(context);
                  _userOTP(context);
                } else {
                  Get.snackbar('Error', 'Failed to send OTP');
                }
              });
            } else {
              Get.snackbar('Error', 'Please enter an email');
            }
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
    final OTPVerificationController otpVerificationController =
        Get.put(OTPVerificationController());
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return UserOTPModal(
          fontName: 'NunitoSans',
          onContinue: () async {
            String otp = otpVerificationController.getEnteredOtp();
            bool isVerified = await otpVerificationController.verifyOtp(otp);
            if (isVerified) {
              Navigator.pop(context);
              _showPasswordResetModal(context);
            } else {
              Get.snackbar(
                'Error',
                otpVerificationController.errorMessage.value,
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.red,
                colorText: Colors.white,
                duration: const Duration(seconds: 3),
              );
            }
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
        backgroundColor: orange,
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  color: orange,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_rounded,
                          size: 30,
                          color: Colors.white,
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
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            SignUpFields(
                              controller: emailController,
                              hintText: "Enter your email here",
                              tag: "Email",
                              keyboardType: TextInputType.emailAddress,
                            ),
                            ValueListenableBuilder(
                              valueListenable: isPasswordVisible,
                              builder: (context, value, child) {
                                return SignUpFields(
                                  controller: passwordController,
                                  hintText: "Enter your password here",
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
                            const SizedBox(height: 10),
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
                            const SizedBox(height: 20),
                            Obx(
                              () {
                                return loginController.isLoading.value
                                    ? const CircularProgressIndicator()
                                    : Button(
                                        title: "Login",
                                        color: orange,
                                        onPressed: () {},
                                        textColor: Colors.white,
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
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
                                    color: black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
                      text: "Don't have an account? ",
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
      ),
    );
  }
}
