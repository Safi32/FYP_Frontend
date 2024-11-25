import 'dart:convert';

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

    // Password match validation
    if (password != confirmPassword) {
      errorMessage.value = 'Passwords do not match. Try Again';
      showErrorSnackbar(errorMessage.value);
      return;
    }

    // Privacy option validation
    if (!selectedPrivacyOption.value) {
      errorMessage.value = 'Please accept terms and privacy policy.';
      showErrorSnackbar(errorMessage.value);
      return;
    }

    final body = {
      "email": email,
      "username": username,
      "password": password,
      "confirmPassword": confirmPassword,
    };

    try {
      isLoading(true);

      final response = await http.post(
        Uri.parse("http://192.168.54.165:3000/signup"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        // Show success message
        showSuccessSnackbar("User Signed Up Successfully");
      } else {
        // Handle errors returned from the server
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
      'Success',
      message,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.TOP,
    );
  }

  void showSuccessSnackbar(String message) {
    Get.snackbar(
      'Error',
      message,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.TOP,
    );
  }
}
