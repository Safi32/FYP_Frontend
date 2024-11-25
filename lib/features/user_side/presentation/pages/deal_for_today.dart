import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/deal_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DealForToday extends StatelessWidget {
  const DealForToday({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_sharp,
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          "Deals For Today",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: Get.width * 0.7,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Search",
                            hintStyle: const TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 18,
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              size: 30,
                              color: AppColors.textSecondary,
                            ),
                            fillColor: AppColors.surface,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: AppColors.surface,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: AppColors.surface,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: Get.height * 0.06,
                        width: 50,
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset("assets/filter.png"),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    DealCard(
                      onPressed: () {},
                    ),
                    DealCard(
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
