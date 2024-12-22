import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/timer_controller.dart';
import 'package:dine_deal/features/user_side/presentation/pages/menu_page.dart';
import 'package:dine_deal/features/user_side/presentation/pages/payment_screen.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/detail_notes_textfield.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/email_remainder.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/reservation_info.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class ReviewInformation extends StatelessWidget {
  final String restaurantName;
  final int personCount;
  final String selectedDate;
  final String selectedTime;
  final String selectedTable;

  const ReviewInformation({
    super.key,
    required this.restaurantName,
    required this.personCount,
    required this.selectedDate,
    required this.selectedTime,
    required this.selectedTable,
  });

  Future<Map<String, String?>> getUserDetails() async {
    const storage = FlutterSecureStorage();
    final email = await storage.read(key: 'user_email');
    final fullName = await storage.read(key: 'user_name');

    print("Retrieved Email: $email");
    print("Retrieved Username: $fullName");

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
                  ),
                ),
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
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Email Address: $email",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                EmailReminder(
                                  title: "Email Remainder",
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 10),
                const Row(
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
                SizedBox(
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
                                    "Explore deals",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    "Offering 20+ deals",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const MenuPage());
                                },
                                child: const Icon(
                                  Icons.add_circle_outline_outlined,
                                  color: AppColors.orange,
                                  size: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(color: Colors.grey),
                        ),
                        const DetailNotesTextField(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Button(
                  title: "Reserve",
                  color: AppColors.orange,
                  onPressed: () {
                    timerController.timeRemaining.value = 0;
                    Get.to(() => const PaymentScreen());
                  },
                  textColor: AppColors.surface,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatTimeRemaining(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }
}
