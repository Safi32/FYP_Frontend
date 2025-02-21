// import 'dart:convert';

// import 'package:dine_deal/config/app_config.dart';
// import 'package:dine_deal/core/constants/app_constant.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class ReservationsController extends GetxController {
//   var selectedTime = ''.obs;
//   var numberOfPersons = 1.obs;
//   var selectedTable = ''.obs;
//   var selectedDate = DateTime.now().obs;

//   var restaurantId = ''.obs;
//   var userEmail = ''.obs;
//   var isLoading = false.obs;
//   var errorMessage = ''.obs;
//   Future<void> fetchRestaurantId() async {
//     final prefs = await SharedPreferences.getInstance();
//     restaurantId.value = prefs.getInt('restaurant_id')?.toString() ?? '';
//     if (restaurantId.value.isEmpty) {
//       print(
//           "Error: No restaurant ID found. User needs to select a restaurant.");
//     } else {
//       print("Fetched Restaurant ID: ${restaurantId.value}");
//     }
//   }

//   Future<void> fetchUserEmail() async {
//     final prefs = await SharedPreferences.getInstance();
//     userEmail.value = prefs.getString('user_email') ?? '';
//     if (userEmail.value.isEmpty) {
//       print("Error: No user email found in SharedPreferences.");
//     } else {
//       print("Fetched User Email: ${userEmail.value}");
//     }
//   }

//   Future<void> submitReservation() async {
//     isLoading(true);
//     errorMessage.value = '';

//     await fetchRestaurantId();
//     await fetchUserEmail();

//     print("Email: ${userEmail.value}");
//     print("Restaurant ID: ${restaurantId.value}");
//     print("Table Number: ${selectedTable.value}");
//     print("Number of Persons: ${numberOfPersons.value}");
//     print("Reservation Date: ${selectedDate.value.toIso8601String()}");
//     print("Reservation Time: ${selectedTime.value}");

//     if (restaurantId.value.isEmpty) {
//       Get.snackbar("Error", "Please select a restaurant first.",
//           snackPosition: SnackPosition.BOTTOM);
//       isLoading(false);
//       return;
//     }

//     if (userEmail.value.isEmpty) {
//       Get.snackbar("Error", "User email not found. Please log in again.",
//           snackPosition: SnackPosition.BOTTOM);
//       isLoading(false);
//       return;
//     }

//     try {
//       final url = Uri.parse("${AppConfig.baseURL}${AppConstant.reservation}");
//       final body = {
//         "email": userEmail.value,
//         "restaurantId": restaurantId.value,
//         "tableNumber": selectedTable.value,
//         "numberOfPersons": numberOfPersons.value,
//         "reservationDate": selectedDate.value.toIso8601String(),
//         "reservationTime": selectedTime.value,
//       };

//       print("Request Body: $body");

//       final response = await http.post(
//         url,
//         headers: {"Content-Type": "application/json"},
//         body: json.encode(body),
//       );

//       print("Response: ${response.body}");

//       if (response.statusCode == 201) {
//         Get.snackbar(
//           "Success",
//           "Reservation created successfully.",
//         );
//       } else {
//         final responseBody = json.decode(response.body);
//         errorMessage.value =
//             responseBody['message'] ?? 'Failed to create reservation.';
//         Get.snackbar("Error", errorMessage.value);
//       }
//     } catch (e) {
//       errorMessage.value =
//           "Failed to connect to the server. Please try again later.";
//       Get.snackbar("Error", errorMessage.value);
//     } finally {
//       isLoading(false);
//     }
//   }
// }
import 'dart:convert';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ReservationsController extends GetxController {
  // Observable variables
  var selectedTime = ''.obs;
  var numberOfPersons = 1.obs;
  var selectedTable = "".obs;
  var selectedDate = DateTime.now().obs;
  var restaurantId = '1'.obs;
  var restaurantName = ''.obs;
  var userEmail = ''.obs;
  var userName = ''.obs;
  var availableTimes = <String>[].obs;
  var selectedDeal = ''.obs;
  var additionalNotes = ''.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> fetchUserInfo() async {
    // Fetch user info from SharedPreferences or API
    final prefs = await SharedPreferences.getInstance();
    userEmail.value = prefs.getString('user_email') ?? '';
    userName.value = prefs.getString('user_name') ?? '';

    if (userEmail.value.isEmpty || userName.value.isEmpty) {
      print("Error: User info not found.");
    } else {
      print("Fetched User Info: $userName, $userEmail");
    }
  }

  void incrementPersons() {
    numberOfPersons.value++;
  }

  void decrementPersons() {
    if (numberOfPersons.value > 1) {
      numberOfPersons.value--;
    }
  }

  void fetchAvailableTimes(String currentTime) {
    final operationalStart =
        DateTime.parse("${selectedDate.value.toIso8601String()} 09:00:00");
    final operationalEnd =
        DateTime.parse("${selectedDate.value.toIso8601String()} 21:00:00");
    final current = DateTime.parse(
        "${selectedDate.value.toIso8601String()} $currentTime:00");

    availableTimes.clear();
    for (var hour = operationalStart.hour;
        hour <= operationalEnd.hour;
        hour++) {
      final time = DateTime(selectedDate.value.year, selectedDate.value.month,
          selectedDate.value.day, hour);
      if (time.isAfter(current) || time.isAtSameMomentAs(current)) {
        availableTimes.add("${time.hour.toString().padLeft(2, '0')}:00");
      }
    }
    print("Available Times: $availableTimes");
  }

  Future<void> submitReservation() async {
    isLoading(true);
    errorMessage.value = '';

    await fetchUserInfo();

    if (restaurantId.value.isEmpty) {
      Get.snackbar(
          "Error", "No restaurant selected. Please select a restaurant.",
          snackPosition: SnackPosition.BOTTOM);
      isLoading(false);
      return;
    }

    if (userEmail.value.isEmpty) {
      Get.snackbar("Error", "User info not found. Please log in again.",
          snackPosition: SnackPosition.BOTTOM);
      isLoading(false);
      return;
    }

    try {
      final url = Uri.parse("${AppConfig.baseURL}${AppConstant.reservation}");
      final body = {
        "email": userEmail.value,
        "username": userName.value,
        "restaurantId": restaurantId.value,
        "restaurantName": restaurantName.value,
        "tableNumber": selectedTable.value,
        "numberOfPersons": numberOfPersons.value,
        "reservationDate": selectedDate.value.toIso8601String(),
        "reservationTime": selectedTime.value,
        "deals": selectedDeal.value,
        "additionalNotes": additionalNotes.value,
      };

      print("Request Body: $body");

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(body),
      );

      if (response.statusCode == 201) {
        Get.snackbar(
          "Success",
          "Reservation created successfully.",
        );
        print("Reservation Response: ${response.body}");
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
