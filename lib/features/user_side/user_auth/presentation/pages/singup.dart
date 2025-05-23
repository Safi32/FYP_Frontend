// import 'package:dine_deal/core/resources/app_colors.dart';
// import 'package:dine_deal/features/user_side/presentation/widgets/sign_up_fields.dart';
// import 'package:dine_deal/features/user_side/presentation/widgets/social_login.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../getX/controller/signup_controller.dart';
// import 'login.dart';

// class SignUp extends StatelessWidget {
//   SignUp({super.key});

//   final formKey = GlobalKey<FormState>();
//   final SignUpController controller = Get.put(SignUpController());
//   final emailController = TextEditingController();
//   final usernameController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: true,
//         backgroundColor: AppColors.orange,
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
//                   const Expanded(
//                     child: Center(
//                       child: Text(
//                         "Sign Up",
//                         style: TextStyle(
//                           fontSize: 25,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//                 child: Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(16.0),
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30),
//                   topRight: Radius.circular(30),
//                 ),
//               ),
//               child: SingleChildScrollView(
//                 child: Form(
//                   key: formKey,
//                   child: Column(
//                     children: [
//                       const SizedBox(height: 20),
//                       SignUpFields(
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "Please enter your email address.";
//                           }
//                           final emailRegex =
//                               RegExp(r"^[a-zA-Z0-9._-]+@[a-zA-Z]+\.[a-zA-Z]+$");
//                           if (!emailRegex.hasMatch(value)) {
//                             return "Please enter a valid email address.";
//                           } else if (!value.contains("@") ||
//                               !value.contains(".")) {
//                             return "Please enter a valid email address";
//                           } else if (!value.endsWith("com")) {
//                             return "The email address must end with a valid domain, such as '.com'.";
//                           }
//                           return null;
//                         },
//                         controller: emailController,
//                         hintText: "example@gmail.com",
//                         tag: "Email",
//                         keyboardType: TextInputType.emailAddress,
//                       ),
//                       SignUpFields(
//                         validator: (value) {
//                           if (value!.isEmpty || value.length <= 3) {
//                             return "Username must be at least 3 characters long.";
//                           } else if (value.length > 15) {
//                             return "Username cannot exceed 15 characters.";
//                           }
//                           return null;
//                         },
//                         controller: usernameController,
//                         hintText: "Enter your username",
//                         tag: "Username",
//                         keyboardType: TextInputType.name,
//                       ),
//                       SignUpFields(
//                         validator: (value) {
//                           if (value!.isEmpty || value.length < 6) {
//                             return "Password must contain more than 6 characters";
//                           }
//                           return null;
//                         },
//                         controller: passwordController,
//                         hintText: "Must be at least 8 characters",
//                         tag: "Create Password",
//                       ),
//                       SignUpFields(
//                         validator: (value) {
//                           if (value!.isEmpty || value.length < 6) {
//                             return "Password must contain more than 6 characters";
//                           }
//                           return null;
//                         },
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
//                                             ? AppColors.orange
//                                             : Colors.black,
//                                   ),
//                                 ),
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color:
//                                         controller.selectedPrivacyOption.value
//                                             ? AppColors.orange
//                                             : Colors.transparent,
//                                   ),
//                                   width: 20,
//                                   height: 20,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 8),
//                             const Text(
//                               "I accept the terms and privacy policy",
//                               style: TextStyle(
//                                 fontSize: 15,
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
//                                 borderRadius: BorderRadius.circular(50),
//                               ),
//                               backgroundColor: AppColors.orange,
//                             ),
//                             onPressed: controller.isLoading.value
//                                 ? null
//                                 : () {
//                                     if (formKey.currentState!.validate()) {
//                                       controller.signUp(
//                                         email: emailController.text,
//                                         username: usernameController.text,
//                                         password: passwordController.text,
//                                         confirmPassword:
//                                             confirmPasswordController.text,
//                                       );
//                                     }
//                                   },
//                             child: controller.isLoading.value
//                                 ? const CircularProgressIndicator(
//                                     color: Colors.white,
//                                   )
//                                 : const Text(
//                                     "Register",
//                                     style: TextStyle(
//                                       fontSize: 20,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 30),
//                       const Row(
//                         children: <Widget>[
//                           Expanded(
//                             child: Divider(thickness: 1, color: Colors.grey),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 10.0),
//                             child: Text(
//                               'or',
//                               style: TextStyle(
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: Divider(thickness: 1, color: Colors.grey),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       const Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SocialLogin(
//                             image: "assets/search.png",
//                             title: "Continue with Google",
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       Center(
//                         child: GestureDetector(
//                           onTap: () {
//                             Get.to(() => LoginScreen());
//                           },
//                           child: const Text.rich(
//                             TextSpan(
//                               text: "Already have an account?",
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                               ),
//                               children: <TextSpan>[
//                                 TextSpan(
//                                   text: " Login",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: AppColors.orange,
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
//             )),
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
  SignUp({super.key});

  final formKey = GlobalKey<FormState>();
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
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
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
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      SignUpFields(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your email address.";
                          }
                          final emailRegex =
                              RegExp(r"^[a-zA-Z0-9._-]+@[a-zA-Z]+\.[a-zA-Z]+$");
                          if (!emailRegex.hasMatch(value)) {
                            return "Please enter a valid email address.";
                          } else if (!value.contains("@") ||
                              !value.contains(".")) {
                            return "Please enter a valid email address";
                          } else if (!value.endsWith("com")) {
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
                      Obx(
                        () => Row(
                          children: [
                            GestureDetector(
                              onTap: controller.togglePrivacyOption,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color:
                                        controller.selectedPrivacyOption.value
                                            ? AppColors.orange
                                            : Colors.black,
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        controller.selectedPrivacyOption.value
                                            ? AppColors.orange
                                            : Colors.transparent,
                                  ),
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "I accept the terms and privacy policy",
                              style: TextStyle(
                                fontSize: 15,
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
                          height: Get.height * 0.06,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              backgroundColor: AppColors.orange,
                            ),
                            onPressed: controller.isLoading.value
                                ? null
                                : () {
                                    if (formKey.currentState!.validate()) {
                                      controller.signUp(
                                        email: emailController.text,
                                        username: usernameController.text,
                                        password: passwordController.text,
                                        confirmPassword:
                                            confirmPasswordController.text,
                                      );
                                    }
                                  },
                            child: controller.isLoading.value
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text(
                                    "Register",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Row(
                        children: <Widget>[
                          Expanded(
                            child: Divider(thickness: 1, color: Colors.grey),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'or',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(thickness: 1, color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
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
                          child: const Text.rich(
                            TextSpan(
                              text: "Already have an account?",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: " Login",
                                  style: TextStyle(
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
              ),
            )),
          ],
        ),
      ),
    );
  }
}
