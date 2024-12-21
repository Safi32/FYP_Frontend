import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/reservation_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpcomingReservations extends StatelessWidget {
  const UpcomingReservations({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> upcomingReservations = [
      {
        "customerName": "Kamran Shah",
        "restaurantName": "Marriot Hotel Islamabad",
        "tableInfo": "Table for 2",
        "reservationDateTime": "Today 14/02, 13:00"
      },
      {
        "customerName": "Ali Khan",
        "restaurantName": "Pearl Continental Lahore",
        "tableInfo": "Table for 4",
        "reservationDateTime": "Today 14/02, 19:00"
      },
    ];

    if (upcomingReservations.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/reservation.png",
                height: 150,
              ),
              const SizedBox(height: 20),
              const Text(
                "No Upcoming Reservations",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: upcomingReservations.length,
      itemBuilder: (context, index) {
        final reservation = upcomingReservations[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: GestureDetector(
            onTap: () {
              Get.to(() => const ReservationDetails());
            },
            child: Card(
              color: AppColors.surface,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reservation['customerName'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Image(
                          image: AssetImage(
                            "assets/grey-prefix.png",
                          ),
                          height: 18,
                          width: 18,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          reservation['restaurantName'],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.chair,
                                size: 18, color: Colors.grey),
                            const SizedBox(width: 5),
                            Text(
                              reservation['tableInfo'],
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.access_time,
                                size: 18, color: Colors.grey),
                            const SizedBox(width: 5),
                            Text(
                              reservation['reservationDateTime'],
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
