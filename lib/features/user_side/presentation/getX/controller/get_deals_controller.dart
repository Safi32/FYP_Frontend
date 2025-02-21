import 'dart:convert';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetDealsController extends GetxController {
  var userEmail = ''.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var dealsList = [].obs;
  var latestDeals = [].obs;
  var latestRestaurantId = 0.obs;
  var latestRestaurantDeals = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllDeals();
  }

  void setUserEmail(String email) {
    userEmail.value = email;
  }

  Future<void> fetchUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    userEmail.value = prefs.getString('user_email') ?? 'N/A';
  }

  Future<void> fetchAllDeals() async {
    const String getDealsURL = "${AppConfig.baseURL}${AppConstant.getDeals}";
    isLoading.value = true;
    errorMessage.value = "";
    try {
      final response = await http.get(
        Uri.parse(getDealsURL),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;
        dealsList.value = data;
        dealsList.sort((a, b) {
          final dateA = DateTime.parse(a["createdAt"]);
          final dateB = DateTime.parse(b["createdAt"]);
          return dateB.compareTo(dateA);
        });
        latestDeals.value = dealsList.take(3).toList();
        if (latestDeals.isNotEmpty) {
          latestRestaurantId.value = latestDeals.first["restaurantId"] ?? 0;
          print("🟢 Latest Restaurant ID: ${latestRestaurantId.value}");
        }
        latestRestaurantDeals.value = dealsList
            .where((deal) => deal["restaurantId"] == latestRestaurantId.value)
            .toList();
        print("🟢 Latest Restaurant Deals: $latestRestaurantDeals");
        for (var deal in dealsList) {
          print("🟢 Deal ID: ${deal['id']}, Price: ${deal['dealPrice']}");
        }
      } else {
        final errorBody = jsonDecode(response.body);
        errorMessage.value = errorBody['error'] ?? "Failed to fetch deals.";
        Get.snackbar("Error", errorMessage.value);
      }
    } catch (e) {
      errorMessage.value = "An error occurred: $e";
      Get.snackbar("Error", errorMessage.value);
      print("Fetch Deals Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
