import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/user_auth/presentation/getX/controller/change_password_controller.dart';
import 'package:dine_deal/features/user_side/user_auth/widgets/text_form_field.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordSecurity extends StatelessWidget {
  PasswordSecurity({super.key});

  final ChangePasswordController changePasswordController =
      Get.find<ChangePasswordController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          title: const Text(
            "Password & Security",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: [
              TextFormFieldWidget(
                controller: changePasswordController.oldPasswordController,
                tag: "Old Password",
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormFieldWidget(
                controller: changePasswordController.newPasswordController,
                tag: "New Password",
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormFieldWidget(
                controller: changePasswordController.confirmPasswordController,
                tag: "Confirm Password",
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Obx(
                () => Button(
                  title: "Update Password",
                  color: AppColors.orange,
                  onPressed: () {},
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
