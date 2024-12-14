import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/presentation/pages/user_email.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/forgot_password.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/otp.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/save_skip_password.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/sign_up_fields.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/social_login.dart';
import 'package:dine_deal/features/user_side/user_auth/presentation/getX/controller/verify_otp_controller.dart';
import 'package:dine_deal/features/user_side/user_auth/presentation/pages/singup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getX/controller/login_controller.dart';
import '../getX/controller/otp_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({
    super.key,
  });

  final String fontName = 'NunitoSans';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double fontSizeMultipler = screenWidth / 400;
    final ValueNotifier<bool> isPasswordVisible = ValueNotifier<bool>(false);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.orange,
        body: Form(
          key: _formKey,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: screenHeight * 0.02,
                    ),
                    color: AppColors.orange,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_rounded,
                            size: 30 * fontSizeMultipler,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 25 * fontSizeMultipler,
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
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.05,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: screenHeight * 0.02),
                              SignUpFields(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter your email address.";
                                  } else if (!value.contains("@") ||
                                      !value.contains(".")) {
                                    return "Please enter a valid email address";
                                  } else if (!value.endsWith(".com")) {
                                    return "The email address must end with a valid domain, such as '.com'.";
                                  }
                                  return null;
                                },
                                controller: emailController,
                                hintText: "Enter your gmail here",
                                tag: "Gmail",
                                keyboardType: TextInputType.emailAddress,
                                suffixIcon: const Icon(
                                  Icons.email_outlined,
                                ),
                              ),
                              ValueListenableBuilder(
                                valueListenable: isPasswordVisible,
                                builder: (context, value, child) {
                                  return SignUpFields(
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 6) {
                                        return "Password must contain more than 6 characters";
                                      }
                                      return null;
                                    },
                                    controller: passwordController,
                                    hintText: "Enter your password here",
                                    tag: "Password",
                                    keyboardType: TextInputType.text,
                                    obscureText: !isPasswordVisible.value,
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        isPasswordVisible.value
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                      ),
                                      onPressed: () {
                                        isPasswordVisible.value =
                                            !isPasswordVisible.value;
                                      },
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: screenHeight * 0.01),
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
                                        color: AppColors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: fontName,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Obx(
                                () {
                                  return GestureDetector(
                                    onTap: loginController.isLoading.value
                                        ? null
                                        : () {
                                            loginController.loginUser(
                                              emailController.text.trim(),
                                              passwordController.text.trim(),
                                            );
                                          },
                                    child: Container(
                                      height: 50 * fontSizeMultipler,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: AppColors.orange,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: loginController.isLoading.value
                                          ? const CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Colors.white),
                                            )
                                          : Text(
                                              "Login",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    18 * fontSizeMultipler,
                                              ),
                                            ),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: screenHeight * 0.03),
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
                                      'or',
                                      style: TextStyle(
                                        fontSize: 18 * fontSizeMultipler,
                                        fontFamily: fontName,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    child: Divider(
                                      thickness: 1,
                                      color: AppColors.black,
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: screenHeight * 0.02,
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
                          fontSize: 15 * fontSizeMultipler,
                          fontFamily: fontName,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Signup",
                            style: TextStyle(
                              fontFamily: fontName,
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
        ),
      ),
    );
  }
}
