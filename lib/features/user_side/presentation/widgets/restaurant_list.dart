// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class RestaurantList extends StatelessWidget {
//   const RestaurantList({
//     super.key,
//     required this.onPressed,
//     // required this.restaurant,
//   });

//   final VoidCallback onPressed;
//   // final Restaurant restaurant;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         GestureDetector(
//           onTap: onPressed,
//           child: Container(
//             height: Get.height * 0.3,
//             width: Get.width * 0.90,
//             decoration: BoxDecoration(
//               color: Colors.grey.shade300,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               // child: Image.asset(
//               //   // "assets/main_restaurant.png",
//               //   restaurant.image,
//               //   fit: BoxFit.cover,
//               // ),
//             ),
//           ),
//         ),
//         Positioned(
//           top: 10,
//           left: 15,
//           right: 15,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               // Container(
//               //   height: 30,
//               //   width: 120,
//               //   decoration: BoxDecoration(
//               //     color: Colors.white,
//               //     borderRadius: BorderRadius.circular(10),
//               //   ),
//               //   child: Row(
//               //     children: [
//               //       Image.asset("assets/kid_star.png"),
//               //       const Text(
//               //         "4.8(1K+ Review)",
//               //         style: TextStyle(
//               //           fontWeight: FontWeight.bold,
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//               Container(
//                 height: 50,
//                 width: 50,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   shape: BoxShape.circle,
//                 ),
//                 child: IconButton(
//                   onPressed: () {},
//                   icon: const Icon(Icons.favorite_border_outlined),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Positioned(
//           left: 0,
//           right: 0,
//           bottom: 0,
//           child: Container(
//             height: Get.height * 0.08,
//             decoration: BoxDecoration(
//               color: Colors.white,
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 20,
//                     vertical: 5,
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         restaurant.restaurantName,
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                         ),
//                       ),
//                       // Text(
//                       //   "Open",
//                       //   style: TextStyle(
//                       //     fontWeight: FontWeight.bold,
//                       //     fontSize: 15,
//                       //     color: AppColors.orange,
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 20,
//                   ),
//                   child: Row(
//                     children: [
//                       Row(
//                         children: [
//                           Image(
//                             image: AssetImage(
//                               "assets/truck-fast.png",
//                             ),
//                           ),
//                           Text(
//                             "20 + deals",
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Image(
//                             image: AssetImage(
//                               "assets/timer.png",
//                             ),
//                           ),
//                           Text(
//                             "40-50 mins",
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.star,
//                             color: Colors.orange,
//                           ),
//                           Text(
//                             "4.8",
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:dine_deal/features/models/get_restaurant_data_model.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/get_restaurant_controller.dart';
import 'package:dine_deal/features/user_side/presentation/pages/about_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurantList extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantList({required this.restaurant, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RestaurantController controller = Get.find();

    return GestureDetector(
      onTap: () {
        controller
            .setSelectedRestaurant(restaurant); // Set the selected restaurant
        Get.to(() => AboutPage()); // Navigate to the AboutPage
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
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
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                "",
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                restaurant.restaurantName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
