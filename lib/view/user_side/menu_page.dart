import 'package:dine_deal/controller/tab_controller.dart';
import 'package:dine_deal/utils/colors.dart';
import 'package:dine_deal/view/user_side/reservation_date.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:dine_deal/widgets/info_buttons.dart';
import 'package:dine_deal/widgets/window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'about_page.dart';
import 'review_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomTabController tabController = Get.put(CustomTabController());
    tabController.updateTab('Menu');

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios_new_sharp),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Menu Page",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: Get.height * 0.3,
                    color: Colors.grey.shade300,
                  ),
                  Wrap(
                    spacing: 10,
                    alignment: WrapAlignment.center,
                    children: const [
                      Window(
                        image: "assets/about_restaurant.png",
                      ),
                      Window(
                        image: "assets/about_restaurant.png",
                      ),
                      Window(
                        image: "assets/about_restaurant.png",
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InfoButtons(
                      title: "About",
                      color: tabController.selectedTab.value == 'About'
                          ? orange
                          : Colors.white,
                      textColor: tabController.selectedTab.value == 'About'
                          ? Colors.white
                          : Colors.black,
                      onPressed: () {
                        tabController.updateTab('About');
                        Get.off(() => const AboutPage());
                      },
                    ),
                    InfoButtons(
                      title: "Menu",
                      color: tabController.selectedTab.value == 'Menu'
                          ? orange
                          : Colors.white,
                      textColor: tabController.selectedTab.value == 'Menu'
                          ? Colors.white
                          : Colors.black,
                      onPressed: () {
                        tabController.updateTab('Menu');
                        Get.off(() => const MenuPage());
                      },
                    ),
                    InfoButtons(
                      title: "Review",
                      color: tabController.selectedTab.value == 'Review'
                          ? orange
                          : Colors.white,
                      textColor: tabController.selectedTab.value == 'Review'
                          ? Colors.white
                          : Colors.black,
                      onPressed: () {
                        tabController.updateTab('Review');
                        Get.off(() => const ReviewPage());
                      },
                    ),
                  ],
                );
              }),
              const Spacer(),
              SizedBox(
                width: Get.width * 0.45,
                child: Button(
                  title: "Reserve Now",
                  color: orange,
                  onPressed: () {
                    Get.to(() => const ReservationDate());
                  },
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
