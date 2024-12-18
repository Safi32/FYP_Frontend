// import 'package:dine_deal/core/resources/app_colors.dart';
// import 'package:dine_deal/features/user_side/presentation/getX/controller/get_restaurant_controller.dart';
// import 'package:dine_deal/features/user_side/presentation/pages/filter_screen.dart';
// import 'package:dine_deal/features/user_side/presentation/widgets/See_all_row.dart';
// import 'package:dine_deal/features/user_side/presentation/widgets/deals_images.dart';
// import 'package:dine_deal/features/user_side/presentation/widgets/restaurant_list.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final RestaurantController controller = Get.put(RestaurantController());
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//     double fontSizeMultiplier = screenWidth / 400;

//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 height: screenHeight * 0.25,
//                 decoration: const BoxDecoration(
//                   color: AppColors.orange,
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(30),
//                     bottomRight: Radius.circular(30),
//                   ),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Location",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 15 * fontSizeMultiplier,
//                             ),
//                           ),
//                           Container(
//                             height: screenHeight * 0.05,
//                             width: screenHeight * 0.05,
//                             decoration: const BoxDecoration(
//                               color: Colors.white,
//                               shape: BoxShape.circle,
//                             ),
//                             child: Padding(
//                               padding: EdgeInsets.all(screenWidth * 0.02),
//                               child: Image.asset("assets/bell.png",
//                                   fit: BoxFit.contain),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//                       child: Row(
//                         children: [
//                           Icon(Icons.location_on,
//                               color: Colors.white,
//                               size: 18 * fontSizeMultiplier),
//                           SizedBox(width: screenWidth * 0.02),
//                           Text(
//                             "I-14 Islamabad",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 15 * fontSizeMultiplier,
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           const Icon(Icons.keyboard_arrow_down_rounded,
//                               color: Colors.yellow),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: screenHeight * 0.02),
//                     Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: TextFormField(
//                               decoration: InputDecoration(
//                                 hintText: "Search",
//                                 hintStyle: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 14 * fontSizeMultiplier,
//                                 ),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 prefixIcon: Icon(Icons.search,
//                                     color: Colors.grey,
//                                     size: 18 * fontSizeMultiplier),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide: BorderSide.none,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: screenWidth * 0.03),
//                           GestureDetector(
//                             onTap: () {
//                               Get.to(() => const FilterScreen());
//                             },
//                             child: Container(
//                               height: screenHeight * 0.06,
//                               width: screenWidth * 0.13,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Padding(
//                                 padding: EdgeInsets.all(screenWidth * 0.02),
//                                 child: Image.asset(
//                                   "assets/filter.png",
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.02),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//                 child: Column(
//                   children: [

//                     SeeAllRow(
//                       title: "Categories",
//                       seeAll: "See All",
//                       fontSize: 18 * fontSizeMultiplier,
//                     ),
//                     SizedBox(height: screenHeight * 0.02),
//                     const SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: [
//                           DealsImages(
//                             imagePath: "assets/Image.png",
//                             subtitle: "94 Restaruant",
//                             title: "Brunch",
//                           ),
//                           DealsImages(
//                             imagePath: "assets/pasta.png",
//                             subtitle: "94 Restaruant",
//                             title: "Brunch",
//                           ),
//                           DealsImages(
//                             imagePath: "assets/Image.png",
//                             subtitle: "94 Restaruant",
//                             title: "Brunch",
//                           ),
//                         ],
//                       ),
//                     ),

//                     SizedBox(height: screenHeight * 0.02),
//                     SeeAllRow(
//                       title: "Restaurants Near You",
//                       seeAll: "See All",
//                       fontSize: 18 * fontSizeMultiplier,
//                     ),
//                     SizedBox(height: screenHeight * 0.02),

//                     Obx(() {
//                       if (controller.isLoading.value) {
//                         return const Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       } else if (controller.errorMessage.value.isNotEmpty) {
//                         return Center(
//                           child: Text(controller.errorMessage.value),
//                         );
//                       } else {
//                         return ListView.builder(
//                           itemCount: controller.restaurants.length,
//                           itemBuilder: (context, index) {
//                             final restaurant = controller.restaurants[index];
//                             print(
//                                 "Rendering Restaurant: ${restaurant.restaurantName}");
//                             return RestaurantList(
//                                 onPressed: () {},
//                                 restaurant: controller.restaurants[index]);
//                           },
//                         );
//                       }
//                     }),
//                     SizedBox(height: screenHeight * 0.02),
//                     SeeAllRow(
//                       title: "Deals",
//                       seeAll: "See All",
//                       fontSize: 18 * fontSizeMultiplier,
//                     ),
//                     SizedBox(height: screenHeight * 0.01),
//                     const SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: [
//                           DealsImages(
//                             imagePath: "assets/Image.png",
//                             subtitle: "94 Restaruant",
//                             title: "Brunch",
//                           ),
//                           DealsImages(
//                             imagePath: "assets/pasta.png",
//                             subtitle: "94 Restaruant",
//                             title: "Brunch",
//                           ),
//                           DealsImages(
//                             imagePath: "assets/Image.png",
//                             subtitle: "94 Restaruant",
//                             title: "Brunch",
//                           ),
//                         ],
//                       ),
//                     ),

//                     SizedBox(height: screenHeight * 0.01),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/get_restaurant_controller.dart';
import 'package:dine_deal/features/user_side/presentation/pages/about_page.dart';
import 'package:dine_deal/features/user_side/presentation/pages/filter_screen.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/See_all_row.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/deals_images.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/restaurant_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RestaurantController controller = Get.put(RestaurantController());

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double fontSizeMultiplier = screenWidth / 400;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(screenHeight, screenWidth, fontSizeMultiplier),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  children: [
                    _buildCategoriesSection(screenHeight, fontSizeMultiplier),
                    SizedBox(height: screenHeight * 0.02),
                    _buildRestaurantsSection(fontSizeMultiplier),
                    SizedBox(height: screenHeight * 0.02),
                    _buildDealsSection(screenHeight, fontSizeMultiplier),
                    SizedBox(height: screenHeight * 0.01),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(
      double screenHeight, double screenWidth, double fontSizeMultiplier) {
    return Container(
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
          _buildLocationRow(screenWidth, fontSizeMultiplier, screenHeight),
          SizedBox(height: screenHeight * 0.02),
          _buildSearchBar(screenWidth, fontSizeMultiplier, screenHeight),
        ],
      ),
    );
  }

  Widget _buildLocationRow(
      double screenWidth, double fontSizeMultiplier, double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
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
              child: Image.asset("assets/bell.png", fit: BoxFit.contain),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(
      double screenWidth, double fontSizeMultiplier, double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
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
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.03),
          GestureDetector(
            onTap: () => Get.to(() => const FilterScreen()),
            child: Container(
              height: screenHeight * 0.06,
              width: screenWidth * 0.13,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image(
                image: AssetImage(
                  "assets/filter.png",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesSection(
      double screenHeight, double fontSizeMultiplier) {
    return Column(
      children: [
        SeeAllRow(
          title: "Categories",
          seeAll: "See All",
          fontSize: 18 * fontSizeMultiplier,
        ),
        SizedBox(height: screenHeight * 0.02),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              DealsImages(
                imagePath: "assets/Image.png",
                subtitle: "94 Restaurants",
                title: "Brunch",
              ),
              DealsImages(
                imagePath: "assets/pasta.png",
                subtitle: "94 Restaurants",
                title: "Seafood",
              ),
              DealsImages(
                imagePath: "assets/Image.png",
                subtitle: "94 Restaurants",
                title: "Dessert",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRestaurantsSection(double fontSizeMultiplier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SeeAllRow(
          title: "Restaurants Near You",
          seeAll: "See All",
          fontSize: 18 * fontSizeMultiplier,
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (controller.errorMessage.value.isNotEmpty) {
              return Center(
                child: Text(controller.errorMessage.value),
              );
            } else if (controller.restaurants.isEmpty) {
              return const Center(
                child: Text("No restaurants available"),
              );
            } else {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.restaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = controller.restaurants[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: RestaurantList(
                      onPressed: () async {
                        await controller.saveRestaurantId(restaurant.id);
                        print("Selected Restaurant ID: ${restaurant.id}");
                        Get.to(() => AboutPage(
                              restaurant: restaurant,
                            ));
                      },
                      restaurant: restaurant,
                    ),
                  );
                },
              );
            }
          }),
        ),
      ],
    );
  }

  Widget _buildDealsSection(double screenHeight, double fontSizeMultiplier) {
    return Column(
      children: [
        SeeAllRow(
          title: "Deals",
          seeAll: "See All",
          fontSize: 18 * fontSizeMultiplier,
        ),
        SizedBox(height: screenHeight * 0.01),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              DealsImages(
                imagePath: "assets/Image.png",
                subtitle: "94 Restaurants",
                title: "Brunch",
              ),
              DealsImages(
                imagePath: "assets/pasta.png",
                subtitle: "94 Restaurants",
                title: "Seafood",
              ),
              DealsImages(
                imagePath: "assets/Image.png",
                subtitle: "94 Restaurants",
                title: "Dessert",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
