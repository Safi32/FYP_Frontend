import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PastReservationDetails extends StatelessWidget {
  final String tableNumber;
  final int numberOfPersons;
  final RxString status = "Not Checked-In".obs;

  PastReservationDetails({
    super.key,
    required this.tableNumber,
    required this.numberOfPersons,
  });

  Color getStatusColor() {
    switch (status.value) {
      case "Review":
        return Colors.green.shade100;
      case "Cancelled":
        return Colors.red.shade100;
      case "Not Checked-In":
        return Colors.orange.shade100;
      default:
        return Colors.grey.shade300;
    }
  }

  Color getStatusTextColor() {
    switch (status.value) {
      case "Review":
        return Colors.green;
      case "Cancelled":
        return Colors.red;
      case "Not Checked-In":
        return Colors.orange;
      default:
        return Colors.black;
    }
  }

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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/about_restaurant.png",
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Cheezious",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Obx(() {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: getStatusColor(),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          status.value,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: getStatusTextColor(),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Image.asset("assets/Group 39341.png"),
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
                  ],
                ),
              ),
              const SizedBox(height: 10),
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
