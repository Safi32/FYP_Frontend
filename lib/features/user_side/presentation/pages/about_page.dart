import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/tab_controller.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/about_page_description.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/info_buttons.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/window.dart';
import 'package:dine_deal/models/get_restaurant_data_model.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'menu_page.dart';
import 'review_page.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key, required this.restaurant});

  final Restaurant restaurant;

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
                          Get.off(() => AboutPage(restaurant: restaurant));
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
                          Get.off(() => MenuPage(
                                restaurant: restaurant,
                              ));
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
                          Get.off(() => ReviewPage(
                                restaurant: restaurant,
                              ));
                        },
                      ),
                    ],
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.white,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.33,
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
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
                        AboutPageDescription(restaurant: restaurant),
                        Row(
                          children: [
                            Text(
                              "Social Handles",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Row(
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
                        "Restaurant Features",
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
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                        image: AssetImage(
                          "assets/Music.png",
                        ),
                      ),
                      Image(
                        image: AssetImage(
                          "assets/Music.png",
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: Get.width * 0.45,
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
