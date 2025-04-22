import 'dart:convert';
import 'dart:developer';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/models/login_data_model.dart';
import 'package:dine_deal/features/user_side/presentation/pages/bottom_bar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var loginData = LoginDataModel().obs;

  Future<void> saveUserDetails(String email) async {
    final prefs = await SharedPreferences.getInstance();
    final username = _generateUsernameFromEmail(email);
    await prefs.setString('user_name', username);
    await prefs.setString('user_email', email);
  }

  String _generateUsernameFromEmail(String email) {
    return email.split('@').first.capitalizeFirst!;
  }

  Future<void> loginUser(String email, String password) async {
    const String loginURL = "${AppConfig.baseURL}${AppConstant.loginUri}";

    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await http.post(
        Uri.parse(loginURL),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        log("response ${response.body}");
        loginData.value = loginDataModelFromMap(response.body);
        log("response12 ${loginData.value}");

        final token = loginData.value.data?.token;
        final userEmail = loginData.value.data?.user?.email;
        final userName = loginData.value.data?.user?.username;

        if (token != null && userEmail != null) {
          await storage.write(key: 'jwt_token', value: token);
          await storage.write(key: 'user_password', value: password);

          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('user_email', userEmail);
          await prefs.setString('user_name', userName ?? "");
          print("User Email saved: $userEmail");

          Get.snackbar(
            "Success",
            "User Login Successful",
            backgroundColor: AppColors.yellow,
          );
          Get.offAll(() => const BottomBar());
        } else {
          throw Exception("Token or Email is missing in response.");
        }
      } else {
        final errorBody =
            jsonDecode(response.body)['message'] ?? "Login failed";
        errorMessage.value = errorBody;
        Get.snackbar("Error", errorMessage.value);
        print("Login failed: $errorBody");
      }
    } catch (e) {
      errorMessage.value = 'Something went wrong: $e';
      Get.snackbar("Error", errorMessage.value);
      print("Exception: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<String?> getToken() async {
    return await storage.read(key: 'jwt_token');
  }

  Future<void> logout() async {
    await storage.delete(key: 'jwt_token');
    await storage.delete(key: 'user_email');
    await storage.delete(key: 'user_password');
    Get.offAllNamed("LoginScreen");
  }
}
