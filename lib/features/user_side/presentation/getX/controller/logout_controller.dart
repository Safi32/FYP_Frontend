// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class LogoutController extends GetxController {
//   var isLoading = false.obs;

//   Future<void> logoutUser(String token) async {
//     const String logoutURL = "http://192.168.18.94:3000/api/restaurant/logout";

//     isLoading.value = true; // Start loading indicator
//     try {
//       final response = await http.post(
//         Uri.parse(logoutURL),
//         headers: {
//           "Content-Type": "application/json",
//           "Authorization": "Bearer $token",
//         },
//       );

//       isLoading.value = false; // Stop loading indicator

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);

//         if (data['success'] == true) {
//           // Show success message and navigate to login
//           Get.snackbar(
//             "Success",
//             "Logged out successfully!",
//             snackPosition: SnackPosition.TOP,
//           );
//           Get.offAllNamed("/login");
//         } else {
//           Get.snackbar(
//             "Error",
//             data['message'] ?? "Logout failed",
//             snackPosition: SnackPosition.TOP,
//           );
//         }
//       } else {
//         Get.snackbar(
//           "Error",
//           "Server returned an invalid response. Please try again.",
//           snackPosition: SnackPosition.TOP,
//         );
//       }
//     } catch (error) {
//       isLoading.value = false;
//       Get.snackbar(
//         "Error",
//         "Failed to connect to the server: $error",
//         snackPosition: SnackPosition.TOP,
//       );
//     }
//   }
// }
// import 'dart:convert';

// import 'package:dine_deal/features/user_side/user_auth/presentation/pages/login.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class LogoutController extends GetxController {
//   final FlutterSecureStorage storage = const FlutterSecureStorage();

//   var isLoading = false.obs;

//   Future<void> logoutUser(String token) async {
//     const String logoutURL = "http://192.168.18.94:3000/api/restaurant/logout";

//     isLoading.value = true; // Start loading indicator

//     try {
//       // Retrieve the token from secure storage
//       final token = await storage.read(key: 'jwt_token');

//       if (token == null) {
//         isLoading.value = false;
//         Get.snackbar(
//           "Error",
//           "No token found. Please log in again.",
//           snackPosition: SnackPosition.TOP,
//         );
//         return;
//       }

//       // Send the logout request
//       final response = await http.post(
//         Uri.parse(logoutURL),
//         headers: {
//           "Content-Type": "application/json",
//           "Authorization": "Bearer $token",
//         },
//       );

//       isLoading.value = false; // Stop loading indicator

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);

//         if (data['success'] == true) {
//           // Clear token from secure storage
//           await storage.delete(key: 'jwt_token');

//           // Navigate to login screen
//           Get.snackbar(
//             "Success",
//             "Logged out successfully!",
//             snackPosition: SnackPosition.TOP,
//           );
//           Get.to(() => LoginScreen());
//         } else {
//           Get.snackbar(
//             "Error",
//             data['message'] ?? "Logout failed",
//             snackPosition: SnackPosition.TOP,
//           );
//         }
//       } else {
//         Get.snackbar(
//           "Error",
//           "Server returned an invalid response. Please try again.",
//           snackPosition: SnackPosition.TOP,
//         );
//       }
//     } catch (error) {
//       isLoading.value = false;
//       Get.snackbar(
//         "Error",
//         "Failed to connect to the server: $error",
//         snackPosition: SnackPosition.TOP,
//       );
//     }
//   }
// }
// import 'dart:convert';

// import 'package:dine_deal/config/app_config.dart';
// import 'package:dine_deal/core/constants/app_constant.dart';
// import 'package:dine_deal/features/user_side/user_auth/presentation/pages/login.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class LogoutController extends GetxController {
//   final FlutterSecureStorage storage = const FlutterSecureStorage();

//   var isLoading = false.obs;

//   Future<void> logoutUser(String token) async {
//     const String logoutURL = "${AppConfig.baseURL}${AppConstant.userLogout}";

//     isLoading.value = true;

//     try {
//       final token = await storage.read(key: 'jwt_token');

//       if (token == null) {
//         isLoading.value = false;
//         Get.snackbar(
//           "Error",
//           "No token found. Please log in again.",
//           snackPosition: SnackPosition.TOP,
//         );
//         return;
//       }

//       final response = await http.post(
//         Uri.parse(logoutURL),
//         headers: {
//           "Content-Type": "application/json",
//           "Authorization": "Bearer $token",
//         },
//       );

//       isLoading.value = false;

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);

//         if (data['success'] == true) {
//           await storage.delete(key: 'jwt_token');

//           Get.snackbar(
//             "Success",
//             "Logged out successfully!",
//             snackPosition: SnackPosition.TOP,
//           );

//           Get.offAll(() => LoginScreen());
//         } else {
//           Get.snackbar(
//             "Error",
//             data['message'] ?? "Logout failed",
//             snackPosition: SnackPosition.TOP,
//           );
//         }
//       } else {
//         Get.snackbar(
//           "Error",
//           "Server returned an invalid response. Please try again.",
//           snackPosition: SnackPosition.TOP,
//         );
//       }
//     } catch (error) {
//       isLoading.value = false;
//       Get.snackbar(
//         "Error",
//         "Failed to connect to the server: $error",
//         snackPosition: SnackPosition.TOP,
//       );
//     }
//   }
// }
import 'dart:convert';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:dine_deal/features/user_side/user_auth/presentation/pages/login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LogoutController extends GetxController {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  var isLoading = false.obs;

  Future<void> logoutUser() async {
    const String logoutURL = "${AppConfig.baseURL}${AppConstant.userLogout}";

    isLoading.value = true;

    try {
      final token = await storage.read(key: 'jwt_token');

      if (token == null) {
        isLoading.value = false;
        Get.snackbar(
          "Error",
          "No token found. Please log in again.",
          snackPosition: SnackPosition.TOP,
        );
        return;
      }

      final response = await http.post(
        Uri.parse(logoutURL),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      isLoading.value = false;

      // Debug: Print raw response body
      print("Raw response body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Debug: Print decoded data
        print("Decoded data: $data");

        // Handle responses with or without 'success'
        if (data['success'] == true ||
            (data.containsKey('message') && response.statusCode == 200)) {
          print("Logout successful, navigating to login screen...");

          await storage.delete(key: 'jwt_token');

          Get.snackbar(
            "Success",
            "You have been logged out successfully.",
            snackPosition: SnackPosition.TOP,
          );

          Get.offAll(() => LoginScreen());
        } else {
          print("Decoded data does not contain 'success' or it's not true.");
          Get.snackbar(
            "Error",
            data['message'] ?? "Unexpected response from the server.",
            snackPosition: SnackPosition.TOP,
          );
        }
      } else {
        print("Non-200 response status code: ${response.statusCode}");
        Get.snackbar(
          "Error",
          "Server error. Please try again later.",
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (error) {
      isLoading.value = false;

      print("Error occurred: $error");
      Get.snackbar(
        "Error",
        "Failed to connect to the server. Please check your internet connection.",
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}
