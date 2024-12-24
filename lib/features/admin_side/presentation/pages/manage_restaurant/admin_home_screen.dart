// import 'package:dine_deal/core/resources/app_colors.dart';
// import 'package:flutter/material.dart';

// class AdminHomeScreen extends StatelessWidget {
//   const AdminHomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height * 0.22,
//               width: MediaQuery.of(context).size.width,
//               decoration: const BoxDecoration(
//                 color: AppColors.orange,
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(50),
//                   bottomRight: Radius.circular(50),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 20,
//                   vertical: 40,
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           height: 40,
//                           width: 40,
//                           decoration: BoxDecoration(
//                             color: AppColors.surface,
//                             borderRadius: BorderRadius.circular(50),
//                           ),
//                           child: const Image(
//                             image: AssetImage(
//                               "assets/menu.png",
//                             ),
//                           ),
//                         ),
//                         Container(
//                           height: 40,
//                           width: 40,
//                           decoration: BoxDecoration(
//                             color: AppColors.surface,
//                             borderRadius: BorderRadius.circular(50),
//                           ),
//                           child: const Icon(
//                             Icons.notifications_none_sharp,
//                             size: 30,
//                           ),
//                         )
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     const Text(
//                       "Marriot Hotel Islamabad",
//                       style: TextStyle(
//                         color: AppColors.surface,
//                         fontSize: 15,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.star,
//                           color: AppColors.yellow,
//                         ),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         const Text(
//                           "4.9",
//                           style: TextStyle(
//                             color: AppColors.surface,
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         Container(
//                           width: 2,
//                           height: 10,
//                           color: AppColors.surface,
//                         ),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         const Text(
//                           "48 reviews",
//                           style: TextStyle(
//                             color: AppColors.surface,
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/admin_side/presentation/getX/controller/get_reservation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the ReservationController instance
    final reservationController = Get.find<GetReservationController>();

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Header Section
            Container(
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: AppColors.orange,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Image(
                            image: AssetImage(
                              "assets/menu.png",
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Icon(
                            Icons.notifications_none_sharp,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Marriot Hotel Islamabad",
                      style: TextStyle(
                        color: AppColors.surface,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: AppColors.yellow,
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          "4.9",
                          style: TextStyle(
                            color: AppColors.surface,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 2,
                          height: 10,
                          color: AppColors.surface,
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          "48 reviews",
                          style: TextStyle(
                            color: AppColors.surface,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Reservation List Section
            Expanded(
              child: Obx(() {
                if (reservationController.reservations.isEmpty) {
                  return const Center(
                    child: Text(
                      'No reservations found.',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: reservationController.reservations.length,
                  itemBuilder: (context, index) {
                    final reservation =
                        reservationController.reservations[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Reservation ID: ${reservation['id']}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text('Time: ${reservation['reservationTime']}'),
                            Text('Date: ${reservation['reservationDate']}'),
                            Text(
                                'Number of Persons: ${reservation['numberOfPersons']}'),
                            Text('Place: ${reservation['reservationPlace']}'),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
