import 'dart:convert';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/admin_side/presentation/pages/manage_restaurant/admin_bottom_bar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AdminLoginController extends GetxController {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> adminLogin(String email, String password) async {
    const String adminLoginURL = "${AppConfig.baseURL}${AppConstant.loginUri}";

    isLoading.value = true;
    errorMessage.value = '';

    try {
      // Log the login attempt
      print("Attempting login with email: $email");

      final response = await http.post(
        Uri.parse(adminLoginURL),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        if (responseData.containsKey('token')) {
          final String token = responseData['token'];

          // Save token in secure storage
          await storage.write(key: 'jwt_token', value: token);
          await storage.write(key: 'user_email', value: email);
          await storage.write(key: 'user_password', value: password);

          // Show success message
          Get.snackbar(
            "Success",
            "Login Successful",
            backgroundColor: AppColors.yellow,
          );

          // Navigate to Admin Bottom Bar
          Get.to(() => const AdminBottomBar());
        } else {
          errorMessage.value = 'Login failed, token not found in response.';
          Get.snackbar('Error', errorMessage.value);
        }
      } else {
        // Check if the response body has an error message
        String errorBody = response.body.isEmpty
            ? 'Unknown error'
            : jsonDecode(response.body)['message'] ?? 'Unknown error';
        errorMessage.value = 'Login failed: $errorBody';
        Get.snackbar('Error', errorMessage.value);
      }
    } catch (e) {
      errorMessage.value = 'An error occurred during login: $e';
      Get.snackbar('Error', errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }

  // Fetch token from storage (optional)
  Future<String?> getToken() async {
    return await storage.read(key: 'jwt_token');
  }

  // Logout method
  Future<void> logout() async {
    await storage.delete(key: 'jwt_token');
    Get.offAllNamed("LoginScreen");
  }
}
