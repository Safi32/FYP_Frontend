import 'dart:convert';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddDealsController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> addDeals({
    required String dealName,
    required String dealCategory,
    required double dealPrice,
    required String dealDetails,
    required String mediaPath,
  }) async {
    const String dealURL = "${AppConfig.baseURL}${AppConstant.addDeals}";

    isLoading.value = true;
    errorMessage.value = '';

    try {
      var request = http.MultipartRequest('POST', Uri.parse(dealURL));
      request.fields['name'] = dealName;
      request.fields['category'] = dealCategory;
      request.fields['price'] = dealPrice.toString();
      request.fields['details'] = dealDetails;

      if (mediaPath.isNotEmpty) {
        request.files
            .add(await http.MultipartFile.fromPath('image', mediaPath));
      }

      var response = await request.send();
      var responseData = await response.stream.bytesToString();
      print("Response: ${response.statusCode} - $responseData");

      if (response.statusCode == 201) {
        // 201 for created
        Get.snackbar("Success", "Deal Added Successfully");
      } else {
        var jsonResponse = jsonDecode(responseData);
        errorMessage.value = jsonResponse['error'] ?? 'Failed to add deal';
        Get.snackbar("Error", errorMessage.value);
      }
    } catch (e) {
      errorMessage.value = "An error occurred: $e";
      Get.snackbar("Error", errorMessage.value);
      print("Error $errorMessage.value");
    } finally {
      isLoading.value = false;
    }
  }
}
