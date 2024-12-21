// import 'package:dine_deal/features/user_side/presentation/getX/controller/tab_controller.dart';
// import 'package:dine_deal/features/user_side/presentation/pages/upcoming_reservations.dart';
// import 'package:dine_deal/features/user_side/presentation/widgets/past_reservation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class Reservation extends StatelessWidget {
//   const Reservation({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final CustomTabController controller = Get.put(CustomTabController());
//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 20),
//           child: Column(
//             children: [
//               const Center(
//                 child: Text(
//                   "Reservations",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 70),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         controller.toggleSelection(true);
//                       },
//                       child: Column(
//                         children: [
//                           Obx(() {
//                             return AnimatedDefaultTextStyle(
//                               duration: const Duration(milliseconds: 300),
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18,
//                                 color: controller.isRestaurantSelected.value
//                                     ? Colors.orange
//                                     : Colors.grey,
//                               ),
//                               child: const Text("Upcoming"),
//                             );
//                           }),
//                           const SizedBox(height: 4),
//                           Obx(() {
//                             return AnimatedContainer(
//                               duration: const Duration(milliseconds: 300),
//                               height: 2,
//                               width: 80,
//                               color: controller.isRestaurantSelected.value
//                                   ? Colors.orange
//                                   : Colors.transparent,
//                             );
//                           }),
//                         ],
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         controller.toggleSelection(false);
//                       },
//                       child: Column(
//                         children: [
//                           Obx(() {
//                             return AnimatedDefaultTextStyle(
//                               duration: const Duration(milliseconds: 300),
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18,
//                                 color: controller.isRestaurantSelected.value
//                                     ? Colors.grey
//                                     : Colors.orange,
//                               ),
//                               child: const Text("Past"),
//                             );
//                           }),
//                           const SizedBox(height: 4),
//                           Obx(() {
//                             return AnimatedContainer(
//                               duration: const Duration(milliseconds: 300),
//                               height: 2,
//                               width: 80,
//                               color: controller.isRestaurantSelected.value
//                                   ? Colors.transparent
//                                   : Colors.orange,
//                             );
//                           }),
//                         ],
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         controller.toggleSelection(false);
//                       },
//                       child: Column(
//                         children: [
//                           Obx(() {
//                             return AnimatedDefaultTextStyle(
//                               duration: const Duration(milliseconds: 300),
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18,
//                                 color: controller.isRestaurantSelected.value
//                                     ? Colors.grey
//                                     : Colors.orange,
//                               ),
//                               child: const Text("Cancelled"),
//                             );
//                           }),
//                           const SizedBox(height: 4),
//                           Obx(() {
//                             return AnimatedContainer(
//                               duration: const Duration(milliseconds: 300),
//                               height: 2,
//                               width: 80,
//                               color: controller.isRestaurantSelected.value
//                                   ? Colors.transparent
//                                   : Colors.orange,
//                             );
//                           }),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Obx(() {
//                   return controller.isRestaurantSelected.value
//                       ? const UpcomingReservations()
//                       : const PastReservation();
//                 }),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/tab_controller.dart';
import 'package:dine_deal/features/user_side/presentation/pages/upcoming_reservations.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/cancelled_reservation.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/past_reservation.dart';
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
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTab(
                      label: "Upcoming",
                      index: 0,
                      controller: controller,
                    ),
                    _buildTab(
                      label: "Past",
                      index: 1,
                      controller: controller,
                    ),
                    _buildTab(
                      label: "Cancelled",
                      index: 2,
                      controller: controller,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Obx(() {
                  return controller.selectedTabIndex.value == 0
                      ? const UpcomingReservations()
                      : controller.selectedTabIndex.value == 1
                          ? const PastReservation()
                          : controller.selectedTabIndex.value == 2
                              ? const CancelledReservation()
                              : const SizedBox.shrink();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab({
    required String label,
    required int index,
    required CustomTabController controller,
  }) {
    return GestureDetector(
      onTap: () => controller.toggleSelections(index),
      child: Column(
        children: [
          Obx(() {
            return AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: controller.selectedTabIndex.value == index
                    ? AppColors.orange
                    : Colors.grey,
              ),
              child: Text(label),
            );
          }),
          const SizedBox(height: 4),
          Obx(() {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 2,
              width: 80,
              color: controller.selectedTabIndex.value == index
                  ? AppColors.orange
                  : Colors.transparent,
            );
          }),
        ],
      ),
    );
  }
}
