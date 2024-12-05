import 'dart:convert';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ReservationsController extends GetxController {
  var selectedTime = ''.obs;
  var numberOfPersons = 1.obs;
  var selectedTable = ''.obs;
  var selectedDate = DateTime.now().obs;

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  void setSelectedDate(DateTime date) {
    selectedDate.value = date;
  }

  Future<void> submitReservation() async {
    try {
      isLoading(true);

      final url = Uri.parse("${AppConfig.baseURL}${AppConstant.reservation}");

      // Prepare the request body
      final body = {
        "tableNumber": selectedTable.value,
        "noOfPersons": numberOfPersons.value,
        "date": selectedDate.value.toIso8601String(),
        "time": selectedTime.value,
      };

      print("API URL: $url");
      print("Request Body: $body");

      // Send POST request
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(body),
      );

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 201) {
        final responseBody = json.decode(response.body);
        final username = responseBody['reservation']['username'];
        Get.snackbar(
          "Success",
          "Reservation created ",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        final responseBody = json.decode(response.body);
        errorMessage.value =
            responseBody['message'] ?? 'Failed to create reservation.';
        Get.snackbar(
          "Error",
          errorMessage.value,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e, stackTrace) {
      errorMessage.value =
          "Failed to connect to the server. Please try again later.";
      print("Error during reservation: $e");
      print("Stack Trace: $stackTrace");
      Get.snackbar(
        "Error",
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading(false);
    }
  }
}
