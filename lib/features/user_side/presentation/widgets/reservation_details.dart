import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/admin_side/presentation/getX/controller/reservation_controller.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/timer_controller.dart';
import 'package:dine_deal/features/user_side/presentation/pages/reservation.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/detail_notes_textfield.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/reservation_info.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReservationDetails extends StatelessWidget {
  final String restaurantName;
  final int personCount;
  final String selectedDate;
  final String selectedTime;
  final String selectedTable;

  const ReservationDetails({
    super.key,
    required this.restaurantName,
    required this.personCount,
    required this.selectedDate,
    required this.selectedTime,
    required this.selectedTable,
  });

  Future<Map<String, String?>> getUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('user_email');
    final fullName = prefs.getString('user_name');
    return {
      'email': email,
      'username': fullName,
    };
  }

  void onBackPressed(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final TimerController timerController = Get.find<TimerController>();
    final ReservationController reservationController =
        Get.find<ReservationController>();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => onBackPressed(context),
                      child: const Icon(Icons.arrow_back_ios_new_sharp),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          "Review Information",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Obx(
                  () => ReservationInfo(
                    restaurantName: restaurantName,
                    tableInfo: "Table for $personCount",
                    dateTime: "$selectedDate, $selectedTime",
                    timeRemaining: _formatTimeRemaining(
                      timerController.timeRemaining.value,
                    ),
                    tableNumber: "Table number $selectedTable",
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Text(
                      "Contact Info",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                FutureBuilder<Map<String, String?>>(
                  future: getUserDetails(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return const Text(
                        "Failed to load user details.",
                        style: TextStyle(color: Colors.red),
                      );
                    } else {
                      final userDetails = snapshot.data ?? {};
                      final fullName = userDetails['username'] ?? 'N/A';
                      final email = userDetails['email'] ?? 'N/A';
                      print("Loaded Full Name: $fullName, Email: $email");
                      return SizedBox(
                        width: Get.width,
                        child: Card(
                          elevation: 1,
                          color: AppColors.surface,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Full Name: $fullName",
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Email Address: $email",
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Add Deals (optional)",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: SizedBox(
                    height: Get.height * 0.38,
                    child: Card(
                      elevation: 1,
                      color: AppColors.surface,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Noodles",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      "Two Person Deal",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Image(
                                      image: AssetImage(
                                        "assets/_button.png",
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: const Image(
                                        image: AssetImage(
                                          "assets/+button.png",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          const DetailNotesTextField(),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Button(
                    title: "Cancel Booking",
                    color: Colors.white,
                    onPressed: () {
                      _showConfirmationDialog(context);
                    },
                    textColor: AppColors.orange,
                    borderColor: AppColors.orange,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text(
            "Confirmation",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            "Do you want to cancel this event?",
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Get.to(() => const Reservation());
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Booking canceled successfully."),
                  ),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: AppColors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
              ),
              child: const Text("Yes"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                foregroundColor: AppColors.orange,
                backgroundColor: Colors.white,
                side: const BorderSide(color: AppColors.orange),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
              ),
              child: const Text("No"),
            ),
          ],
        );
      },
    );
  }

  String _formatTimeRemaining(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }
}
