import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/admin_side/admin_auth/presentation/getX/controller/admin_loginController.dart';
import 'package:dine_deal/features/admin_side/presentation/pages/list_restaurant/personal_details.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/sign_up_fields.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/social_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminLogin extends StatefulWidget {
  AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final String fontName = 'NunitoSans';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AdminLoginController adminLoginController =
      Get.find<AdminLoginController>();

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
        body: Stack(
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
                          Icons.arrow_back_ios_new_sharp,
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
                              hintText: "Enter your email here",
                              tag: "Email",
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
                                      return "Password must be 6 characters long";
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
                                Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: fontName,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Obx(
                              () {
                                return GestureDetector(
                                  onTap: () {
                                    if (emailController.text == '' ||
                                        passwordController.text == '') {
                                      return;
                                    }
                                    adminLoginController.adminLogin(
                                        emailController.text,
                                        passwordController.text);
                                  },
                                  child: Container(
                                    height: 50 * fontSizeMultipler,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.orange,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: adminLoginController.isLoading.value
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
                                              fontSize: 18 * fontSizeMultipler,
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
                    Get.to(() => PersonalDetails());
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
                          text: "Apply for partnership",
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
    );
  }
}
