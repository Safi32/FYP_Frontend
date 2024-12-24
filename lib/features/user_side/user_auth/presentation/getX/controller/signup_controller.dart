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

    if (role.value.isEmpty || roleId.value == 0) {
      print("No role stored. Defaulting to user role.");
    } else {
      print("Stored role: ${role.value}, Role ID: ${roleId.value}");
    }
  }

  Future<void> saveSelectedRole(String selectedRole) async {
    final prefs = await SharedPreferences.getInstance();
    role.value = selectedRole;
    roleId.value = selectedRole.toLowerCase() == 'admin' ? 2 : 1;
    await prefs.setString('user_role', role.value);
    await prefs.setInt('role_id', roleId.value);
    print("Role saved: ${role.value}, Role ID: ${roleId.value}");
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
    print("User details saved: $username, $email");
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

    try {
      isLoading(true);

      final response = await http.post(
        Uri.parse("${AppConfig.baseURL}${AppConstant.signUpUri}"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(body),
      );

      if (response.statusCode == 201) {
        await saveUserDetails(email);
        showSuccessSnackbar("User Signed Up Successfully");
        Get.offAllNamed('/login');
      } else if (response.statusCode == 400) {
        final responseBody = json.decode(response.body);
        if (responseBody['message'] == 'Email already exists') {
          errorMessage.value =
              "Email already exists. Please use another email.";
          showErrorSnackbar(errorMessage.value);
        } else {
          errorMessage.value =
              responseBody['message'] ?? 'Signup failed. Try again.';
          showErrorSnackbar(errorMessage.value);
        }
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
