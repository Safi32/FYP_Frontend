// // import 'dart:convert';

// // import 'package:dine_deal/config/app_config.dart';
// // import 'package:dine_deal/core/constants/app_constant.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:shared_preferences/shared_preferences.dart';

// // class SignUpController extends GetxController {
// //   var selectedPrivacyOption = false.obs;
// //   var isLoading = false.obs;
// //   var errorMessage = ''.obs;
// //   var role = ''.obs;
// //   var roleId = 0.obs;

// //   @override
// //   void onInit() {
// //     super.onInit();
// //     fetchRole();
// //   }

// //   Future<void> fetchRole() async {
// //     final prefs = await SharedPreferences.getInstance();
// //     role.value = prefs.getString('user_role') ?? "";
// //     roleId.value = prefs.getInt('role_id') ?? 0;

// //     if (role.value.isEmpty || roleId.value == 0) {
// //       print("Error: No role defined in SharedPreferences.");
// //     } else {
// //       print("Fetched role: ${role.value}, Role ID: ${roleId.value}");
// //     }
// //   }

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

// //     role.value = "User";
// //     roleId.value = 1;

// //     final body = {
// //       "email": email,
// //       "username": username,
// //       "password": password,
// //       "userType": role.value, // Hardcoded as "User"
// //       "roleId": roleId.value, // Role ID for "User"
// //     };

// //     try {
// //       isLoading(true);

// //       final response = await http.post(
// //         Uri.parse("${AppConfig.baseURL}${AppConstant.signUpUri}"),
// //         headers: {"Content-Type": "application/json"},
// //         body: json.encode(body),
// //       );

// //       if (response.statusCode == 201) {
// //         final responseBody = json.decode(response.body);

// //         // Extract user data
// //         final userData = responseBody['data'];
// //         role.value = userData['userType'];
// //         roleId.value = userData['roleId'];
// //         final savedUsername = userData['username'];

// //         // Save user role to SharedPreferences
// //         final prefs = await SharedPreferences.getInstance();
// //         await prefs.setString('user_role', role.value);
// //         await prefs.setInt('role_id', roleId.value);
// //         await prefs.setString('user_name', savedUsername);

// //         print("Role saved: ${role.value}, Role ID: ${roleId.value}");
// //         print("Username saved: $savedUsername");

// //         showSuccessSnackbar("User Signed Up Successfully");
// //         Get.offAllNamed('/login');
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
// //       'Error',
// //       message,
// //       backgroundColor: Colors.red,
// //       snackPosition: SnackPosition.TOP,
// //     );
// //   }

// //   void showSuccessSnackbar(String message) {
// //     Get.snackbar(
// //       'Success',
// //       message,
// //       backgroundColor: Colors.green,
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
//   var role = ''.obs;
//   var roleId = 0.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchRole();
//   }

//   Future<void> fetchRole() async {
//     final prefs = await SharedPreferences.getInstance();
//     role.value = prefs.getString('user_role') ?? "";
//     roleId.value = prefs.getInt('role_id') ?? 0;

//     if (role.value.isEmpty || roleId.value == 0) {
//       print("Error: No role defined in SharedPreferences.");
//     } else {
//       print("Fetched role: ${role.value}, Role ID: ${roleId.value}");
//     }
//   }

//   void togglePrivacyOption() {
//     selectedPrivacyOption.value = !selectedPrivacyOption.value;
//   }

//   /// Save username after successful signup
//   Future<void> saveUsernameLocally(String username) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('user_name', username);
//     print("Username saved locally: $username");
//   }

//   /// Fetch saved username
//   Future<String?> getUsername() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString('user_name');
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

//     role.value = "User";
//     roleId.value = 1;

//     final body = {
//       "email": email,
//       "username": username,
//       "password": password,
//       "userType": role.value, // Hardcoded as "User"
//       "roleId": roleId.value, // Role ID for "User"
//     };

//     try {
//       isLoading(true);

//       final response = await http.post(
//         Uri.parse("${AppConfig.baseURL}${AppConstant.signUpUri}"),
//         headers: {"Content-Type": "application/json"},
//         body: json.encode(body),
//       );

//       if (response.statusCode == 201) {
//         final responseBody = json.decode(response.body);

//         // Extract user data
//         final userData = responseBody['data'];
//         role.value = userData['userType'];
//         roleId.value = userData['roleId'];
//         final savedUsername = userData['username'];

//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setString('user_name', savedUsername);
//         print("Username saved in SharedPreferences: $savedUsername");

//         print("Role saved: ${role.value}, Role ID: ${roleId.value}");
//         print("Username saved: $savedUsername");

//         showSuccessSnackbar("User Signed Up Successfully");
//         Get.offAllNamed('/login');
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
// import 'dart:convert';

// import 'package:dine_deal/config/app_config.dart';
// import 'package:dine_deal/core/constants/app_constant.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class SignUpController extends GetxController {
//   var selectedPrivacyOption = false.obs;
//   var isLoading = false.obs;
//   var errorMessage = ''.obs;
//   var role = ''.obs;
//   var roleId = 0.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchRole();
//   }

//   /// Fetch user role from SharedPreferences
//   Future<void> fetchRole() async {
//     final prefs = await SharedPreferences.getInstance();
//     role.value = prefs.getString('user_role') ?? "";
//     roleId.value = prefs.getInt('role_id') ?? 0;

//     if (role.value.isEmpty || roleId.value == 0) {
//       print("Error: No role defined in SharedPreferences.");
//     } else {
//       print("Fetched role: ${role.value}, Role ID: ${roleId.value}");
//     }
//   }

//   /// Toggle the privacy option
//   void togglePrivacyOption() {
//     selectedPrivacyOption.value = !selectedPrivacyOption.value;
//   }

//   /// Save username to SharedPreferences
//   Future<void> saveUsernameLocally(String username) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('user_name', username);
//     print("Username saved locally: $username");
//   }

//   /// Retrieve saved username from SharedPreferences
//   Future<String?> getUsername() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString('user_name');
//   }

//   /// Handle user signup
//   Future<void> signUp({
//     required String email,
//     required String username,
//     required String password,
//     required String confirmPassword,
//   }) async {
//     errorMessage.value = '';

//     // Validate passwords
//     if (password != confirmPassword) {
//       errorMessage.value = 'Passwords do not match. Try Again';
//       showErrorSnackbar(errorMessage.value);
//       return;
//     }

//     // Validate privacy option
//     if (!selectedPrivacyOption.value) {
//       errorMessage.value = 'Please accept terms and privacy policy.';
//       showErrorSnackbar(errorMessage.value);
//       return;
//     }

//     // Set default role for signup
//     role.value = "User";
//     roleId.value = 1;

//     final body = {
//       "email": email,
//       "username": username,
//       "password": password,
//       "userType": role.value,
//       "roleId": roleId.value,
//     };

//     try {
//       isLoading(true);

//       final response = await http.post(
//         Uri.parse("${AppConfig.baseURL}${AppConstant.signUpUri}"),
//         headers: {"Content-Type": "application/json"},
//         body: json.encode(body),
//       );

//       if (response.statusCode == 201) {
//         final responseBody = json.decode(response.body);

//         // Extract user data from the response
//         final userData = responseBody['data'];
//         role.value = userData['userType'];
//         roleId.value = userData['roleId'];
//         final savedUsername = userData['username'];

//         const storage = FlutterSecureStorage();
//         await storage.write(key: 'user_name', value: savedUsername);
//         print("Username saved in Secure Storage: $savedUsername");

//         await saveUsernameLocally(savedUsername);

//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setString('user_role', role.value);
//         await prefs.setInt('role_id', roleId.value);

//         print("Role saved: ${role.value}, Role ID: ${roleId.value}");
//         print("Username saved: $savedUsername");

//         showSuccessSnackbar("User Signed Up Successfully");
//         Get.offAllNamed('/login');
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

//   /// Show error snackbar
//   void showErrorSnackbar(String message) {
//     Get.snackbar(
//       'Error',
//       message,
//       backgroundColor: Colors.red,
//       snackPosition: SnackPosition.TOP,
//     );
//   }

//   /// Show success snackbar
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
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignUpController extends GetxController {
  var selectedPrivacyOption = false.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var role = ''.obs;
  var roleId = 0.obs;

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  void onInit() {
    super.onInit();
    fetchRole();
  }

  /// Fetch user role from SharedPreferences
  Future<void> fetchRole() async {
    final prefs = await SharedPreferences.getInstance();
    role.value = prefs.getString('user_role') ?? "";
    roleId.value = prefs.getInt('role_id') ?? 0;

    if (role.value.isEmpty || roleId.value == 0) {
      print("Error: No role defined in SharedPreferences.");
    } else {
      print("Fetched role: ${role.value}, Role ID: ${roleId.value}");
    }
  }

  /// Toggle the privacy option
  void togglePrivacyOption() {
    selectedPrivacyOption.value = !selectedPrivacyOption.value;
  }

  /// Save username to both SharedPreferences and Secure Storage
  Future<void> saveUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', username);
    await _storage.write(key: 'user_name', value: username);
    print("Username saved locally and securely: $username");
  }

  /// Retrieve username from Secure Storage
  Future<String?> getUsername() async {
    final username = await _storage.read(key: 'user_name');
    print("Retrieved Username from Secure Storage: $username");
    return username;
  }

  /// Handle user signup
  Future<void> signUp({
    required String email,
    required String username,
    required String password,
    required String confirmPassword,
  }) async {
    errorMessage.value = '';

    // Validate passwords
    if (password != confirmPassword) {
      errorMessage.value = 'Passwords do not match. Try Again';
      showErrorSnackbar(errorMessage.value);
      return;
    }

    // Validate privacy option
    if (!selectedPrivacyOption.value) {
      errorMessage.value = 'Please accept terms and privacy policy.';
      showErrorSnackbar(errorMessage.value);
      return;
    }

    // Set default role for signup
    role.value = "User";
    roleId.value = 1;

    final body = {
      "email": email,
      "username": username,
      "password": password,
      "userType": role.value,
      "roleId": roleId.value,
    };

    try {
      isLoading(true);

      final response = await http.post(
        Uri.parse("${AppConfig.baseURL}${AppConstant.signUpUri}"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(body),
      );

      if (response.statusCode == 201) {
        final responseBody = json.decode(response.body);
        final userData = responseBody['data'];
        role.value = userData['userType'];
        roleId.value = userData['roleId'];
        final savedUsername = userData['username'];
        await saveUsername(savedUsername);

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_role', role.value);
        await prefs.setInt('role_id', roleId.value);

        print("Role saved: ${role.value}, Role ID: ${roleId.value}");
        print("Username saved: $savedUsername");

        showSuccessSnackbar("User Signed Up Successfully");
        Get.offAllNamed('/login');
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

  /// Show error snackbar
  void showErrorSnackbar(String message) {
    Get.snackbar(
      'Error',
      message,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.TOP,
    );
  }

  /// Show success snackbar
  void showSuccessSnackbar(String message) {
    Get.snackbar(
      'Success',
      message,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.TOP,
    );
  }
}
