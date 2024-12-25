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
  var role = 'user'.obs;
  var roleId = 1.obs;

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  void onInit() {
    super.onInit();
    fetchStoredRole();
  }

  Future<void> fetchStoredRole() async {
    final prefs = await SharedPreferences.getInstance();
    role.value = prefs.getString('user_role') ?? 'user';
    roleId.value = prefs.getInt('role_id') ?? 1;
  }

  Future<void> saveSelectedRole(String selectedRole) async {
    final prefs = await SharedPreferences.getInstance();
    role.value = selectedRole;
    roleId.value = selectedRole.toLowerCase() == 'admin' ? 2 : 1;
    await prefs.setString('user_role', role.value);
    await prefs.setInt('role_id', roleId.value);
  }

  void togglePrivacyOption() {
    selectedPrivacyOption.value = !selectedPrivacyOption.value;
  }

  Future<void> saveUserDetails(String email) async {
    final prefs = await SharedPreferences.getInstance();
    final username = _generateUsernameFromEmail(email);
    await prefs.setString('user_name', username);
    await prefs.setString('user_email', email);
    await _storage.write(key: 'user_name', value: username);
  }

  String _generateUsernameFromEmail(String email) {
    return email.split('@').first.capitalizeFirst!;
  }

  Future<void> signUp({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    errorMessage.value = '';
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

    final body = {
      "username": username,
      "email": email,
      "password": password,
      "userType": role.value,
      "roleId": roleId.value,
    };

    print("Email captured in signUp method: $email"); // Debugging print

    try {
      isLoading(true);

      final response = await http.post(
        Uri.parse("${AppConfig.baseURL}${AppConstant.signUpUri}"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(body),
      );

      if (response.statusCode == 201) {
        await saveUserDetails(email);
        sendOtp(email); // Trigger OTP sending
        await Future.delayed(const Duration(seconds: 5)); // Optional delay
        Get.toNamed('/otp-verification', arguments: {"email": email});
      } else if (response.statusCode == 400) {
        final responseBody = json.decode(response.body);
        errorMessage.value =
            responseBody['message'] ?? 'Signup failed. Try again.';
        showErrorSnackbar(errorMessage.value);
      } else {
        errorMessage.value = 'Signup failed. Please try again.';
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

  Future<void> sendOtp(String email) async {
    print("Email captured in sendOtp method: $email"); // Debugging print
    try {
      final response = await http.post(
        Uri.parse("${AppConfig.baseURL}${AppConstant.sendOtp}"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"email": email}),
      );

      if (response.statusCode == 200) {
        showSuccessSnackbar("OTP sent to $email.");
      } else {
        showErrorSnackbar("Failed to send OTP. Try again.");
      }
    } catch (e) {
      showErrorSnackbar("Error sending OTP. Please try again later.");
    }
  }

  Future<void> verifyOtp(String email, String otp) async {
    try {
      final response = await http.post(
        Uri.parse("${AppConfig.baseURL}${AppConstant.getOtp}"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"email": email, "otp": otp}),
      );

      if (response.statusCode == 200) {
        showSuccessSnackbar("OTP Verified Successfully");
        await Future.delayed(const Duration(seconds: 5));
        Get.offAllNamed('/login');
      } else {
        showErrorSnackbar("Invalid or expired OTP. Please try again.");
      }
    } catch (e) {
      showErrorSnackbar("Error verifying OTP. Please try again later.");
    }
  }

  void showErrorSnackbar(String message) {}

  void showSuccessSnackbar(String message) {
    Get.snackbar(
      'Success',
      message,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.TOP,
    );
  }
}
