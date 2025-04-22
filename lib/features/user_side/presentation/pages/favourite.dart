import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/tab_controller.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/favourite_deals.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/favourite_restaurants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomTabController controller = Get.put(CustomTabController());

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Favourite",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: Get.width * 0.75,
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          hintText: "Search",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: AppColors.surface,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: AppColors.surface,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 55,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Image(
                        image: AssetImage(
                          "assets/filter.png",
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.toggleSelection(true);
                      },
                      child: Column(
                        children: [
                          Obx(() {
                            return AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 300),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: controller.isRestaurantSelected.value
                                    ? AppColors.orange
                                    : Colors.grey,
                              ),
                              child: const Text("Restaurant"),
                            );
                          }),
                          const SizedBox(height: 4),
                          Obx(() {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              height: 2,
                              width: 80,
                              color: controller.isRestaurantSelected.value
                                  ? AppColors.orange
                                  : Colors.transparent,
                            );
                          }),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.toggleSelection(false);
                      },
                      child: Column(
                        children: [
                          Obx(() {
                            return AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 300),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: controller.isRestaurantSelected.value
                                    ? Colors.grey
                                    : AppColors.orange,
                              ),
                              child: const Text("Deals"),
                            );
                          }),
                          const SizedBox(height: 4),
                          Obx(() {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              height: 2,
                              width: 80,
                              color: controller.isRestaurantSelected.value
                                  ? Colors.transparent
                                  : AppColors.orange,
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Obx(
                  () {
                    return controller.isRestaurantSelected.value
                        ? const FavouriteRestaurants()
                        : const FavouriteDeals();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
