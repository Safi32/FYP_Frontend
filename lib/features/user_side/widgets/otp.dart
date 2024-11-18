import 'package:dine_deal/controller/verify_otp_controller.dart';
import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/widgets/otp_fields.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserOTPModal extends StatelessWidget {
  final String fontName;
  final VoidCallback onContinue;

  const UserOTPModal({
    Key? key,
    required this.fontName,
    required this.onContinue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OTPVerificationController otpVerificationController =
        Get.put(OTPVerificationController());

    return LayoutBuilder(
      builder: (context, constraints) {
        double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
        return AnimatedPadding(
          padding: EdgeInsets.only(bottom: keyboardHeight),
          duration: const Duration(milliseconds: 300),
          child: DraggableScrollableSheet(
            expand: true,
            initialChildSize: 0.4,
            minChildSize: 0.2,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Row(
                        children: [
                          Text(
                            "Enter the 4-digit code",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            "Enter the 4-digit code sent to your email",
                            style:
                                TextStyle(fontFamily: fontName, fontSize: 15),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OTPFields(
                              controller:
                                  otpVerificationController.otp1Controller),
                          OTPFields(
                              controller:
                                  otpVerificationController.otp2Controller),
                          OTPFields(
                              controller:
                                  otpVerificationController.otp3Controller),
                          OTPFields(
                              controller:
                                  otpVerificationController.otp4Controller),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Button(
                        title: "Continue",
                        color: AppColors.orange,
                        onPressed: onContinue,
                        textColor: Colors.white,
                      ),
                    ],
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
