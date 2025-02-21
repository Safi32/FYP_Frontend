import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/fav_deals.dart';
import 'package:flutter/material.dart';

class FavouriteDeals extends StatelessWidget {
  const FavouriteDeals({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              children: [
                FavDeals(),
                FavDeals(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
