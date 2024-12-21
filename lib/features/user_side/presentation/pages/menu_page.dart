import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/tab_controller.dart';
import 'package:dine_deal/features/user_side/presentation/pages/deal_details.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/deals_for_today.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/family_deals.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/info_buttons.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/two_person.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'about_page.dart';
import 'review_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomTabController tabController = Get.put(CustomTabController());
    tabController.updateTab('Deals');

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
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: Get.height * 0.25,
                    color: Colors.grey.shade300,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const Image(
                        image: AssetImage("assets/main_restaurant.png"),
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
                    const SizedBox(width: 10),
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
                    const SizedBox(width: 10),
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
              SizedBox(
                height: 20,
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    tabController.tabs.length,
                    (index) => GestureDetector(
                      onTap: () => tabController.updateIndex(index),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            tabController.tabs[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: tabController.selectedIndex.value == index
                                  ? AppColors.orange
                                  : Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          if (tabController.selectedIndex.value == index)
                            Container(
                              height: 2,
                              width: 100,
                              color: AppColors.orange,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Obx(() {
                  return tabController.selectedIndex.value == 0
                      ? DealsForToday(
                          onClick: () {
                            Get.to(() => DealDetails());
                          },
                          buttonText: "Add",
                          showRestaurants: false,
                        )
                      : tabController.selectedIndex.value == 1
                          ? const TwoPerson()
                          : const FamilyDeals();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
