import 'dart:convert';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/admin_side/presentation/pages/manage_restaurant/admin_bottom_bar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AdminLogincontroller extends GetxController {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> adminLogin(String email, String password) async {
    const String adminLoginURL =
        "${AppConfig.baseURL}${AppConstant.restaurantAdminLogin}";

    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await http.post(
        Uri.parse(adminLoginURL),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );
      print(response.body);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        final String token = responseData['token'];

        await storage.write(key: 'jwt_token', value: token);
        await storage.write(key: 'user_email', value: email);
        await storage.write(key: 'user_password', value: password);

        Get.snackbar(
          "Success",
          "Login Successful",
          backgroundColor: AppColors.yellow,
        );

        Get.to(() => const AdminBottomBar());
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
    return await storage.read(key: 'jwt_token');
  }

  Future<void> logout() async {
    await storage.delete(key: 'jwt_token');
    Get.offAllNamed("LoginScreen");
  }
}
