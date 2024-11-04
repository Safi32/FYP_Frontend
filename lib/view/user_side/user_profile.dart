import 'package:dine_deal/utils/colors.dart';
import 'package:dine_deal/widgets/card_widgets.dart';
import 'package:dine_deal/widgets/user_review_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Safiullah Shahid",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const Text(
                "Safiullah@gmail.com",
                style: TextStyle(
                  color: orange,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  children: [
                    UserReviewCard(),
                    UserReviewCard(),
                    UserReviewCard(),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: Get.height * 0.35 ,
                width: Get.width * 0.9,
                child: const Card(
                  elevation: 1,
                  color: Colors.white,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      child: Column(
                        children: [
                          CardWidgets(
                            imageURL: "assets/user.png",
                            title: "Personal Setting",
                            color: Colors.black,
                            icon: Icons.arrow_forward_ios_outlined,
                          ),
                          SizedBox(height: 20),
                          CardWidgets(
                            imageURL: "assets/language.png",
                            title: "Language",
                            color: Colors.black,
                            icon: Icons.arrow_forward_ios_outlined,
                          ),
                          SizedBox(height: 20),
                          CardWidgets(
                            imageURL: "assets/faq.png",
                            title: "Faq's",
                            color: Colors.black,
                            icon: Icons.arrow_forward_ios_outlined,
                          ),
                          SizedBox(height: 20),
                          CardWidgets(
                            imageURL: "assets/faq.png",
                            title: "About app",
                            color: Colors.black,
                            icon: Icons.arrow_forward_ios_outlined,
                          ),
                          SizedBox(height: 20),
                          CardWidgets(
                            imageURL: "assets/faq.png",
                            title: "Terms & Conditions",
                            color: Colors.black,
                            icon: Icons.arrow_forward_ios_outlined,
                          ),
                          SizedBox(height: 20),
                          CardWidgets(
                            imageURL: "assets/logout.png",
                            title: "Logout",
                            color: orange,
                            showIcon: false,
                            icon: Icons.arrow_forward_ios_outlined,
                          ),
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
