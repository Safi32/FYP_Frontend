import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/models/restaurant_model.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/filter_restaurants.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/get_restaurant_controller.dart';
import 'package:dine_deal/features/user_side/presentation/pages/about_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilteredRestaurantsScreen extends StatelessWidget {
  final FilterRestaurants controller = Get.find<FilterRestaurants>();
  final RestaurantController restaurantController =
      Get.find<RestaurantController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.orange,
        title: const Text(
          "Filtered Restaurants",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.filteredRestaurants.isEmpty) {
            return const Center(
                child: Text("No filtered restaurants available"));
          }
          return ListView.builder(
            itemCount: controller.filteredRestaurants.length,
            itemBuilder: (context, index) {
              final restaurantData = controller.filteredRestaurants[index];
              final RestaurantModel restaurant =
                  RestaurantModel.fromJson(restaurantData);

              return GestureDetector(
                onTap: () {
                  Get.to(() => AboutPage());
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: 180,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(restaurant.imageURL),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              restaurant.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                                "Choose from a variety of bowl options and tas.."),
                            const SizedBox(height: 10),
                            const Row(
                              children: [
                                Image(
                                    image: AssetImage("assets/truck-fast.png")),
                                SizedBox(width: 5),
                                Text("20+ deals"),
                                SizedBox(width: 10),
                                Image(image: AssetImage("assets/timer.png")),
                                SizedBox(width: 5),
                                Text("40-50 mins"),
                                SizedBox(width: 10),
                                Image(
                                    image:
                                        AssetImage("assets/star-Filled.png")),
                                SizedBox(width: 10),
                                Text("4.9"),
                              ],
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
