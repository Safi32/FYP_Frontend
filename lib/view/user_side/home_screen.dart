import 'package:dine_deal/utils/colors.dart';
import 'package:dine_deal/widgets/See_all_row.dart';
import 'package:dine_deal/widgets/about_restaurants.dart';
import 'package:dine_deal/widgets/deal_type.dart';
import 'package:dine_deal/widgets/deals_images.dart';
import 'package:dine_deal/widgets/restaurant_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.25,
                child: Container(
                  decoration: const BoxDecoration(
                    color: orange,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Location",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            Container(
                              height: Get.height * 0.05,
                              width: Get.width * 0.12,
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Image.asset(
                                "assets/bell.png",
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/location_on.png",
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "I-14 Islamabad",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Colors.yellow,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Search",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Image.asset(
                                    "assets/search (2).png",
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              height: Get.height * 0.06,
                              width: Get.width * 0.15,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(
                                  "assets/filter.png",
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Wrap(
                            spacing: 10,
                            children: [
                              DealType(title: "All"),
                              DealType(title: "Deal For Today"),
                              DealType(title: "Deal For Family"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SeeAllRow(
                      title: "Deal For Today",
                      seeAll: "See All",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DealsImages(
                      imageURL1: "assets/fries.png",
                      imageURL2: "assets/pizza_fries.png",
                      imageURL3: "assets/Burger.png",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SeeAllRow(
                      title: "Restaurants Near You",
                      seeAll: "See All",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Wrap(
                            spacing: 10,
                            children: [
                              RestaurantList(
                                onPressed: () {
                                  Get.to(() => const AboutRestaurants());
                                },
                              ),
                              RestaurantList(
                                onPressed: () {},
                              ),
                              RestaurantList(
                                onPressed: () {},
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SeeAllRow(
                      title: "Two Persons Deal",
                      seeAll: "See All",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DealsImages(
                      imageURL1: "assets/fries.png",
                      imageURL2: "assets/pizza_fries.png",
                      imageURL3: "assets/Burger.png",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SeeAllRow(
                      title: "Family Deal",
                      seeAll: "See All",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DealsImages(
                      imageURL1: "assets/fries.png",
                      imageURL2: "assets/pizza_fries.png",
                      imageURL3: "assets/Burger.png",
                    ),
                    SizedBox(
                      height: 30,
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
