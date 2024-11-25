import 'package:dine_deal/features/user_side/presentation/getX/controller/tab_controller.dart';
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
                padding: const EdgeInsets.symmetric(horizontal: 70),
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
                                    ? Colors.orange
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
                                  ? Colors.orange
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
                                    : Colors.orange,
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
                                  : Colors.orange,
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Obx(() {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: Image(
                          key: ValueKey(controller.isRestaurantSelected.value),
                          image: AssetImage(
                            controller.isRestaurantSelected.value
                                ? "assets/fav_table.png"
                                : "assets/fav_table 2.png",
                          ),
                          height: 150,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        controller.isRestaurantSelected.value
                            ? "No Restaurant in favorite"
                            : "No Deals in favorite",
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
