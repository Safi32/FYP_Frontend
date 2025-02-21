import 'dart:convert';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:dine_deal/features/models/get_restaurant_data_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RestaurantController extends GetxController {
  var restaurants = <Restaurant>[].obs;
  var latestRestaurant = Rxn<Restaurant>();
  var selectedRestaurant = Rxn<Restaurant>();
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchRestaurants();
  }

  Future<void> fetchRestaurants({int page = 1}) async {
    const String url = "${AppConfig.baseURL}${AppConstant.getRestaurant}";

    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse(url));
      isLoading.value = false;

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print("Restaurant Data: $data");

        if (data['success']) {
          var restaurantList = data['data'] as List;
          restaurants.addAll(
              restaurantList.map((e) => Restaurant.fromJson(e)).toList());
          if (restaurantList.isNotEmpty) {
            latestRestaurant.value = Restaurant.fromJson(restaurantList.last);
          }
        } else {
          errorMessage.value = data['message'] ?? 'Failed to fetch restaurants';
        }
      } else {
        errorMessage.value =
            'Error ${response.statusCode}: Unable to fetch data';
      }
    } catch (e) {
      isLoading.value = false;
      errorMessage.value = 'An error occurred: $e';
    }
  }

  void setSelectedRestaurant(Restaurant restaurant) {
    selectedRestaurant.value = restaurant;
  }
}
