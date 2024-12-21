import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/tab_controller.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/Categories_widget.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/location_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});
  final CustomTabController controller = Get.put(CustomTabController());

  @override
  Widget build(BuildContext context) {
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
                        "Brunch",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    child: Container(
                      height: Get.height * 0.06,
                      width: Get.width * 0.13,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.filter_alt, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.toggleSelection(true); // Select "All"
                      },
                      child: Column(
                        children: [
                          Obx(() {
                            return Text(
                              "All",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: controller.isRestaurantSelected.value
                                    ? AppColors.orange
                                    : Colors.grey,
                              ),
                            );
                          }),
                          Obx(() {
                            return Container(
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
                        controller.toggleSelection(false); // Select "Near Me"
                      },
                      child: Column(
                        children: [
                          Obx(() {
                            return Text(
                              "Near Me",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: controller.isRestaurantSelected.value
                                    ? Colors.grey
                                    : AppColors.orange,
                              ),
                            );
                          }),
                          Obx(() {
                            return Container(
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
              const SizedBox(height: 20),
              Expanded(
                child: Obx(() {
                  return controller.isRestaurantSelected.value
                      ? const CategoriesWidget()
                      : const LocationWidget();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
