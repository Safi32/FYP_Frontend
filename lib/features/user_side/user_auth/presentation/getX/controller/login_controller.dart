// import 'dart:convert';

// import 'package:dine_deal/config/app_config.dart';
// import 'package:dine_deal/core/constants/app_constant.dart';
// import 'package:dine_deal/core/resources/app_colors.dart';
// import 'package:dine_deal/features/user_side/presentation/pages/bottom_bar.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class LoginController extends GetxController {
//   final FlutterSecureStorage storage = const FlutterSecureStorage();

//   var isLoading = false.obs;
//   var errorMessage = ''.obs;

//   Future<void> loginUser(String email, String password) async {
//     const String loginURL = "${AppConfig.baseURL}${AppConstant.loginUri}";

//     isLoading.value = true;
//     errorMessage.value = '';

//     try {
//       final response = await http.post(
//         Uri.parse(loginURL),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({
//           'email': email,
//           'password': password,
//         }),
//       );

//       if (response.statusCode == 200) {
//         final responseData = jsonDecode(response.body);
//         final String token = responseData['token'];

//         await storage.write(key: 'jwt_token', value: token);
//         await storage.write(key: 'user_email', value: email);
//         await storage.write(key: 'user_password', value: password);

//         Get.snackbar(
//           "Success",
//           "Login Successful",
//           backgroundColor: AppColors.yellow,
//         );

//         Get.to(() => const BottomBar());
//       } else {
//         errorMessage.value = 'Login failed, please check your credentials.';
//         Get.snackbar('Error', errorMessage.value);
//       }
//     } catch (e) {
//       errorMessage.value = 'An error occurred during login: $e';
//       Get.snackbar('Error', errorMessage.value);
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> saveUserCredentials(String email, String password) async {
//     await storage.write(key: 'user_email', value: email);
//     await storage.write(key: 'user_password', value: password);
//     Get.snackbar("Success", "Credentials saved successfully.");
//   }

//   Future<String?> getToken() async {
//     return await storage.read(key: 'jwt_token');
//   }

//   Future<void> logout() async {
//     await storage.delete(key: 'jwt_token');
//     Get.offAllNamed("LoginScreen");
//   }
// }
import 'dart:convert';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/presentation/pages/bottom_bar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> loginUser(String email, String password) async {
    const String loginURL = "${AppConfig.baseURL}${AppConstant.loginUri}";

    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await http.post(
        Uri.parse(loginURL),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        if (responseData['token'] != null) {
          final String token = responseData['token'];

          // Save token and user credentials
          await storage.write(key: 'jwt_token', value: token);
          await storage.write(key: 'user_email', value: email);
          await storage.write(key: 'user_password', value: password);

          Get.snackbar(
            "Success",
            "Login Successful",
            backgroundColor: AppColors.yellow,
          );

          // Navigate to the main app screen
          Get.to(() => const BottomBar());
        } else {
          errorMessage.value = 'Unexpected server response.';
          Get.snackbar('Error', errorMessage.value);
        }
      } else {
        errorMessage.value = 'Login failed, please check your credentials.';
        Get.snackbar('Error', errorMessage.value);
      }
    } catch (e) {
      errorMessage.value = 'An error occurred during login: $e';
      Get.snackbar('Error', errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }

  Future<String?> getToken() async {
    // Retrieve the JWT token from secure storage
    return await storage.read(key: 'jwt_token');
  }
}
