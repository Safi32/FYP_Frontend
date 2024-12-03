import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/admin_side/presentation/getX/controller/list_restaurant_controller.dart';
import 'package:dine_deal/features/admin_side/widgets/restaurant_checkbox.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateArea extends StatelessWidget {
  UpdateArea({super.key});

  final ListRestaurantController controller =
      Get.put(ListRestaurantController());

  final List<String> restaurantInformation = [
    "Basement",
    "Ground Floor",
    "First Floor",
    "Second Floor",
    "Terrace",
    "Roof",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: ListView.builder(
            itemCount: restaurantInformation.length,
            itemBuilder: (context, index) {
              final info = restaurantInformation[index];
              return Obx(
                () => RestaurantCheckbox(
                  title: info,
                  isChecked: controller.selectedRestaurantInfo.contains(info),
                  onChanged: (isSelected) {
                    controller.toggleSelection(
                        info, isSelected!, "restaurantInfo");
                  },
                ),
              );
            },
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Button(
                  title: "Add Area",
                  color: AppColors.orange,
                  onPressed: () {},
                  textColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ],
    );
  }
}
