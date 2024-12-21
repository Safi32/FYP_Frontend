import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/tab_controller.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/info_buttons.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/review_rating.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/star_rating.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'about_page.dart';
import 'menu_page.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomTabController tabController = Get.put(CustomTabController());
    tabController.updateTab('Review');
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
                        "Marriot Hotel Islamabad",
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: Get.height * 0.25,
                        width: Get.width * 0.85,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: const Image(
                            image: AssetImage(
                              "assets/main_restaurant.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Obx(() {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InfoButtons(
                              title: "About",
                              color: tabController.selectedTab.value == 'About'
                                  ? AppColors.orange
                                  : Colors.white,
                              textColor:
                                  tabController.selectedTab.value == 'About'
                                      ? Colors.white
                                      : Colors.black,
                              onPressed: () {
                                tabController.updateTab('About');
                                Get.off(() => AboutPage());
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InfoButtons(
                              title: "Deals",
                              color: tabController.selectedTab.value == 'Deals'
                                  ? AppColors.orange
                                  : Colors.white,
                              textColor:
                                  tabController.selectedTab.value == 'Deals'
                                      ? Colors.white
                                      : Colors.black,
                              onPressed: () {
                                tabController.updateTab('Deals');
                                Get.off(() => MenuPage());
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InfoButtons(
                              title: "Review",
                              color: tabController.selectedTab.value == 'Review'
                                  ? AppColors.orange
                                  : Colors.white,
                              textColor:
                                  tabController.selectedTab.value == 'Review'
                                      ? Colors.white
                                      : Colors.black,
                              onPressed: () {
                                tabController.updateTab('Review');
                                Get.off(() => ReviewPage());
                              },
                            ),
                          ],
                        );
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      StarRating(),
                      const SizedBox(height: 20),
                      const ReviewRating(),
                      const SizedBox(height: 10),
                      const ReviewRating(),
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
}
