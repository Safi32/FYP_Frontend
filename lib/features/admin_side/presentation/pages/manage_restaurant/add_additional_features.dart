import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/admin_side/presentation/getX/controller/list_restaurant_controller.dart';
import 'package:dine_deal/features/admin_side/widgets/post_button.dart';
import 'package:dine_deal/features/admin_side/widgets/restaurant_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAdditionalFeatures extends StatelessWidget {
  AddAdditionalFeatures({super.key});

  final ListRestaurantController controller =
      Get.put(ListRestaurantController());

  final List<String> restaurantInformation = [
    "Place for pray",
    "Kids friendly",
    "Parking",
    "Free WiFi",
    "Birthday area",
    "Rest Room",
    "Live Music",
    "Live Qawali"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                        "Add Additional Features",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
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
              const SizedBox(height: 30),
              const Text(
                "Restaurant and Features",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Features",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 10),
              // Displaying the checkboxes
              Column(
                children: restaurantInformation.map((feature) {
                  return Obx(
                    () => RestaurantCheckbox(
                      title: feature,
                      isChecked: controller.selectedFeatures.contains(feature),
                      onChanged: (isSelected) {
                        controller.toggleFeature(feature, isSelected!);
                      },
                    ),
                  );
                }).toList(),
              ),
              // Spacer to push the button to the bottom
              const Spacer(),
              PostButton(
                onPressed: () {
                  // Add your functionality here
                  print("Updated!");
                },
                title: "Update",
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
