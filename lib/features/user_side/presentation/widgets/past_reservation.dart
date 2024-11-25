import 'package:dine_deal/features/user_side/presentation/widgets/past_reservation_details.dart';
import 'package:flutter/material.dart';

class PastReservation extends StatelessWidget {
  const PastReservation({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> upcomingReservations = [
      {"tableNumber": "4", "numberOfPersons": 9},
      {"tableNumber": "5", "numberOfPersons": 3},
    ];

    return upcomingReservations.isEmpty
        ? Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/reservation.png", height: 150),
                  const SizedBox(height: 10),
                  const Text(
                    "No Upcoming Reservations",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
          )
        : ListView.builder(
            itemCount: upcomingReservations.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  child: PastReservationDetails(
                    numberOfPersons: 9,
                    tableNumber: "4",
                  ));
            },
          );
  }
}
