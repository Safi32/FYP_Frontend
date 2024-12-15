// // import 'dart:convert';

// // import 'package:dine_deal/config/app_config.dart';
// // import 'package:dine_deal/core/constants/app_constant.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:http/http.dart' as http;

// // class SignUpController extends GetxController {
// //   var selectedPrivacyOption = false.obs;
// //   var isLoading = false.obs;
// //   var errorMessage = ''.obs;

// //   void togglePrivacyOption() {
// //     selectedPrivacyOption.value = !selectedPrivacyOption.value;
// //   }

// //   Future<void> signUp({
// //     required String email,
// //     required String username,
// //     required String password,
// //     required String confirmPassword,
// //   }) async {
// //     errorMessage.value = '';

// //     if (password != confirmPassword) {
// //       errorMessage.value = 'Passwords do not match. Try Again';
// //       showErrorSnackbar(errorMessage.value);
// //       return;
// //     }

// //     if (!selectedPrivacyOption.value) {
// //       errorMessage.value = 'Please accept terms and privacy policy.';
// //       showErrorSnackbar(errorMessage.value);
// //       return;
// //     }

// //     final body = {
// //       "email": email,
// //       "username": username,
// //       "password": password,
// //       "confirmPassword": confirmPassword,
// //     };

// //     try {
// //       isLoading(true);

// //       final response = await http.post(
// //         Uri.parse("${AppConfig.baseURL}${AppConstant.signUpUri}"),
// //         headers: {"Content-Type": "application/json"},
// //         body: json.encode(body),
// //       );

// //       if (response.statusCode == 200) {
// //         final responseBody = json.decode(response.body);

// //         showSuccessSnackbar("User Signed Up Successfully");
// //       } else {
// //         final responseBody = json.decode(response.body);
// //         errorMessage.value = responseBody['message'] ?? 'Signup failed';
// //         showErrorSnackbar(errorMessage.value);
// //       }
// //     } catch (e) {
// //       errorMessage.value =
// //           "Failed to connect to server. Please try again later.";
// //       showErrorSnackbar(errorMessage.value);
// //     } finally {
// //       isLoading(false);
// //     }
// //   }

// //   void showErrorSnackbar(String message) {
// //     Get.snackbar(
// //       'Success',
// //       message,
// //       backgroundColor: Colors.green,
// //       snackPosition: SnackPosition.TOP,
// //     );
// //   }

// //   void showSuccessSnackbar(String message) {
// //     Get.snackbar(
// //       'Error',
// //       message,
// //       backgroundColor: Colors.red,
// //       snackPosition: SnackPosition.TOP,
// //     );
// //   }
// // }
// import 'dart:convert';

// import 'package:dine_deal/config/app_config.dart';
// import 'package:dine_deal/core/constants/app_constant.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class SignUpController extends GetxController {
//   var selectedPrivacyOption = false.obs;
//   var isLoading = false.obs;
//   var errorMessage = ''.obs;
//   var role = ''.obs; // Dynamically fetched role (User or Admin)

//   @override
//   void onInit() {
//     super.onInit();
//     fetchRole(); // Fetch role when the controller initializes
//   }

//   /// Fetch saved role from SharedPreferences
//   Future<void> fetchRole() async {
//     final prefs = await SharedPreferences.getInstance();
//     role.value =
//         prefs.getString('user_role') ?? ""; // Default to empty if not found
//     if (role.value.isEmpty) {
//       print("Error: No role defined in SharedPreferences.");
//     } else {
//       print("Fetched role: ${role.value}"); // Debug log
//     }
//   }

//   /// Toggle Privacy Option
//   void togglePrivacyOption() {
//     selectedPrivacyOption.value = !selectedPrivacyOption.value;
//   }

//   /// Signup Logic
//   Future<void> signUp({
//     required String email,
//     required String username,
//     required String password,
//     required String confirmPassword,
//   }) async {
//     errorMessage.value = '';

//     // Validate password and privacy option
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

//     // Check if role is set
//     if (role.value.isEmpty) {
//       errorMessage.value =
//           'Role not defined. Please go back and select a role.';
//       showErrorSnackbar(errorMessage.value);
//       return;
//     }

//     final body = {
//       "email": email,
//       "username": username,
//       "password": password,
//       "role": role.value,
//     };

//     try {
//       isLoading(true);

//       final response = await http.post(
//         Uri.parse("${AppConfig.baseURL}${AppConstant.signUpUri}"),
//         headers: {"Content-Type": "application/json"},
//         body: json.encode(body),
//       );

//       if (response.statusCode == 201) {
//         // Status code for created
//         showSuccessSnackbar("User Signed Up Successfully");
//         Get.offAllNamed('/login'); // Navigate to login or home
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
//       'Error',
//       message,
//       backgroundColor: Colors.red,
//       snackPosition: SnackPosition.TOP,
//     );
//   }

//   void showSuccessSnackbar(String message) {
//     Get.snackbar(
//       'Success',
//       message,
//       backgroundColor: Colors.green,
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
import 'package:shared_preferences/shared_preferences.dart';

class SignUpController extends GetxController {
  var selectedPrivacyOption = false.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var role = ''.obs; // Dynamically fetched role (User or Admin)
  var roleId = 0.obs; // Dynamically fetched roleId (1 or 2)

  @override
  void onInit() {
    super.onInit();
    fetchRole(); // Fetch role when the controller initializes
  }

  /// Fetch saved role from SharedPreferences
  Future<void> fetchRole() async {
    final prefs = await SharedPreferences.getInstance();
    role.value = prefs.getString('user_role') ?? ""; // Fetch role name
    roleId.value = prefs.getInt('role_id') ?? 0; // Fetch role ID

    if (role.value.isEmpty || roleId.value == 0) {
      print("Error: No role defined in SharedPreferences.");
    } else {
      print(
          "Fetched role: ${role.value}, Role ID: ${roleId.value}"); // Debug log
    }
  }

  /// Toggle Privacy Option
  void togglePrivacyOption() {
    selectedPrivacyOption.value = !selectedPrivacyOption.value;
  }

  /// Signup Logic
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

    // Check if role is set
    if (role.value.isEmpty || roleId.value == 0) {
      errorMessage.value =
          'Role not defined. Please go back and select a role.';
      showErrorSnackbar(errorMessage.value);
      return;
    }

    // Build request body
    final body = {
      "email": email,
      "username": username,
      "password": password,
      "userType": role.value, // Use fetched role (Admin/User)
      "roleId": roleId.value, // Use fetched role ID (1/2)
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
        Get.offAllNamed('/login'); // Navigate to login or home
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
