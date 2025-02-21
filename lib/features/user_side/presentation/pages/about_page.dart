import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/admin_side/presentation/pages/manage_restaurant/add_sitting.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/get_restaurant_controller.dart';
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
    final restaurantController = Get.find<RestaurantController>();
    final restaurant = restaurantController.selectedRestaurant.value;
    final CustomTabController tabController = Get.find<CustomTabController>();
    tabController.updateTab('About');

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios_new_sharp),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          restaurant?.restaurantName ?? "Pizza Hut",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: Get.height * 0.25,
                    width: double.infinity,
                    color: Colors.grey.shade300,
                    child: Image.network(
                      restaurant?.image ?? "assets/about_restaurant.png",
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.image_not_supported);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Tab Buttons
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
                          Get.off(() => const MenuPage());
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
                          Get.off(() => const ReviewPage());
                        },
                      ),
                    ],
                  );
                }),
                const SizedBox(height: 20),

                const Text(
                  "Restaurant Information",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                AboutPageDescription(
                  restaurantType: _formatList(restaurant?.restaurantType),
                  location: restaurant?.restaurantAddress ?? "N/A",
                  operationalHours: restaurant?.operationalHours ?? "N/A",
                  sitting: _formatList(
                      restaurant?.restaurantInfo ?? ["Not Specified"]),
                  minPriceRange: restaurant?.minPriceRange?.toString() ?? "N/A",
                  maxPriceRange: restaurant?.maxPriceRange?.toString() ?? "N/A",
                ),

                const SizedBox(height: 20),

                const Text(
                  "Follow us on",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Image.asset("assets/Facebook.png", width: 40),
                      const SizedBox(width: 10),
                      Image.asset("assets/TwitterX.png", width: 40),
                      const SizedBox(width: 10),
                      Image.asset("assets/Instagram.png", width: 40),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Additional Features Section
                const Text(
                  "Additional Features",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/truck-fast.png", width: 30),
                            const SizedBox(width: 10),
                            const Text(
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
                            Image.asset("assets/truck-fast.png", width: 30),
                            const SizedBox(width: 10),
                            const Text(
                              "Live Music",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/truck-fast.png", width: 30),
                            const SizedBox(width: 10),
                            const Text(
                              "Outdoor Seating",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset("assets/truck-fast.png", width: 30),
                            const SizedBox(width: 10),
                            const Text(
                              "Live Music",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Button(
                  title: "Reserve Now",
                  color: AppColors.orange,
                  onPressed: () {
                    Get.to(
                      () => const AddSitting(),
                    );
                  },
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatList(dynamic list) {
    if (list is List<String>) {
      return list.join(", ");
    }
    return list?.toString() ?? "N/A";
  }
}
