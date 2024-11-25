import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/admin_side/presentation/getX/controller/list_restaurant_controller.dart';
import 'package:dine_deal/features/admin_side/presentation/pages/list_restaurant/media_gallery.dart';
import 'package:dine_deal/features/admin_side/widgets/restaurant_checkbox.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurantFeatures extends StatelessWidget {
  RestaurantFeatures({super.key});

  final ListRestaurantController controller =
      Get.put(ListRestaurantController());

  final List<String> restaurantInformation = [
    "Place for pray",
    "Kids friendly",
    "Family style",
    "Parking",
    "WiFi",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.orange,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.white,
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Apply for Partnership",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 20,
                      ),
                      child: Text(
                        "Restaurant and Features",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Text(
                        "Features",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: restaurantInformation.length,
                        itemBuilder: (context, index) {
                          final feature = restaurantInformation[index];
                          return Obx(
                            () => RestaurantCheckbox(
                              title: feature,
                              isChecked:
                                  controller.selectedFeatures.contains(feature),
                              onChanged: (isSelected) {
                                controller.toggleFeature(feature, isSelected!);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: Button(
                        title: "Next",
                        color: AppColors.orange,
                        onPressed: () {
                          Get.to(() => MediaGallery());
                        },
                        textColor: Colors.white,
                      ),
                    ),
                    const Center(
                      child: Text.rich(
                        TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
