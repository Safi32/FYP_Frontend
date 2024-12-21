import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewRating extends StatelessWidget {
  const ReviewRating({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.20,
      width: Get.width * 0.85,
      child: Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    // foregroundImage: AssetImage("assets/Ellipse 1.png"),
                    radius: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      const Text(
                        "Jane Smith",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset(
                        "assets/Group 39341.png",
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  "I Booked a table at Burger Spot in seconds, and it was ready when we arrived—no wait! Great food, super convenient, and loved seeing other reviews before ordering. Perfect for fast-food lovers! ")
            ],
          ),
        ),
      ),
    );
  }
}
