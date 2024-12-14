import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/user_auth/presentation/getX/controller/otp_controller.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/sign_up_fields.dart';

class EmailInputModal extends StatelessWidget {
  final String fontName;
  final TextEditingController emailController;
  final VoidCallback onContinue;

  final OtpController otpController = Get.put(OtpController());

  EmailInputModal({
    super.key,
    required this.fontName,
    required this.emailController,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
        return AnimatedPadding(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.only(bottom: keyboardHeight),
          child: DraggableScrollableSheet(
            expand: true,
            initialChildSize: 0.4,
            minChildSize: 0.2,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Row(
                            children: [
                              Text(
                                "I forgot the password",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                "To get the 4-digit verification code \n Contact your email",
                                style: TextStyle(
                                  fontFamily: fontName,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
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
                            hintText: "example@gmail.com",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Button(
                            title: "Continue",
                            color: AppColors.orange,
                            onPressed: onContinue,
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
