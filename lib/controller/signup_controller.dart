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
    required String phoneNumber,
    required String password,
    required String confirmPassword,
  }) async {
    errorMessage.value = ''; // Reset error message on new attempt

    if (password != confirmPassword) {
      errorMessage.value = 'Passwords do not match. Try Again';
      return;
    }

    final body = {
      "email": email,
      "phoneNumber": phoneNumber,
      "password": password,
      "confirmPassword": confirmPassword,
    };

    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse("http://192.168.145.28:3000/signup"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(body),
      );

      if (response.statusCode == 201) {
        Get.snackbar('Success', "User Signed Up Successfully",
            backgroundColor: Colors.green);
      } else {
        final responseBody = json.decode(response.body);
        errorMessage.value = responseBody['message'] ?? 'Signup failed';
      }
    } catch (e) {
      errorMessage.value = "Failed to connect to server";
    } finally {
      isLoading(false);
    }
  }
}
