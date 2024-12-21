import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/tab_controller.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/deals_for_today.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/family_deals.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/two_person.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DealsScreen extends StatelessWidget {
  DealsScreen({super.key});

  final CustomTabController controller = Get.find<CustomTabController>();

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
                        "Deals",
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
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    controller.tabs.length,
                    (index) => GestureDetector(
                      onTap: () => controller.updateIndex(index),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            controller.tabs[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: controller.selectedIndex.value == index
                                  ? AppColors.orange
                                  : Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          if (controller.selectedIndex.value == index)
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
              const SizedBox(height: 20),
              Expanded(
                child: Obx(() {
                  return controller.selectedIndex.value == 0
                      ? DealsForToday(
                          onClick: () {},
                          buttonText: "Reserve",
                        )
                      : controller.selectedIndex.value == 1
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
