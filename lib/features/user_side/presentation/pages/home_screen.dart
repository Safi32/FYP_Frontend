import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/presentation/pages/about_page.dart';
import 'package:dine_deal/features/user_side/presentation/pages/deal_for_today.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/See_all_row.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/deal_type.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/deals_images.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/restaurant_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double fontSizeMultiplier = screenWidth / 400;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: screenHeight * 0.25,
                decoration: const BoxDecoration(
                  color: AppColors.orange,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Location",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15 * fontSizeMultiplier,
                            ),
                          ),
                          Container(
                            height: screenHeight * 0.05,
                            width: screenHeight * 0.05,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(screenWidth * 0.02),
                              child: Image.asset("assets/bell.png",
                                  fit: BoxFit.contain),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                      child: Row(
                        children: [
                          Icon(Icons.location_on,
                              color: Colors.white,
                              size: 18 * fontSizeMultiplier),
                          SizedBox(width: screenWidth * 0.02),
                          Text(
                            "I-14 Islamabad",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15 * fontSizeMultiplier,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Icon(Icons.keyboard_arrow_down_rounded,
                              color: Colors.yellow),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Search",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14 * fontSizeMultiplier,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Icon(Icons.search,
                                    color: Colors.grey,
                                    size: 18 * fontSizeMultiplier),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.03),
                          Container(
                            height: screenHeight * 0.06,
                            width: screenWidth * 0.13,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(screenWidth * 0.02),
                              child: Image.asset("assets/filter.png",
                                  fit: BoxFit.contain),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Wrap(
                            spacing: screenWidth * 0.025,
                            children: [
                              DealType(title: "All"),
                              GestureDetector(
                                  onTap: () {
                                    Get.to(() => const DealForToday());
                                  },
                                  child: DealType(title: "Deal For Today")),
                              DealType(title: "Deal For Family"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    SeeAllRow(
                      title: "Deal For Today",
                      seeAll: "See All",
                      fontSize: 18 * fontSizeMultiplier,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    DealsImages(
                      imageURL1: "assets/fries.png",
                      imageURL2: "assets/pizza_fries.png",
                      imageURL3: "assets/Burger.png",
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    SeeAllRow(
                      title: "Restaurants Near You",
                      seeAll: "See All",
                      fontSize: 18 * fontSizeMultiplier,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Wrap(
                            spacing: screenWidth * 0.025,
                            children: [
                              RestaurantList(
                                onPressed: () =>
                                    Get.to(() => const AboutPage()),
                                ratingTextStyle: TextStyle(
                                  fontSize: 14 * fontSizeMultiplier,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              RestaurantList(
                                onPressed: () =>
                                    Get.to(() => const AboutPage()),
                                ratingTextStyle: TextStyle(
                                  fontSize: 14 * fontSizeMultiplier,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              RestaurantList(
                                onPressed: () =>
                                    Get.to(() => const AboutPage()),
                                ratingTextStyle: TextStyle(
                                  fontSize: 14 * fontSizeMultiplier,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    SeeAllRow(
                      title: "Two Persons Deal",
                      seeAll: "See All",
                      fontSize: 18 * fontSizeMultiplier,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    DealsImages(
                      imageURL1: "assets/fries.png",
                      imageURL2: "assets/pizza_fries.png",
                      imageURL3: "assets/Burger.png",
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    SeeAllRow(
                      title: "Family Deal",
                      seeAll: "See All",
                      fontSize: 18 * fontSizeMultiplier,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    DealsImages(
                      imageURL1: "assets/fries.png",
                      imageURL2: "assets/pizza_fries.png",
                      imageURL3: "assets/Burger.png",
                    ),
                    SizedBox(height: screenHeight * 0.03),
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
