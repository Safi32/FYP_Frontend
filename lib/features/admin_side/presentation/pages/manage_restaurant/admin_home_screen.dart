import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: AppColors.orange,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Image(
                            image: AssetImage(
                              "assets/menu.png",
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Icon(
                            Icons.notifications_none_sharp,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Marriot Hotel Islamabad",
                      style: TextStyle(
                        color: AppColors.surface,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: AppColors.yellow,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "4.9",
                          style: TextStyle(
                            color: AppColors.surface,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 2,
                          height: 10,
                          color: AppColors.surface,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "48 reviews",
                          style: TextStyle(
                            color: AppColors.surface,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
