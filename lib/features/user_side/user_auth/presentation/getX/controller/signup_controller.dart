// import 'dart:convert';

// import 'package:dine_deal/config/app_config.dart';
// import 'package:dine_deal/core/constants/app_constant.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class SignUpController extends GetxController {
//   var selectedPrivacyOption = false.obs;
//   var isLoading = false.obs;
//   var errorMessage = ''.obs;

//   void togglePrivacyOption() {
//     selectedPrivacyOption.value = !selectedPrivacyOption.value;
//   }

//   Future<void> signUp({
//     required String email,
//     required String username,
//     required String password,
//     required String confirmPassword,
//   }) async {
//     errorMessage.value = '';

//     if (password != confirmPassword) {
//       errorMessage.value = 'Passwords do not match. Try Again';
//       showErrorSnackbar(errorMessage.value);
//       return;
//     }

//     if (!selectedPrivacyOption.value) {
//       errorMessage.value = 'Please accept terms and privacy policy.';
//       showErrorSnackbar(errorMessage.value);
//       return;
//     }

//     final body = {
//       "email": email,
//       "username": username,
//       "password": password,
//       "confirmPassword": confirmPassword,
//     };

//     try {
//       isLoading(true);

//       final response = await http.post(
//         Uri.parse("${AppConfig.baseURL}${AppConstant.signUpUri}"),
//         headers: {"Content-Type": "application/json"},
//         body: json.encode(body),
//       );

//       if (response.statusCode == 200) {
//         final responseBody = json.decode(response.body);

//         showSuccessSnackbar("User Signed Up Successfully");
//       } else {
//         final responseBody = json.decode(response.body);
//         errorMessage.value = responseBody['message'] ?? 'Signup failed';
//         showErrorSnackbar(errorMessage.value);
//       }
//     } catch (e) {
//       errorMessage.value =
//           "Failed to connect to server. Please try again later.";
//       showErrorSnackbar(errorMessage.value);
//     } finally {
//       isLoading(false);
//     }
//   }

//   void showErrorSnackbar(String message) {
//     Get.snackbar(
//       'Success',
//       message,
//       backgroundColor: Colors.green,
//       snackPosition: SnackPosition.TOP,
//     );
//   }

//   void showSuccessSnackbar(String message) {
//     Get.snackbar(
//       'Error',
//       message,
//       backgroundColor: Colors.red,
//       snackPosition: SnackPosition.TOP,
//     );
//   }
// }
import 'dart:convert';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpController extends GetxController {
  var selectedPrivacyOption = false.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  void togglePrivacyOption() {
    selectedPrivacyOption.value = !selectedPrivacyOption.value;
  }

  Future<void> signUp({
    required String email,
    required String username,
    required String password,
    required String confirmPassword,
  }) async {
    errorMessage.value = '';

    // Validate password and privacy option
    if (password != confirmPassword) {
      errorMessage.value = 'Passwords do not match. Try Again';
      showErrorSnackbar(errorMessage.value);
      return;
    }

    if (!selectedPrivacyOption.value) {
      errorMessage.value = 'Please accept terms and privacy policy.';
      showErrorSnackbar(errorMessage.value);
      return;
    }

    // Default role is 'user'
    final body = {
      "email": email,
      "username": username,
      "password": password,
      "confirmPassword": confirmPassword,
      "role": "user", // Explicitly set default role
    };

    try {
      isLoading(true);

      final response = await http.post(
        Uri.parse("${AppConfig.baseURL}${AppConstant.signUpUri}"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(body),
      );

      if (response.statusCode == 201) {
        // Status code for created
        showSuccessSnackbar("User Signed Up Successfully");
      } else {
        final responseBody = json.decode(response.body);
        errorMessage.value = responseBody['message'] ?? 'Signup failed';
        showErrorSnackbar(errorMessage.value);
      }
    } catch (e) {
      errorMessage.value =
          "Failed to connect to server. Please try again later.";
      showErrorSnackbar(errorMessage.value);
    } finally {
      isLoading(false);
    }
  }

  void showErrorSnackbar(String message) {
    Get.snackbar(
      'Error',
      message,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.TOP,
    );
  }

  void showSuccessSnackbar(String message) {
    Get.snackbar(
      'Success',
      message,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.TOP,
    );
  }
}
