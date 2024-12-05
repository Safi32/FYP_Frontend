// import 'package:dine_deal/core/resources/app_colors.dart';
// import 'package:dine_deal/features/user_side/presentation/getX/controller/tab_controller.dart';
// import 'package:dine_deal/features/user_side/presentation/pages/reservation_table.dart';
// import 'package:dine_deal/features/user_side/presentation/widgets/date_time_table.dart';
// import 'package:dine_deal/widgets/button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ReservationPerson extends StatelessWidget {
//   const ReservationPerson({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final CustomTabController controller = Get.put(CustomTabController());

//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 20),
//           child: Column(
//             children: [
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 child: Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: const Icon(Icons.arrow_back_ios_new_sharp),
//                     ),
//                     const Expanded(
//                       child: Center(
//                         child: Text(
//                           "Reservation",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     DateTimeTable(
//                         title: "Date",
//                         btnColor: Colors.white,
//                         textColor: Colors.black),
//                     DateTimeTable(
//                         title: "Time",
//                         btnColor: AppColors.surface,
//                         textColor: Colors.black),
//                     DateTimeTable(
//                       title: "Person",
//                       btnColor: AppColors.orange,
//                       textColor: Colors.white,
//                     ),
//                     DateTimeTable(
//                       title: "Table",
//                       btnColor: Colors.white,
//                       textColor: Colors.black,
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 20,
//                   vertical: 20,
//                 ),
//                 child: Container(
//                   height: Get.height * 0.03,
//                   width: Get.width,
//                   decoration: const BoxDecoration(
//                     color: AppColors.surface,
//                   ),
//                   child: const Center(
//                     child: const Text(
//                       "Add No Of Person",
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       height: 20,
//                       width: 20,
//                       decoration: BoxDecoration(
//                         color: AppColors.background,
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                       child: const Center(
//                         child: Icon(
//                           Icons.remove,
//                           size: 15,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 20,
//                     ),
//                     const Text(
//                       "1",
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 20,
//                     ),
//                     Container(
//                       height: 20,
//                       width: 20,
//                       decoration: BoxDecoration(
//                         color: AppColors.background,
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                       child: const Center(
//                         child: Icon(
//                           Icons.add,
//                           size: 15,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const Spacer(),
//               SizedBox(
//                 width: Get.width * 0.5,
//                 child: Button(
//                   title: "Next",
//                   color: AppColors.orange,
//                   onPressed: () {
//                     Get.to(
//                       () => const ReservationTable(),
//                     );
//                   },
//                   textColor: AppColors.surface,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/reservation_controller.dart';
import 'package:dine_deal/features/user_side/presentation/pages/reservation_table.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/date_time_table.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReservationPerson extends StatelessWidget {
  const ReservationPerson({super.key});

  @override
  Widget build(BuildContext context) {
    final ReservationsController controller =
        Get.find<ReservationsController>(); // Use the same controller

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              // Header
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
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
                          "Reservation",
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
              // Tabs
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DateTimeTable(
                        title: "Date",
                        btnColor: Colors.white,
                        textColor: Colors.black),
                    DateTimeTable(
                        title: "Time",
                        btnColor: AppColors.surface,
                        textColor: Colors.black),
                    DateTimeTable(
                      title: "Person",
                      btnColor: AppColors.orange,
                      textColor: Colors.white,
                    ),
                    DateTimeTable(
                      title: "Table",
                      btnColor: Colors.white,
                      textColor: Colors.black,
                    ),
                  ],
                ),
              ),
              // Title
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Container(
                  height: Get.height * 0.03,
                  width: Get.width,
                  decoration: const BoxDecoration(
                    color: AppColors.surface,
                  ),
                  child: const Center(
                    child: Text(
                      "Add No Of Persons",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              // Counter for number of persons
              Expanded(
                child: Obx(
                  () => Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Decrease Button
                      GestureDetector(
                        onTap: () {
                          if (controller.numberOfPersons.value > 1) {
                            controller.numberOfPersons.value--;
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.remove,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      // Number of Persons Display
                      Text(
                        "${controller.numberOfPersons.value}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 20),
                      // Increase Button
                      GestureDetector(
                        onTap: () {
                          controller.numberOfPersons.value++;
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              // Next Button
              SizedBox(
                width: Get.width * 0.5,
                child: Button(
                  title: "Next",
                  color: AppColors.orange,
                  onPressed: () {
                    Get.to(() => const ReservationTable());
                  },
                  textColor: AppColors.surface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
