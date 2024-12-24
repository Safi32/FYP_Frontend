// import 'dart:convert';

// import 'package:dine_deal/config/app_config.dart';
// import 'package:dine_deal/core/constants/app_constant.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class GetDealsController extends GetxController {
//   var isLoading = false.obs;
//   var errorMessage = ''.obs;
//   var dealsList = [].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchAllDeals(); // Trigger fetchAllDeals when the controller is initialized
//   }

//   Future<void> fetchAllDeals() async {
//     const String getDealsURL = "${AppConfig.baseURL}${AppConstant.getDeals}";

//     isLoading.value = true;
//     errorMessage.value = "";

//     try {
//       final response = await http.get(
//         Uri.parse(getDealsURL),
//         headers: {'Content-Type': 'application/json'},
//       );

//       print("API Response: ${response.body}");

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body) as List;
//         print("Fetched Deals: $data");
//         dealsList.value = data;
//       } else {
//         final errorBody = jsonDecode(response.body);
//         errorMessage.value = errorBody['error'] ?? "Failed to fetch deals.";
//         Get.snackbar("Error", errorMessage.value);
//       }
//     } catch (e) {
//       errorMessage.value = "An error occurred: $e";
//       Get.snackbar("Error", errorMessage.value);
//       print("Fetch Deals Error: $e"); // Debugging errors
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
import 'dart:convert';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GetDealsController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var dealsList = [].obs;
  var latestDeals = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllDeals(); // Fetch all deals when the controller initializes
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

      print("API Response: ${response.body}"); // Debugging API response

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;
        dealsList.value = data;

        // Sort deals by latest first (assuming deals have a "createdAt" field)
        dealsList.sort((a, b) {
          final dateA = DateTime.parse(a["createdAt"]);
          final dateB = DateTime.parse(b["createdAt"]);
          return dateB.compareTo(dateA);
        });

        // Get the latest 3 deals
        latestDeals.value = dealsList.take(3).toList();
      } else {
        final errorBody = jsonDecode(response.body);
        errorMessage.value = errorBody['error'] ?? "Failed to fetch deals.";
        Get.snackbar("Error", errorMessage.value);
      }
    } catch (e) {
      errorMessage.value = "An error occurred: $e";
      Get.snackbar("Error", errorMessage.value);
      print("Fetch Deals Error: $e"); // Debugging errors
    } finally {
      isLoading.value = false;
    }
  }
}
