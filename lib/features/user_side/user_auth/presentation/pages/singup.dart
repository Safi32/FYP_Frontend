// import 'package:dine_deal/widgets/sign_up_fields.dart';
// import 'package:dine_deal/widgets/social_login.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../controller/signup_controller.dart';
// import '../../utils/colors.dart';
// import 'login.dart';

// class SignUp extends StatelessWidget {
//   SignUp({Key? key}) : super(key: key);

//   final String fontName = 'NunitoSans';
//   final SignUpController controller = Get.put(SignUpController());
//   final emailController = TextEditingController(); // Moved email first
//   final usernameController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: true,
//         backgroundColor: orange,
//         body: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
//               child: Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: const Icon(
//                       Icons.arrow_back_rounded,
//                       size: 30,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Expanded(
//                     child: Center(
//                       child: Text(
//                         "Sign Up",
//                         style: TextStyle(
//                           fontSize: 25,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: fontName,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(16.0),
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                   ),
//                 ),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       const SizedBox(height: 20),
//                       SignUpFields(
//                         controller: emailController,
//                         hintText: "example@gmail.com",
//                         tag: "Email",
//                         keyboardType: TextInputType.emailAddress,
//                       ),
//                       SignUpFields(
//                         controller: usernameController,
//                         hintText: "Enter your username",
//                         tag: "Username",
//                         keyboardType: TextInputType.name,
//                       ),
//                       SignUpFields(
//                         controller: passwordController,
//                         hintText: "Must be at least 8 characters",
//                         tag: "Create Password",
//                       ),
//                       SignUpFields(
//                         controller: confirmPasswordController,
//                         hintText: "Repeat password",
//                         tag: "Confirm Password",
//                       ),
//                       const SizedBox(height: 10),
//                       Obx(
//                         () => Row(
//                           children: [
//                             GestureDetector(
//                               onTap: controller.togglePrivacyOption,
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   border: Border.all(
//                                     color:
//                                         controller.selectedPrivacyOption.value
//                                             ? orange
//                                             : Colors.black,
//                                   ),
//                                 ),
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color:
//                                         controller.selectedPrivacyOption.value
//                                             ? orange
//                                             : Colors.transparent,
//                                   ),
//                                   width: 20,
//                                   height: 20,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 8),
//                             Text(
//                               "I accept the terms and privacy policy",
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontFamily: fontName,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       Obx(
//                         () => SizedBox(
//                           width: Get.width,
//                           height: Get.height * 0.06,
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               backgroundColor: orange,
//                             ),
//                             onPressed: controller.isLoading.value
//                                 ? null
//                                 : () async {
//                                     await controller.signUp(
//                                       email: emailController.text,
//                                       username: usernameController.text,
//                                       password: passwordController.text,
//                                       confirmPassword:
//                                           confirmPasswordController.text,
//                                     );
//                                   },
//                             child: controller.isLoading.value
//                                 ? const CircularProgressIndicator(
//                                     color: Colors.white,
//                                   )
//                                 : Text(
//                                     "Sign Up",
//                                     style: TextStyle(
//                                       fontSize: 20,
//                                       fontFamily: fontName,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Obx(() {
//                         if (controller.errorMessage.value.isNotEmpty) {
//                           Get.snackbar(
//                             'Error',
//                             controller.errorMessage.value,
//                             backgroundColor: Colors.red,
//                             snackPosition: SnackPosition.TOP,
//                           );
//                           controller.errorMessage.value =
//                               ''; // Clear error after showing
//                         }
//                         return SizedBox.shrink();
//                       }),
//                       const SizedBox(height: 30),
//                       const Row(
//                         children: <Widget>[
//                           Expanded(
//                             child: Divider(thickness: 1, color: black),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 10.0),
//                             child: Text(
//                               'Or',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: black,
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: Divider(thickness: 1, color: Colors.black),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SocialLogin(
//                             image: "assets/search.png",
//                             title: "Continue with Google",
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Center(
//                         child: GestureDetector(
//                           onTap: () {
//                             Get.to(() => LoginScreen());
//                           },
//                           child: Text.rich(
//                             TextSpan(
//                               text: "Already have an account ?",
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontFamily: fontName,
//                                 fontWeight: FontWeight.bold,
//                                 color: black,
//                               ),
//                               children: <TextSpan>[
//                                 TextSpan(
//                                   text: " Login",
//                                   style: TextStyle(
//                                     fontFamily: fontName,
//                                     fontWeight: FontWeight.bold,
//                                     color: orange,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/sign_up_fields.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/social_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getX/controller/signup_controller.dart';
import 'login.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final String fontName = 'NunitoSans';
  final SignUpController controller = Get.put(SignUpController());
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.orange,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Sign Up",
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
            // Form Section
            Expanded(
                child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
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
                      tag: "Email",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SignUpFields(
                      validator: (value) {
                        if (value!.isEmpty || value.length <= 3) {
                          return "Username must be at least 3 characters long.";
                        } else if (value.length > 15) {
                          return "Username cannot exceed 15 characters.";
                        }
                        return null;
                      },
                      controller: usernameController,
                      hintText: "Enter your username",
                      tag: "Username",
                      keyboardType: TextInputType.name,
                    ),
                    SignUpFields(
                      validator: (value) {
                        if (value!.isEmpty || value.length < 6) {
                          return "Password must contain more than 6 characters";
                        }
                        return null;
                      },
                      controller: passwordController,
                      hintText: "Must be at least 8 characters",
                      tag: "Create Password",
                    ),
                    SignUpFields(
                      validator: (value) {
                        if (value!.isEmpty || value.length < 6) {
                          return "Password must contain more than 6 characters";
                        }
                        return null;
                      },
                      controller: confirmPasswordController,
                      hintText: "Repeat password",
                      tag: "Confirm Password",
                    ),
                    const SizedBox(height: 10),
                    // Privacy Policy Checkbox
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
                                      ? AppColors.orange
                                      : Colors.black,
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: controller.selectedPrivacyOption.value
                                      ? AppColors.orange
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
                    // Sign Up Button
                    Obx(
                      () => SizedBox(
                        width: Get.width,
                        height: Get.height * 0.06,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: AppColors.orange,
                          ),
                          onPressed: controller.isLoading.value
                              ? null
                              : () async {
                                  await controller.signUp(
                                    email: emailController.text,
                                    username: usernameController.text,
                                    password: passwordController.text,
                                    confirmPassword:
                                        confirmPasswordController.text,
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
                    const SizedBox(height: 30),
                    // Divider
                    const Row(
                      children: <Widget>[
                        Expanded(
                          child: Divider(thickness: 1, color: Colors.black),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(thickness: 1, color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Social Login Option
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialLogin(
                          image: "assets/search.png",
                          title: "Continue with Google",
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => LoginScreen());
                        },
                        child: Text.rich(
                          TextSpan(
                            text: "Already have an account?",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: fontName,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: " Login",
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
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
