import 'dart:convert';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GetCategoriesController extends GetxController {
  var isLoading = false.obs;
  var categoriesList = [].obs;
  var errorMessage = ''.obs;

  Future<void> fetchCategories() async {
    const String url = "${AppConfig.baseURL}${AppConstant.getType}";

    isLoading.value = true;
    errorMessage.value = "";

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Decode the JSON response
        final data = jsonDecode(response.body)["types"] as List;

        // Log the data for debugging
        print("Fetched Categories: $data");

        // Update the observable list
        categoriesList.value = data;
      } else {
        // Handle error response
        final errorBody = jsonDecode(response.body);
        errorMessage.value =
            errorBody['error'] ?? "Failed to fetch categories.";
        print("Error fetching categories: ${errorMessage.value}");
      }
    } catch (e) {
      // Handle network or JSON parsing errors
      errorMessage.value = "An error occurred: $e";
      print("Exception in fetchCategories: $e");
    } finally {
      // Reset the loading state
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchCategories(); // Automatically fetch categories when the controller is initialized.
  }
}
