import 'package:dine_deal/controller/tab_controller.dart';
import 'package:dine_deal/utils/colors.dart';
import 'package:dine_deal/widgets/info_buttons.dart';
import 'package:dine_deal/widgets/review_rating.dart';
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
                        "About Page",
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
                        height: Get.height * 0.3,
                        width: Get.width * 0.85,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: const Image(
                            image: AssetImage(
                              "assets/deal.jpeg",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Obx(() {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InfoButtons(
                              title: "About",
                              color: tabController.selectedTab.value == 'About'
                                  ? orange
                                  : Colors.white,
                              textColor:
                                  tabController.selectedTab.value == 'About'
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
                              textColor:
                                  tabController.selectedTab.value == 'Menu'
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
                              textColor:
                                  tabController.selectedTab.value == 'Review'
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Write a review",
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                color: orange,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  "Post",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
