// import 'dart:convert';

// import 'package:dine_deal/config/app_config.dart';
// import 'package:dine_deal/core/constants/app_constant.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// // Yeh globally defined ValueNotifier hai
// final ValueNotifier<String> selectedRestaurantName =
//     ValueNotifier<String>("Select Restaurant");

// class RestaurantName extends StatefulWidget {
//   const RestaurantName({super.key});

//   @override
//   _RestaurantSelectionWidgetState createState() =>
//       _RestaurantSelectionWidgetState();
// }

// class _RestaurantSelectionWidgetState extends State<RestaurantName> {
//   List<String> restaurantNames = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchRestaurants();
//   }

//   Future<void> fetchRestaurants() async {
//     try {
//       final response = await http.get(
//           Uri.parse('${AppConfig.baseURL}${AppConstant.getRestaurantName}'));

//       if (response.statusCode == 200) {
//         print("API Response: ${response.body}");

//         Map<String, dynamic> jsonResponse = jsonDecode(response.body);

//         if (jsonResponse.containsKey("restaurantNames")) {
//           List<dynamic> data = jsonResponse["restaurantNames"];

//           setState(() {
//             restaurantNames = data.map((name) => name.toString()).toList();
//           });
//         } else {
//           print("Error: 'restaurantNames' key is missing.");
//         }
//       } else {
//         print(
//             "Failed to load restaurants, status code: ${response.statusCode}");
//       }
//     } catch (e) {
//       print("Error fetching restaurants: $e");
//     }
//   }

//   void showRestaurantBottomSheet() {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return Container(
//           padding: const EdgeInsets.all(10),
//           child: restaurantNames.isEmpty
//               ? const Center(child: CircularProgressIndicator())
//               : Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: restaurantNames.map((name) {
//                     return ListTile(
//                       title: Text(name),
//                       onTap: () {
//                         selectedRestaurantName.value =
//                             name; // Yeh value update hogi
//                         Navigator.pop(context);
//                       },
//                     );
//                   }).toList(),
//                 ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: showRestaurantBottomSheet,
//       child: Container(
//         height: 60,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(color: Colors.grey.shade300),
//         ),
//         child: Row(
//           children: [
//             const SizedBox(width: 10),
//             Image.asset("assets/prefix.png"),
//             const SizedBox(width: 10),
//             ValueListenableBuilder<String>(
//               valueListenable: selectedRestaurantName,
//               builder: (context, value, child) {
//                 return Text(
//                   value,
//                   style: const TextStyle(
//                       fontWeight: FontWeight.bold, fontSize: 18),
//                 );
//               },
//             ),
//             const Spacer(),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               child: Icon(Icons.arrow_forward_ios, color: Colors.grey),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Yeh globally defined ValueNotifier hai
final ValueNotifier<String> selectedRestaurantName =
    ValueNotifier<String>("Select Restaurant");

class RestaurantName extends StatefulWidget {
  const RestaurantName({super.key});

  @override
  _RestaurantSelectionWidgetState createState() =>
      _RestaurantSelectionWidgetState();
}

class _RestaurantSelectionWidgetState extends State<RestaurantName> {
  List<String> restaurantNames = [];

  @override
  void initState() {
    super.initState();
    fetchRestaurants();
  }

  Future<void> fetchRestaurants() async {
    try {
      final response = await http.get(
          Uri.parse('${AppConfig.baseURL}${AppConstant.getRestaurantName}'));

      if (response.statusCode == 200) {
        print("API Response: ${response.body}");

        List<dynamic> jsonResponse = jsonDecode(response.body); // ✅ Corrected

        setState(() {
          restaurantNames =
              jsonResponse.cast<String>(); // ✅ Ensures List<String>
        });
      } else {
        print(
            "Failed to load restaurants, status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching restaurants: $e");
    }
  }

  void showRestaurantBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: restaurantNames.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: restaurantNames.map((name) {
                    return ListTile(
                      title: Text(name),
                      onTap: () {
                        selectedRestaurantName.value = name; // ✅ Value update
                        Navigator.pop(context);
                      },
                    );
                  }).toList(),
                ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: showRestaurantBottomSheet,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),
            Image.asset("assets/prefix.png"),
            const SizedBox(width: 10),
            ValueListenableBuilder<String>(
              valueListenable: selectedRestaurantName,
              builder: (context, value, child) {
                return Text(
                  value,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                );
              },
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.arrow_forward_ios, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
