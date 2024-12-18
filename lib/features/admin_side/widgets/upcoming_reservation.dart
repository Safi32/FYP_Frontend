import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/admin_side/presentation/getX/controller/reservation_controller.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpcomingReservation extends StatelessWidget {
  UpcomingReservation({super.key});

  final ReservationController reservationController =
      Get.find<ReservationController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (reservationController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else if (reservationController.errorMessage.isNotEmpty) {
        return Center(
          child: Text(reservationController.errorMessage.value),
        );
      } else if (reservationController.reservations.isEmpty) {
        return _buildNoReservations();
      } else {
        return _buildReservationList();
      }
    });
  }

  // Widget for "No Reservations"
  Widget _buildNoReservations() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/reservation.png", height: 200, width: 200),
          const SizedBox(height: 20),
          const Text(
            "No Upcoming Reservations",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReservationList() {
    return ListView.builder(
      itemCount: reservationController.reservations.length,
      itemBuilder: (context, index) {
        final reservation = reservationController.reservations[index];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SizedBox(
            height: 150,
            child: Card(
              elevation: 1,
              color: AppColors.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildReservationHeader(reservation['username'] ?? 'N/A'),
                    const SizedBox(height: 10),
                    _buildReservationDetails(
                      reservation['formattedDate'] ?? "Invalid Date",
                      reservation['formattedTime'] ?? "N/A",
                      reservation['tableNumber']?.toString() ?? 'N/A',
                      reservation['numberOfPersons']?.toString() ?? 'N/A',
                    ),
                    const SizedBox(height: 15),
                    _buildActionButtons(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildReservationHeader(String username) {
    return Text(
      username,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildReservationDetails(
      String date, String time, String table, String persons) {
    print("Number of Persons passed to UI: $persons");
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildInfoRow("assets/calendar_month.png", "$date "),
        _buildInfoRow("assets/clock.png", "$time "),
        _buildInfoRow("assets/table_bar.png", "Table: $table"),
        _buildInfoRow("assets/group.png", "Persons: $persons"),
      ],
    );
  }

  Widget _buildInfoRow(String imagePath, String value) {
    return Row(
      children: [
        Image.asset(imagePath, height: 20, width: 20),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildActionButton("Reject", Colors.grey.shade300, AppColors.black, () {
          print("Reservation Rejected");
        }),
        const SizedBox(width: 10),
        _buildActionButton("Accept", AppColors.orange, AppColors.surface, () {
          print("Reservation Accepted");
        }),
      ],
    );
  }

  Widget _buildActionButton(
      String title, Color color, Color textColor, VoidCallback onPressed) {
    return SizedBox(
      height: 35,
      width: 110,
      child: Button(
        title: title,
        color: color,
        textColor: textColor,
        onPressed: onPressed,
      ),
    );
  }
}
