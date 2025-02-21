import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/user_auth/presentation/getX/controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpScreen extends StatelessWidget {
  final SignUpController signUpController = Get.find<SignUpController>();
  final List<TextEditingController> otpControllers =
      List.generate(6, (index) => TextEditingController());
  final RxBool isLoading = false.obs;

  OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final email = Get.arguments['email'];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            Icon(
              Icons.arrow_back_ios_new_sharp,
              color: AppColors.surface,
            ),
            Expanded(
              child: Center(
                child: Text(
                  "OTP Verification",
                  style: TextStyle(
                    color: AppColors.surface,
                  ),
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: AppColors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter the 6-digit OTP sent to $email",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: 50,
                  child: TextField(
                    controller: otpControllers[index],
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 5) {
                        FocusScope.of(context).nextFocus();
                      } else if (value.isEmpty && index > 0) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                  ),
                );
              }),
            ),
            const SizedBox(height: 40),
            // Verify OTP Button
            Obx(
              () => isLoading.value
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        final otp = otpControllers.map((e) => e.text).join();
                        if (otp.length != 6) {
                          Get.snackbar(
                            "Error",
                            "Please enter a valid 6-digit OTP.",
                            backgroundColor: Colors.red,
                            snackPosition: SnackPosition.TOP,
                          );
                          return;
                        }
                        isLoading.value = true;
                        signUpController
                            .verifyOtp(email, otp)
                            .whenComplete(() => isLoading.value = false);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.orange,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 12,
                        ),
                      ),
                      child: const Text(
                        "Verify OTP",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.surface,
                        ),
                      ),
                    ),
            ),
            const SizedBox(height: 20),
            // Resend OTP Button
            TextButton(
              onPressed: () {
                signUpController.sendOtp(email);
                Get.snackbar(
                  "OTP Resent",
                  "A new OTP has been sent to your email.",
                  backgroundColor: Colors.orange,
                  snackPosition: SnackPosition.TOP,
                );
              },
              child: const Text(
                "Resend OTP",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
