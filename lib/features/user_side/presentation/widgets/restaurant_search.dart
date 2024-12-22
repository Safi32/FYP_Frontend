// import 'package:flutter/material.dart';

// class RestaurantSearch extends StatefulWidget {
//   @override
//   _RestaurantSearchState createState() => _RestaurantSearchState();
// }

// class _RestaurantSearchState extends State<RestaurantSearch> {
//   final List<String> allRestaurants = [
//     'Marriot Hotel Islamabad',
//     'Serena Hotel Islamabad',
//     'Monal Restaurant',
//     'Chaye Khana',
//     'English Tea House',
//   ];

//   late List<String> filteredRestaurants;

//   final ValueNotifier<String> selectedRestaurant = ValueNotifier('');

//   @override
//   void initState() {
//     super.initState();
//     filteredRestaurants = allRestaurants;
//   }

//   void showRestaurantSearchSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       isScrollControlled: true,
//       builder: (context) {
//         return DraggableScrollableSheet(
//           expand: false,
//           maxChildSize: 0.7,
//           minChildSize: 0.4,
//           initialChildSize: 0.5,
//           builder: (context, scrollController) {
//             return Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   TextField(
//                     decoration: InputDecoration(
//                       hintText: 'Search Restaurants',
//                       prefixIcon: const Icon(Icons.search),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     onChanged: (value) {
//                       filteredRestaurants = allRestaurants
//                           .where((restaurant) => restaurant
//                               .toLowerCase()
//                               .contains(value.toLowerCase()))
//                           .toList();
//                       setState(() {});
//                     },
//                   ),
//                   const SizedBox(height: 16),
//                   Expanded(
//                     child: ListView.builder(
//                       controller: scrollController,
//                       itemCount: filteredRestaurants.length,
//                       itemBuilder: (context, index) {
//                         return ListTile(
//                           leading: const Icon(Icons.restaurant),
//                           title: Text(filteredRestaurants[index]),
//                           onTap: () {
//                             Navigator.pop(context, filteredRestaurants[index]);
//                           },
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     ).then((selected) {
//       if (selected != null) {
//         selectedRestaurant.value = selected;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Restaurant Search'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             GestureDetector(
//               onTap: () => showRestaurantSearchSheet(context),
//               child: Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     ValueListenableBuilder<String>(
//                       valueListenable: selectedRestaurant,
//                       builder: (context, value, child) {
//                         return Text(
//                           value.isEmpty ? 'Select a Restaurant' : value,
//                           style: const TextStyle(fontSize: 16),
//                         );
//                       },
//                     ),
//                     const Icon(Icons.arrow_drop_down),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RestaurantSearch extends StatefulWidget {
  final Function(String)? onRestaurantSelected;

  RestaurantSearch({Key? key, this.onRestaurantSelected}) : super(key: key);

  @override
  _RestaurantSearchState createState() => _RestaurantSearchState();
}

class _RestaurantSearchState extends State<RestaurantSearch> {
  List<String> restaurants = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRestaurants();
  }

  Future<void> fetchRestaurants() async {
    try {
      final url = Uri.parse(
          "https://api.example.com/restaurants"); // Replace with your API endpoint
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          restaurants = List<String>.from(data.map((item) => item['name']));
          isLoading = false;
        });
      } else {
        throw Exception("Failed to load restaurants");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Error fetching restaurants: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select a Restaurant"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                final restaurantName = restaurants[index];
                return ListTile(
                  title: Text(restaurantName),
                  onTap: () {
                    if (widget.onRestaurantSelected != null) {
                      widget.onRestaurantSelected!(restaurantName);
                    }
                    Navigator.pop(context);
                  },
                );
              },
            ),
    );
  }
}
