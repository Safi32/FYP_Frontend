import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OTPVerificationController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  // Controllers for each OTP field
  final otp1Controller = TextEditingController();
  final otp2Controller = TextEditingController();
  final otp3Controller = TextEditingController();
  final otp4Controller = TextEditingController();

  final String apiUrl = 'http://10.0.2.2:3000/verify';

  // Method to get the full OTP from the controllers
  String getEnteredOtp() {
    return otp1Controller.text +
        otp2Controller.text +
        otp3Controller.text +
        otp4Controller.text;
  }

  // Method to verify OTP
  Future<bool> verifyOtp(String otp) async {
    try {
      isLoading(true); // Show loading indicator

      var response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"otp": otp}), // Send the OTP in the request body
      );

      if (response.statusCode == 200) {
        errorMessage('');
        return true; // OTP verified successfully
      } else {
        // Handle error if OTP is invalid or other server issues
        errorMessage('Invalid OTP. Please try again.');
        return false; // OTP verification failed
      }
    } catch (e) {
      errorMessage('An error occurred: $e');
      print('Exception: $e');
      return false;
    } finally {
      isLoading(false);
    }
  }
}
