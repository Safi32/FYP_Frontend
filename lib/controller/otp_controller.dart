import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OtpController extends GetxController {
  var isLoading = false.obs;
  var otpSent = false.obs;
  var errorMessage = ''.obs;

  final String apiUrl = 'http://10.0.2.2:3000/otp';

  Future<void> sendOtp(String email) async {
    try {
      isLoading(true);

      var response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email}),
      );

      if (response.statusCode == 200) {
        otpSent(true);
        errorMessage('');
        Get.snackbar('Success', 'OTP sent successfully!');
      } else {
        print('Error: ${response.statusCode} ${response.body}');
        otpSent(false);
        errorMessage('Failed to send OTP: ${response.body}');
        Get.snackbar('Error', 'Failed to send OTP');
      }
    } catch (e) {
      otpSent(false);
      errorMessage('Error: $e');
      Get.snackbar('Error', 'An error occurred: $e');
      print('Exception: $e');
    } finally {
      isLoading(false);
    }
  }
}
