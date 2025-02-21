import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/admin_side/presentation/getX/controller/reservation_controller.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/checkbox.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/payment_fields.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  final String restaurantName;
  final int personCount;
  final String selectedDate;
  final String selectedTime;
  final String selectedTable;

  const PaymentScreen({
    super.key,
    required this.restaurantName,
    required this.personCount,
    required this.selectedDate,
    required this.selectedTime,
    required this.selectedTable,
  });

  @override
  Widget build(BuildContext context) {
    final ReservationController reservationController =
        Get.find<ReservationController>();

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              // Header
              Row(
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
                        "Payment",
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

              // Payment Form
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 10,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Add your payment details",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          children: [
                            const PaymentFields(
                              title: "Select your payment method",
                              labelText: "Payment Method",
                            ),
                            const PaymentFields(
                              showDropdown: false,
                              labelText: "Cardholder Name",
                              title: "Enter first and last name",
                              showCardImage: true,
                            ),
                            const PaymentFields(
                              showDropdown: false,
                              labelText: "Card Number",
                              title: "Enter your number",
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Expiry Date",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: Get.width * 0.35,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          hintText: "MM/YY",
                                          hintStyle: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide.none,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "CVV",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: Get.width * 0.35,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          hintText: "123",
                                          hintStyle: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide.none,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CheckboxWithText(
                      labelText: "Save card data for future payment",
                      initialValue: false,
                      onChanged: (bool value) {
                        print("Checkbox is now: $value");
                      },
                    ),
                  ),
                ],
              ),
              const Spacer(),

              // Confirm Reservation Button with Logic
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  child: Button(
                    title: "Confirm Reservation",
                    color: AppColors.orange,
                    onPressed: () async {
                      // Save Reservation Logic
                      await reservationController.saveReservation(
                        restaurant: restaurantName,
                        persons: personCount,
                        date: selectedDate,
                        time: selectedTime,
                        // table: selectedTable,
                      );

                      // Check for errors
                      if (reservationController.errorMessage.value.isEmpty) {
                        Get.snackbar(
                          "Success",
                          "Your reservation has been successfully created!",
                          backgroundColor: Colors.green,
                          colorText: Colors.white,
                        );

                        // Navigate to a confirmation page or home screen
                        // Get.off(() => const ConfirmationScreen());
                      } else {
                        Get.snackbar(
                          "Error",
                          reservationController.errorMessage.value,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }
                    },
                    textColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
