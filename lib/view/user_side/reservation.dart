import 'package:dine_deal/controller/tab_controller.dart';
import 'package:dine_deal/features/user_side/widgets/past_reservation.dart';
import 'package:dine_deal/view/user_side/upcoming_reservations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Reservation extends StatelessWidget {
  const Reservation({super.key});

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
                  "Reservations",
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
                              child: const Text("Upcoming"),
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
                              child: const Text("Past"),
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
                  return controller.isRestaurantSelected.value
                      ? const UpcomingReservations()
                      : const PastReservation();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
