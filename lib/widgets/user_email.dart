import 'package:dine_deal/controller/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sign_up_fields.dart';

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
                            controller: emailController,
                            hintText: "example@gmail.com",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: Get.height * 0.06,
                            width: Get.width,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                elevation: 0,
                              ),
                              onPressed: onContinue,
                              child: Obx(() {
                                if (otpController.isLoading.value) {
                                  return const CircularProgressIndicator(
                                    color: Colors.white,
                                  );
                                } else {
                                  return Text(
                                    "Continue",
                                    style: TextStyle(
                                      fontFamily: fontName,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  );
                                }
                              }),
                            ),
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
