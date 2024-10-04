import 'package:dine_deal/widgets/otp_fields.dart';
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
    return LayoutBuilder(
      builder: (context, constraints) {
        double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
        return AnimatedPadding(
          padding: EdgeInsets.only(
            bottom: keyboardHeight,
          ),
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
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
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
                            "Enter the 4-digit code sent to your email",
                            style: TextStyle(
                              fontFamily: fontName,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OTPFields(
                            hintText: "0",
                          ),
                          OTPFields(
                            hintText: "0",
                          ),
                          OTPFields(
                            hintText: "0",
                          ),
                          OTPFields(
                            hintText: "0",
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: Get.height * 0.05,
                        width: Get.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            elevation: 0,
                          ),
                          onPressed: onContinue,
                          child: Text(
                            "Continue",
                            style: TextStyle(
                              fontFamily: fontName,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
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
