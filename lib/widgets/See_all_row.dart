import 'package:dine_deal/utils/colors.dart';
import 'package:flutter/material.dart';

class SeeAllRow extends StatelessWidget {
  const SeeAllRow(
      {super.key,
      required this.title,
      required this.seeAll,
      required double fontSize});

  final String title;
  final String seeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        Text(
          seeAll,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: orange,
          ),
        ),
      ],
    );
  }
}
