import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/admin_side/presentation/getX/controller/list_restaurant_controller.dart';
import 'package:dine_deal/features/admin_side/presentation/pages/manage_restaurant/add_additional_features.dart';
import 'package:dine_deal/features/admin_side/widgets/post_button.dart';
import 'package:dine_deal/features/admin_side/widgets/restaurant_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddSitting extends StatelessWidget {
  AddSitting({super.key});

  final ListRestaurantController controller =
      Get.put(ListRestaurantController());

  final List<String> restaurantInformation = [
    "Inside",
    "Outside",
    "Terrace",
    "Lawn",
    "Roof",
    "Floor Seating (Traditional)",
    "Event Space",
    "Window View Seating",
    "Kids Area",
    "Pool Side",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new_sharp,
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Add Sitting",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 10,
                    decoration: const BoxDecoration(
                      color: AppColors.orange,
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    "List Your Restaurant Deals here.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 25,
                    ),
                    child: Text(
                      "Restaurant Information",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: Text(
                      "Area",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: ListView.builder(
                        itemCount: restaurantInformation.length,
                        itemBuilder: (context, index) {
                          final info = restaurantInformation[index];
                          return Obx(
                            () => RestaurantCheckbox(
                              title: info,
                              isChecked: controller.selectedRestaurantInfo
                                  .contains(info),
                              onChanged: (isSelected) {
                                controller.toggleSelection(
                                    info, isSelected!, "restaurantInfo");
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            PostButton(
              onPressed: () {
                Get.to(() => AddAdditionalFeatures());
              },
              title: "Update",
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
