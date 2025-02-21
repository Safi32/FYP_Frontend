import 'dart:convert';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChangePasswordController extends GetxController {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  var isLoading = false.obs;

  void clearFields() {
    oldPasswordController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
  }

  Future<void> changePassword() async {
    isLoading.value = true;
    final String? token = await storage.read(key: 'jwt_token');
    if (token == null) {
      Get.snackbar(
        "Error",
        "Authentication token not found.Please login again",
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.TOP,
      );
      isLoading.value = false;
      return;
    }
    if (newPasswordController.text != confirmPasswordController.text) {
      Get.snackbar(
        "Error",
        "New password and confirm password do not match",
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.TOP,
      );
      isLoading.value = false;
      return;
    }
    const String changePasswordURL =
        "${AppConfig.baseURL}${AppConstant.changePassword}";

    try {
      final response = await http.post(
        Uri.parse(changePasswordURL),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'old_password': oldPasswordController.text,
          'new_password': newPasswordController.text,
          'confirm_password': confirmPasswordController.text,
        }),
      );
      final responseData = jsonDecode(response.body);
      print("Response: $responseData");

      if (response.statusCode == 200) {
        Get.snackbar(
          "Success",
          "Password change successfully",
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.TOP,
        );
        clearFields();
      } else {
        Get.snackbar(
          "Error",
          responseData['message'] ?? "Failed to change password",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to connect to server",
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.TOP,
      );
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
