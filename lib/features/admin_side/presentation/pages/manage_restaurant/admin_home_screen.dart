import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/admin_side/presentation/getX/controller/admin_side_tab_controller.dart';
import 'package:dine_deal/features/admin_side/presentation/getX/controller/reservation_tabs_controller.dart';
import 'package:dine_deal/features/admin_side/widgets/my_drawer.dart';
import 'package:dine_deal/features/admin_side/widgets/restaurant_ongoing_reservation.dart';
import 'package:dine_deal/features/admin_side/widgets/restaurant_past_reservation.dart';
import 'package:dine_deal/features/admin_side/widgets/restaurant_upcoming_reservation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminHomeScreenController toggleController =
        Get.put(AdminHomeScreenController());
    final ReservationTabsController reservationTabsController =
        Get.put(ReservationTabsController());
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const MyDrawer(),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: AppColors.orange,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
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
                        GestureDetector(
                          onTap: () {
                            _scaffoldKey.currentState?.openDrawer();
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: AppColors.surface,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Image(
                              image: AssetImage("assets/menu.png"),
                            ),
                          ),
                        ),
                        // Notification Icon
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
                        ),
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
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Taking Reservations",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Obx(
                          () => Switch(
                            activeColor: AppColors.orange,
                            value: toggleController.isSwitched.value,
                            onChanged: (value) {
                              toggleController.toggleSwitch();
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "With this button, you can manage your reservation effortlessly.Turn it ON to start accepting bookings or OFF to pause reservations as per your restaurant's needs",
                      maxLines: 3,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Reservation History",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TabBar(
                      controller: reservationTabsController.tabController,
                      labelColor: AppColors.orange,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: AppColors.orange,
                      tabs: reservationTabsController.tabs
                          .map((tab) => Tab(text: tab))
                          .toList(),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Reservations",
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "(04)",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: AppColors.orange,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: reservationTabsController.tabController,
                        children: const [
                          RestaurantUpcomingReservation(),
                          RestaurantOngoingReservation(),
                          RestaurantPastReservation(),
                        ],
                      ),
                    ),
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
 

  // Expanded(
            //   child: Obx(() {
            //     if (reservationController.reservations.isEmpty) {
            //       return const Center(
            //         child: Text(
            //           'No reservations found.',
            //           style: TextStyle(fontSize: 18, color: Colors.grey),
            //         ),
            //       );
            //     }

            //     return ListView.builder(
            //       itemCount: reservationController.reservations.length,
            //       itemBuilder: (context, index) {
            //         final reservation =
            //             reservationController.reservations[index];
            //         return Card(
            //           margin: const EdgeInsets.symmetric(
            //             horizontal: 20,
            //             vertical: 10,
            //           ),
            //           elevation: 3,
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(15),
            //           ),
            //           child: Padding(
            //             padding: const EdgeInsets.all(15.0),
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text(
            //                   'Reservation ID: ${reservation['id']}',
            //                   style: const TextStyle(
            //                     fontWeight: FontWeight.bold,
            //                   ),
            //                 ),
            //                 const SizedBox(height: 5),
            //                 Text('Time: ${reservation['reservationTime']}'),
            //                 Text('Date: ${reservation['reservationDate']}'),
            //                 Text(
            //                     'Number of Persons: ${reservation['numberOfPersons']}'),
            //                 Text('Place: ${reservation['reservationPlace']}'),
            //               ],
            //             ),
            //           ),
            //         );
            //       },
            //     );
            //   }),
            // ),