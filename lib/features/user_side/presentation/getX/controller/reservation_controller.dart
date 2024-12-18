import 'dart:convert';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ReservationsController extends GetxController {
  var selectedTime = ''.obs;
  var numberOfPersons = 1.obs;
  var selectedTable = ''.obs;
  var selectedDate = DateTime.now().obs;

  var restaurantId = ''.obs;
  var userEmail = ''.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  Future<void> fetchRestaurantId() async {
    final prefs = await SharedPreferences.getInstance();
    restaurantId.value = prefs.getInt('restaurant_id')?.toString() ?? '';
    if (restaurantId.value.isEmpty) {
      print(
          "Error: No restaurant ID found. User needs to select a restaurant.");
    } else {
      print("Fetched Restaurant ID: ${restaurantId.value}");
    }
  }

  Future<void> fetchUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    userEmail.value = prefs.getString('user_email') ?? '';
    if (userEmail.value.isEmpty) {
      print("Error: No user email found in SharedPreferences.");
    } else {
      print("Fetched User Email: ${userEmail.value}");
    }
  }

  Future<void> submitReservation() async {
    isLoading(true);
    errorMessage.value = '';

    await fetchRestaurantId();
    await fetchUserEmail();

    print("Email: ${userEmail.value}");
    print("Restaurant ID: ${restaurantId.value}");
    print("Table Number: ${selectedTable.value}");
    print("Number of Persons: ${numberOfPersons.value}");
    print("Reservation Date: ${selectedDate.value.toIso8601String()}");
    print("Reservation Time: ${selectedTime.value}");

    if (restaurantId.value.isEmpty) {
      Get.snackbar("Error", "Please select a restaurant first.",
          snackPosition: SnackPosition.BOTTOM);
      isLoading(false);
      return;
    }

    if (userEmail.value.isEmpty) {
      Get.snackbar("Error", "User email not found. Please log in again.",
          snackPosition: SnackPosition.BOTTOM);
      isLoading(false);
      return;
    }

    try {
      final url = Uri.parse("${AppConfig.baseURL}${AppConstant.reservation}");
      final body = {
        "email": userEmail.value,
        "restaurantId": restaurantId.value,
        "tableNumber": selectedTable.value,
        "numberOfPersons": numberOfPersons.value,
        "reservationDate": selectedDate.value.toIso8601String(),
        "reservationTime": selectedTime.value,
      };

      print("Request Body: $body");

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(body),
      );

      print("Response: ${response.body}");

      if (response.statusCode == 201) {
        Get.snackbar(
          "Success",
          "Reservation created successfully.",
        );
      } else {
        final responseBody = json.decode(response.body);
        errorMessage.value =
            responseBody['message'] ?? 'Failed to create reservation.';
        Get.snackbar("Error", errorMessage.value);
      }
    } catch (e) {
      errorMessage.value =
          "Failed to connect to the server. Please try again later.";
      Get.snackbar("Error", errorMessage.value);
    } finally {
      isLoading(false);
    }
  }
}
