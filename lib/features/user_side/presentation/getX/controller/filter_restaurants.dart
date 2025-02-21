import 'dart:convert';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:dine_deal/features/user_side/presentation/pages/filtered_restaurant_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FilterRestaurants extends GetxController {
  var filteredRestaurants = [].obs;
  var isLoading = false.obs;

  Future<void> fetchFilteredRestaurants({
    required String minPrice,
    required String maxPrice,
    required String restaurantType,
    required String deals,
    required String restaurantArea,
    required String additionalNotes,
  }) async {
    try {
      isLoading.value = true;
      var url =
          Uri.parse('${AppConfig.baseURL}${AppConstant.filterRestaurant}');
      var response = await http.post(
        url,
        body: {
          'minPrice': minPrice,
          'maxPrice': maxPrice,
          'restaurantType': restaurantType,
          'deals': deals,
          'restaurantArea': restaurantArea,
          'additionalNotes': additionalNotes,
        },
      );
      print('Sending request to: $url');
      print('Request body: ${{
        'minPrice': minPrice,
        'maxPrice': maxPrice,
        'restaurantType': restaurantType,
        'deals': deals,
        'restaurantArea': restaurantArea,
        'additionalNotes': additionalNotes,
      }}');
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['restaurants'].isNotEmpty) {
          filteredRestaurants.value = data['restaurants'];
          Get.to(() => FilteredRestaurantsScreen());
        } else {
          Get.snackbar("No Results", "No restaurants match your criteria.",
              snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
        }
      } else {
        Get.snackbar("Error", "Failed to fetch data.",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }
}
