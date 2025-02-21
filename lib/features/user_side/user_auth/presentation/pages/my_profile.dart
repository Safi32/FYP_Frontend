import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/user_auth/widgets/text_form_field.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text(
            "My Profile",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: CircleAvatar(
                    backgroundColor: AppColors.orange,
                    radius: 50,
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Personal Information",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 15),
                TextFormFieldWidget(
                  tag: "Username",
                  controller: TextEditingController(),
                ),
                const SizedBox(height: 15),
                TextFormFieldWidget(
                    tag: "Gender", controller: TextEditingController()),
                const SizedBox(height: 15),
                const Text(
                  "Contact Information",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 15),
                TextFormFieldWidget(
                    tag: "Email", controller: TextEditingController()),
                const SizedBox(height: 15),
                TextFormFieldWidget(
                    tag: "Phone Number", controller: TextEditingController()),
                const SizedBox(height: 30),
                Center(
                  child: Button(
                    title: "Save",
                    color: AppColors.orange,
                    onPressed: () {},
                    textColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
