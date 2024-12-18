import 'dart:convert';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:dine_deal/models/get_restaurant_data_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RestaurantController extends GetxController {
  var restaurants = <Restaurant>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchRestaurants();
  }

  Future<void> fetchRestaurants() async {
    const String url = "${AppConfig.baseURL}${AppConstant.getRestaurant}";

    try {
      isLoading(true);
      errorMessage('');

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['success']) {
          var restaurantList = data['data'] as List;
          print("Fetched Restaurants: $restaurantList");
          restaurants.value =
              restaurantList.map((e) => Restaurant.fromJson(e)).toList();
        } else {
          errorMessage(data['message'] ?? 'Failed to fetch restaurants');
        }
      } else {
        errorMessage('Error ${response.statusCode}: Unable to fetch data');
      }
    } catch (e) {
      errorMessage('An error occurred: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> saveRestaurantId(int restaurantId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('restaurant_id', restaurantId);
      print("Restaurant ID saved: $restaurantId");
    } catch (e) {
      print("Error saving restaurant ID: $e");
    }
  }
}
