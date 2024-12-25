import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/get_deals_controller.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/get_restaurant_controller.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/get_type_controller.dart';
import 'package:dine_deal/features/user_side/presentation/pages/about_page.dart';
import 'package:dine_deal/features/user_side/presentation/pages/categories_screen.dart';
import 'package:dine_deal/features/user_side/presentation/pages/deals_screen.dart';
import 'package:dine_deal/features/user_side/presentation/pages/filter_screen.dart';
import 'package:dine_deal/features/user_side/presentation/pages/reservation.dart';
import 'package:dine_deal/features/user_side/presentation/pages/reserve_table.dart';
import 'package:dine_deal/features/user_side/presentation/pages/restaurant_screen.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/See_all_row.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/deals_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final RestaurantController controller = Get.find<RestaurantController>();
  final GetDealsController dealsController = Get.find<GetDealsController>();
  final GetCategoriesController categoriesController =
      Get.find<GetCategoriesController>();

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
                    _buildDealsSection(
                        screenHeight, fontSizeMultiplier, dealsController),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SeeAllRow(
          title: "Categories",
          seeAll: "See All",
          onPressed: () {
            Get.to(() => CategoriesScreen());
          },
          fontSize: 18 * fontSizeMultiplier,
        ),
        SizedBox(height: screenHeight * 0.01),
        Obx(() {
          if (categoriesController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (categoriesController.categoriesList.isEmpty) {
            return const Center(
              child: Text(
                "No Categories Available",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            );
          }

          final rawTypes = categoriesController.categoriesList[0];
          final cleanedTypes = rawTypes.replaceAll('"', '');
          final categories =
              cleanedTypes.split(',').map((type) => type.trim()).toList();

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories.map<Widget>((category) {
                return DealsImages(
                  imagePath: "",
                  subtitle: "",
                  title: category,
                );
              }).toList(),
            ),
          );
        }),
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
                          "assets/remove-background-tick.png",
                        ),
                        height: 80,
                        width: 100,
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
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => ReserveTable());
                          },
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
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const Reservation());
                        },
                        child: Container(
                          height: 40,
                          width: 160,
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: AppColors.orange,
                            ),
                          ),
                          child: const Center(
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
          title: "Restaurants",
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
            } else if (controller.latestRestaurant.value == null) {
              return const Center(
                child: Text("No restaurants available"),
              );
            } else {
              final latestRestaurant = controller.latestRestaurant.value!;
              return GestureDetector(
                onTap: () {
                  controller.setSelectedRestaurant(latestRestaurant);
                  Get.to(() => const AboutPage());
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: Container(
                          height: 130,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(latestRestaurant.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              latestRestaurant.restaurantName,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Choose from a variety of bowl options and tas..", // Static subtitle
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            const Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.local_offer,
                                        size: 16, color: Colors.orange),
                                    SizedBox(width: 5),
                                    Text(
                                      "20+ deals",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 15),
                                Row(
                                  children: [
                                    Icon(Icons.access_time,
                                        size: 16, color: Colors.orange),
                                    SizedBox(width: 5),
                                    Text(
                                      "40-50 mins",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 15),
                                Row(
                                  children: [
                                    Icon(Icons.star,
                                        size: 16, color: Colors.orange),
                                    SizedBox(width: 5),
                                    Text(
                                      "4.9",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
        ),
      ],
    );
  }

  Widget _buildDealsSection(double screenHeight, double fontSizeMultiplier,
      GetDealsController dealsController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SeeAllRow(
          title: "Latest Deals",
          seeAll: "See All",
          onPressed: () {
            Get.to(() => DealsScreen()); // Navigate to See All Deals screen
          },
          fontSize: 18 * fontSizeMultiplier,
        ),
        SizedBox(height: screenHeight * 0.01),
        Obx(() {
          if (dealsController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (dealsController.latestDeals.isEmpty) {
            return const Center(
              child: Text(
                "No Latest Deals Available",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            );
          }

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: dealsController.latestDeals.map((deal) {
                return DealsImages(
                  imagePath: deal["image"] ?? "",
                  subtitle: deal["deal_details"] ?? "",
                  title: deal["deal_name"] ?? "",
                );
              }).toList(),
            ),
          );
        }),
      ],
    );
  }
}
