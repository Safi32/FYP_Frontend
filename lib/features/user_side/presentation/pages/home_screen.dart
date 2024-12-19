import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/get_restaurant_controller.dart';
import 'package:dine_deal/features/user_side/presentation/pages/about_page.dart';
import 'package:dine_deal/features/user_side/presentation/pages/categories_screen.dart';
import 'package:dine_deal/features/user_side/presentation/pages/filter_screen.dart';
import 'package:dine_deal/features/user_side/presentation/pages/restaurant_screen.dart';
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
                    _buildReservationTableSection(fontSizeMultiplier),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Location",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15 * fontSizeMultiplier,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(Icons.location_on,
                      color: Colors.white, size: 18 * fontSizeMultiplier),
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
            ],
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
                  fontSize: 15 * fontSizeMultiplier,
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
              child: const Image(
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
          onPressed: () {
            Get.to(() => CategoriesScreen());
          },
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
                title: "Sea food",
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

  Widget _buildReservationTableSection(double fontSizeMultiplier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Get.height * 0.2,
          width: Get.width,
          child: Card(
            elevation: 1,
            color: AppColors.surface,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Online Reservation",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "Table Booking",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Image(
                        image: AssetImage(
                          "assets/table_booking.png",
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 160,
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: AppColors.orange,
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image(
                              image: AssetImage(
                                "assets/Live area.png",
                              ),
                            ),
                            Text(
                              "Reserve a table",
                              style: TextStyle(
                                color: AppColors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 160,
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: AppColors.orange,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "My Reservations",
                            style: TextStyle(
                              color: AppColors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
          onPressed: () {
            Get.to(() => RestaurantScreen());
          },
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
          onPressed: () {
            Get.to(() => CategoriesScreen());
          },
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
