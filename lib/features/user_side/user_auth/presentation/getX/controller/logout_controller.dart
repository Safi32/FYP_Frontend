import 'dart:convert';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:dine_deal/features/user_side/user_auth/presentation/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LogoutController extends GetxController {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  var isLoading = false.obs;
  Future<void> _clearUserData() async {
    await storage.deleteAll();
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<void> logout() async {
    isLoading.value = true;
    try {
      final token = await storage.read(key: 'jwt_token');
      if (token == null) {
        Get.snackbar("Error", "No token found, please log in again",
            snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
        return;
      }
      const String logoutURL = "${AppConfig.baseURL}${AppConstant.logout}";
      final response = await http.post(Uri.parse(logoutURL), headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {
        Get.snackbar("Success", "Logout Successfully",
            snackPosition: SnackPosition.TOP, backgroundColor: Colors.green);
        await _clearUserData();
        Get.off(() => LoginScreen());
      } else {
        final errorBody =
            jsonDecode(response.body)['message'] ?? "logout failed";
        Get.snackbar("Error", errorBody,
            backgroundColor: Colors.red, snackPosition: SnackPosition.TOP);
        print("Logout Failed : $errorBody");
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong : $e");
      print("Exception: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
