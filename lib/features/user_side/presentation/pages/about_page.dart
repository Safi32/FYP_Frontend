import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/tab_controller.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/about_page_description.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/info_buttons.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'menu_page.dart';
import 'review_page.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomTabController tabController = Get.put(CustomTabController());
    tabController.updateTab('About');

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
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
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: Get.height * 0.25,
                      color: Colors.grey.shade300,
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
                  ],
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
                        textColor: tabController.selectedTab.value == 'About'
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
                        textColor: tabController.selectedTab.value == 'Deals'
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
                        textColor: tabController.selectedTab.value == 'Review'
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
                Container(
                  height: MediaQuery.of(context).size.height * 0.33,
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            "Restaurant Information",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AboutPageDescription(),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        children: [
                          Text(
                            "Follow us on",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          Image(
                            image: AssetImage(
                              "assets/Facebook.png",
                            ),
                          ),
                          Image(
                            image: AssetImage(
                              "assets/TwitterX.png",
                            ),
                          ),
                          Image(
                            image: AssetImage(
                              "assets/Instagram.png",
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Additional Features",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image(
                                image: AssetImage(
                                  "assets/truck-fast.png",
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Parking",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image(
                                image: AssetImage(
                                  "assets/truck-fast.png",
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Parking",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image(
                                image: AssetImage(
                                  "assets/truck-fast.png",
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Parking",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image(
                                image: AssetImage(
                                  "assets/truck-fast.png",
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Parking",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  child: Button(
                    title: "Reserve Now",
                    color: AppColors.orange,
                    onPressed: () {},
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
