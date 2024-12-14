import 'dart:convert';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RestaurantController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var restaurants = <Map<String, dynamic>>[].obs;

  Future<void> fetchRestaurants() async {
    try {
      isLoading(true);
      errorMessage.value = '';

      final url = Uri.parse("${AppConfig.baseURL}${AppConstant.getRestaurant}");
      print("Fetching restaurants from: $url");

      final response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        print("Response body: $responseBody");
      } else {
        print("Error response: ${response.body}");
        final responseBody = json.decode(response.body);
        errorMessage.value = responseBody['message'] ?? 'Failed to fetch data.';
        Get.snackbar('Error', errorMessage.value);
      }
    } catch (e) {
      print("Exception: $e");
      errorMessage.value = 'Failed to connect to the server. Please try again.';
      Get.snackbar('Error', errorMessage.value);
    } finally {
      isLoading(false);
    }
  }
}
