import 'package:dine_deal/widgets/sign_up_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/signup_controller.dart';
import '../../utils/colors.dart';
import 'login.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final String fontName = 'NunitoSans';
  final SignUpController controller = Get.put(SignUpController());
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_rounded, size: 30),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Sign Up",
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
                Column(
                  children: [
                    SignUpFields(
                      controller: emailController,
                      hintText: "example@gmail.com",
                      tag: "Email",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SignUpFields(
                      controller: phoneNumberController,
                      hintText: "0123456789",
                      tag: "Phone Number",
                      keyboardType: TextInputType.phone,
                    ),
                    SignUpFields(
                      controller: passwordController,
                      hintText: "Must be at least 8 characters",
                      tag: "Create Password",
                    ),
                    SignUpFields(
                      controller: confirmPasswordController,
                      hintText: "Repeat password",
                      tag: "Confirm Password",
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Obx(
                  () => Row(
                    children: [
                      GestureDetector(
                        onTap: controller.togglePrivacyOption,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: controller.selectedPrivacyOption.value
                                  ? Colors.blue
                                  : Colors.black,
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: controller.selectedPrivacyOption.value
                                  ? Colors.blue
                                  : Colors.transparent,
                            ),
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "I accept the terms and privacy policy",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: fontName,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => SizedBox(
                    width: Get.width,
                    height: Get.height * 0.05,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: black,
                      ),
                      onPressed: controller.isLoading.value
                          ? null
                          : () async {
                              await controller.signUp(
                                email: emailController.text,
                                phoneNumber: phoneNumberController.text,
                                password: passwordController.text,
                                confirmPassword: confirmPasswordController.text,
                              );
                            },
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: fontName,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => controller.errorMessage.value.isNotEmpty
                      ? Text(
                          controller.errorMessage.value,
                          style: const TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        )
                      : const SizedBox.shrink(),
                ),
                const SizedBox(height: 30),
                Row(
                  children: <Widget>[
                    const Expanded(
                      child: Divider(thickness: 1, color: black),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or Register with',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: fontName,
                          fontWeight: FontWeight.bold,
                          color: black,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(thickness: 1, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => LoginScreen());
                    },
                    child: Text.rich(
                      TextSpan(
                        text: "Already have an account ?",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: fontName,
                          fontWeight: FontWeight.bold,
                          color: black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Login",
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
        ),
      ),
    );
  }
}
