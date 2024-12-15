import 'dart:convert';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/admin_side/presentation/pages/manage_restaurant/admin_bottom_bar.dart';
import 'package:dine_deal/models/login_data_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AdminLoginController extends GetxController {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var loginData = LoginDataModel().obs;

  Future<void> adminLogin(String email, String password) async {
    const String adminLoginURL = "${AppConfig.baseURL}${AppConstant.loginUri}";

    isLoading.value = true;
    errorMessage.value = '';

    try {
      print("Attempting login with email: $email and password: $password");

      final response = await http.post(
        Uri.parse(adminLoginURL),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        loginData.value = loginDataModelFromMap(response.body);

        final token = loginData.value.data?.token;
        final userType = loginData.value.data?.user?.userType;

        if (token != null && userType != null) {
          if (userType == "Admin") {
            await storage.write(key: 'jwt_token', value: token);
            await storage.write(
                key: 'user_email',
                value: loginData.value.data?.user?.email ?? "");
            await storage.write(key: 'user_password', value: password);

            Get.snackbar(
              "Success",
              "Admin Login Successful",
              backgroundColor: AppColors.yellow,
            );

            Get.offAll(() => const AdminBottomBar());
          } else {
            errorMessage.value = "Access Denied: Only Admins can log in.";
            Get.snackbar(
              "Error",
              errorMessage.value,
              backgroundColor: AppColors.error,
            );
            print("Access Denied: User type is $userType");
          }
        } else {
          throw Exception("Token or User Type is missing in response.");
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
