import 'dart:convert';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FetchRestaurantNameController extends GetxController {
  var restaurantName = ''.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadUserId();
  }

  Future<void> _loadUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId =
        prefs.getString('userId'); // Stored userId fetch kar raha hai
    if (userId != null) {
      fetchRestaurantName(userId);
    }
  }

  Future<void> fetchRestaurantName(String userId) async {
    isLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse(
            '${AppConfig.baseURL}${AppConstant.getRestaurantNameById}?userId=$userId'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        restaurantName.value = data['restaurantName'] ?? 'No Name Found';
      } else {
        restaurantName.value = 'Restaurant Not Found';
      }
    } catch (e) {
      restaurantName.value = 'Error fetching restaurant name';
      print("Error fetching restaurant name: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
