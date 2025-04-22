import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReservationInfo extends StatelessWidget {
  final String restaurantName;
  final String tableInfo;
  final String dateTime;
  final String timeRemaining;
  final String tableNumber;

  const ReservationInfo({
    super.key,
    required this.restaurantName,
    required this.tableInfo,
    required this.dateTime,
    required this.timeRemaining,
    required this.tableNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.width * 0.7,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppColors.orange,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "This table is reserved for you",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  timeRemaining,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: [
                const Image(
                  image: AssetImage(
                    "assets/grey-prefix.png",
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    restaurantName,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 30, color: Colors.grey),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: [
                const Image(
                  image: AssetImage(
                    "assets/grey-person.png",
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    tableInfo,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 30, color: Colors.grey),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: [
                Image(
                  image: AssetImage(
                    "assets/grey-clock.png",
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    dateTime,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 30, color: Colors.grey),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: [
                const Image(
                  image: AssetImage(
                    "assets/table_bar.png",
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    tableNumber,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
