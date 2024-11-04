import 'package:dine_deal/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReservationDetails extends StatelessWidget {
  final String tableNumber;
  final int numberOfPersons;

  const ReservationDetails({
    super.key,
    required this.tableNumber,
    required this.numberOfPersons,
  });

  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat('dd MMM').format(DateTime.now());
    final String formattedTime = DateFormat('hh:mm a').format(DateTime.now());

    return SizedBox(
      height: Get.height * 0.18,
      width: Get.width * 0.9,
      child: Card(
        elevation: 1,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/about_restaurant.png",
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Row(
                  children: [
                    const Text(
                      "Cheezious",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.dialog(
                          AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            title: const Text(
                              "Are you sure you want to cancel reservation?",
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                            actions: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      side: const BorderSide(color: orange),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    onPressed: () => Get.back(),
                                    child: const Text(
                                      "Cancel",
                                      style: TextStyle(color: orange),
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: orange,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text(
                                      "Confirm",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.close,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                subtitle: Row(
                  children: [
                    Image.asset(
                      "assets/Group 39341.png",
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      "(4.8)",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: Get.height * 0.03,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/calendar_month.png",
                          height: 24,
                          width: 24,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          formattedDate,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Image(
                          image: AssetImage(
                            "assets/clock.png",
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          formattedTime,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Image.asset(
                          "assets/table_bar.png",
                          height: 24,
                          width: 24,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          tableNumber,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Image.asset(
                          "assets/group.png",
                          height: 24,
                          width: 24,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '$numberOfPersons ',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
