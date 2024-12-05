import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/tab_controller.dart';
import 'package:dine_deal/features/user_side/presentation/pages/reservation_date.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/deal_card.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/info_buttons.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/menu_description.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/window.dart';
import 'package:dine_deal/widgets/button.dart';
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
              Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: Get.height * 0.3,
                        color: Colors.grey.shade300,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: const Image(
                            image: AssetImage(
                              "assets/about_restaurant.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Wrap(
                        spacing: 10,
                        alignment: WrapAlignment.center,
                        children: [
                          Window(
                            image: "assets/about_restaurant.png",
                          ),
                          Window(
                            image: "assets/about_restaurant 2.png",
                          ),
                          Window(
                            image: "assets/about_restaurant.png",
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InfoButtons(
                          title: "About",
                          color: tabController.selectedTab.value == 'About'
                              ? AppColors.orange
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
                              ? AppColors.orange
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
                              ? AppColors.orange
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
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      DealCard(
                        onPressed: () {
                          Get.to(() => const MenuDescription());
                        },
                      ),
                    ],
                  )
                ],
              ),
              const Spacer(),
              SizedBox(
                width: Get.width * 0.45,
                child: Button(
                  title: "Reserve Now",
                  color: AppColors.orange,
                  onPressed: () {
                    Get.to(() => ReservationDate());
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
