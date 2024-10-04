import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sign_up_fields.dart';

class PasswordResetModal extends StatelessWidget {
  final TextEditingController passwordController;
  final String fontName;

  const PasswordResetModal({
    super.key,
    required this.passwordController,
    required this.fontName,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
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
                      "Add a new password to access your account",
                      style: TextStyle(
                        fontFamily: fontName,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 10),
                SignUpFields(
                  controller: passwordController,
                  hintText: "Must be at least 8 characters",
                ),
                SignUpFields(
                  controller: passwordController,
                  hintText: "Confirm Password",
                ),
                SizedBox(
                  height: Get.height * 0.06,
                  width: Get.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
    );
  }
}
