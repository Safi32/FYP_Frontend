import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/admin_side/widgets/cancelled_reservations.dart';
import 'package:dine_deal/features/admin_side/widgets/upcoming_reservation.dart';
import 'package:flutter/material.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
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
                        const Text(
                          "Hi,",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: AppColors.surface,
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
                        ),
                      ],
                    ),
                    const Text(
                      "Have a good day!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              hintText: "Search",
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              fillColor: AppColors.surface,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Image(
                            image: AssetImage(
                              "assets/filter.png",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    const TabBar(
                      indicatorColor: AppColors.orange,
                      labelColor: AppColors.orange,
                      unselectedLabelColor: Colors.grey,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      tabs: [
                        Tab(text: "Upcoming Reservations"),
                        Tab(text: "Cancelled Reservations"),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          UpcomingReservation(),
                          CancelledReservations(),
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
