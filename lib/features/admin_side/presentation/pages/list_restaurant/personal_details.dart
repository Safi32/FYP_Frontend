import 'package:country_code_picker/country_code_picker.dart';
import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/admin_side/admin_auth/presentation/pages/admin_login.dart';
import 'package:dine_deal/features/admin_side/presentation/getX/controller/list_restaurant_controller.dart';
import 'package:dine_deal/features/admin_side/presentation/pages/list_restaurant/social_media.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalDetails extends StatelessWidget {
  PersonalDetails({super.key});

  final ListRestaurantController controller =
      Get.find<ListRestaurantController>();
  final String fontName = "NunitoSans";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.orange,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back,
                          color: Colors.white, size: 30),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          "Apply for Partnership",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: Get.height,
                decoration: const BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Personal Information",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),

                      buildField(
                          "Restaurant Name",
                          "Enter your restaurant name",
                          (value) => controller.updateRestaurantField(
                              "restaurantName", value)),
                      const SizedBox(height: 20),

                      const Text(
                        "Phone Number",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      buildPhoneNumberField(controller),
                      const SizedBox(height: 20),

                      buildField(
                          "Username",
                          "Enter your username",
                          (value) => controller.updateRestaurantField(
                              "username", value)),
                      const SizedBox(height: 20),

                      buildField(
                          "Email",
                          "Enter your email",
                          (value) =>
                              controller.updateRestaurantField("email", value)),
                      const SizedBox(height: 20),

                      buildField(
                          "Password",
                          "Enter your password",
                          (value) => controller.updateRestaurantField(
                              "password", value),
                          isPassword: true),
                      const SizedBox(height: 20),

                      buildField(
                          "Restaurant Address",
                          "Enter your restaurant address",
                          (value) => controller.updateRestaurantField(
                              "restaurantAddress", value)),
                      const SizedBox(height: 40),

                      Button(
                        title: "Next",
                        color: AppColors.orange,
                        onPressed: () {
                          if (controller.restaurantData["username"] == null ||
                              controller.restaurantData["email"] == null ||
                              controller.restaurantData["password"] == null ||
                              controller.restaurantData["restaurantName"] ==
                                  null) {
                            Get.snackbar("Error", "All fields are required.");
                            return;
                          }

                          print("Captured Data: ${controller.restaurantData}");
                          Get.to(() => SocialMedia());
                        },
                        textColor: Colors.white,
                      ),
                      const SizedBox(height: 10),
                      // Already Have an Account
                      GestureDetector(
                        onTap: () {
                          Get.to(() => AdminLogin());
                        },
                        child: Center(
                          child: Text.rich(
                            TextSpan(
                              text: "Already have an account? ",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: fontName,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Login",
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
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildField(String label, String hint, Function(String) onChanged,
      {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        TextFormField(
          onChanged: onChanged,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPhoneNumberField(ListRestaurantController controller) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          const CountryCodePicker(
            onChanged: print,
            initialSelection: 'US',
            favorite: ['+1', 'US'],
            showCountryOnly: false,
            showOnlyCountryWhenClosed: false,
            alignLeft: false,
          ),
          const VerticalDivider(color: Colors.grey, width: 1, thickness: 1),
          Expanded(
            child: TextFormField(
              onChanged: (value) =>
                  controller.updateRestaurantField("phoneNumber", value),
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                border: InputBorder.none,
                hintText: "Enter your phone number",
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
        ],
      ),
    );
  }
}
