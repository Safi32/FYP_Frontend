import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class SeeAllRow extends StatelessWidget {
  const SeeAllRow(
      {super.key,
      required this.title,
      required this.seeAll,
      required double fontSize,
      required this.onPressed});

  final String title;
  final String seeAll;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          GestureDetector(
            onTap: onPressed,
            child: Container(
              height: 30,
              width: 70,
              decoration: BoxDecoration(
                color: AppColors.pink,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  seeAll,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: AppColors.orange,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
