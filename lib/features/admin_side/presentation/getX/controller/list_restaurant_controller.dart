import 'dart:convert';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ListRestaurantController extends GetxController {
  var restaurantData = {
    "restaurantName": null,
    "phoneNumber": null,
    "email": null,
    "password": null,
    "restaurantAddress": null,
    "websiteUrl": null,
    "socialMediaLinks": [],
    "restaurantType": [],
    "operationDetails": null,
    "minPriceRange": null,
    "maxPriceRange": null,
    "restaurantInfo": [],
    "acceptsReservations": null,
    "advanceReservationPeriods": {"days": 0, "hours": 0},
    "features": [],
    "additionalNotes": null,
    "role": null,
  }.obs;

  var selectedFeatures = <String>[].obs;
  var selectedRestaurantTypes = <String>[].obs;
  var selectedRestaurantInfo = <String>[].obs;
  var isLoading = false.obs;
  var errorMessage = "".obs;
  var acceptPolicies = false.obs;
  var reservationOption = 'Yes'.obs;
  var selectedImagePath = ''.obs;
  var role = "".obs;

  @override
  void onInit() async {
    super.onInit();
    await loadRoleFromPreferences();
  }

  Future<void> loadRoleFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    role.value = prefs.getString("role") ?? "";
    restaurantData["role"] = role.value;
    update();
  }

  void toggleAcceptPolicies(bool value) {
    acceptPolicies.value = value;
    restaurantData["acceptPolicies"] = value ? "Yes" : "No";
    update();
  }

  void updateAdditionalInformation(String info) {
    restaurantData["additionalInformation"] = info;
    update();
  }

  void toggleFeature(String feature, bool isSelected) {
    if (isSelected) {
      if (!selectedFeatures.contains(feature)) selectedFeatures.add(feature);
    } else {
      selectedFeatures.remove(feature);
    }
    restaurantData["restaurantFeatures"] = selectedFeatures;
    update();
  }

  void toggleSelection(String type, bool isSelected, String key) {
    var selectedList = key == "restaurantType"
        ? selectedRestaurantTypes
        : selectedRestaurantInfo;

    if (isSelected) {
      if (!selectedList.contains(type)) selectedList.add(type);
    } else {
      selectedList.remove(type);
    }
    restaurantData[key] = List<String>.from(selectedList);
    update();
  }

  void updateRestaurantField(String key, dynamic value) {
    if (restaurantData.containsKey(key)) {
      restaurantData[key] = value;
    } else if (key.contains(".")) {
      final keys = key.split(".");
      dynamic current = restaurantData;
      for (var i = 0; i < keys.length - 1; i++) {
        current = current[keys[i]];
      }
      current[keys.last] = value;
    } else {
      errorMessage.value = "Invalid field: $key";
      update();
    }
  }

  void addSocialMediaLinks(List<String> links) {
    if (links.isNotEmpty) {
      (restaurantData["socialMediaLinks"] as List).addAll(links);
      update();
    } else {
      Get.snackbar("Error", "Social media links cannot be empty");
    }
  }

  Future<void> submitRestaurantData() async {
    const String apiUrl = "${AppConfig.baseURL}${AppConstant.signUpUri}";
    final headers = {'Content-Type': 'application/json'};

    try {
      isLoading.value = true;
      errorMessage.value = "";

      print("Payload to API: ${jsonEncode(restaurantData.value)}");

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(restaurantData.value),
      );

      print("Response Status: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 201) {
        Get.snackbar("Success", "Restaurant data submitted successfully");
      } else {
        final responseData = jsonDecode(response.body);
        errorMessage.value = responseData['message'] ?? "Submission failed";
        Get.snackbar("Error", errorMessage.value);
      }
    } catch (e) {
      errorMessage.value = "An error occurred: $e";
      Get.snackbar("Error", errorMessage.value);
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
