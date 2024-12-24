import 'dart:convert';
import 'dart:io';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ListRestaurantController extends GetxController {
  var restaurantData = {
    "username": null,
    "email": null,
    "password": null,
    "restaurantName": null,
    "restaurantAddress": null,
    "websiteUrl": null,
    "socialMediaLinks": [],
    "phoneNumber": null,
    "restaurantType": [],
    "operationHours": null,
    "minPriceRange": null,
    "maxPriceRange": null,
    "restaurantInfo": [],
    "acceptReservation": null,
    "image": null,
    "advanceReservationPeriods": {"days": 0, "hours": 0},
    "features": [],
    "additionalNotes": null,
  }.obs;

  // Observables for UI state management
  var selectedFeatures = <String>[].obs;
  var selectedRestaurantTypes = <String>[].obs;
  var selectedRestaurantInfo = <String>[].obs;
  var isLoading = false.obs;
  var errorMessage = "".obs;
  var acceptPolicies = false.obs;
  var role = "".obs;
  var roleId = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchRole();
  }

  // Fetch role from SharedPreferences
  Future<void> fetchRole() async {
    final prefs = await SharedPreferences.getInstance();
    role.value = prefs.getString('user_role') ?? "";
    roleId.value = prefs.getInt('role_id') ?? 0;

    if (role.value.isEmpty || roleId.value == 0) {
      print("Error: No role defined in SharedPreferences.");
    } else {
      print("Fetched role: ${role.value}, Role ID: ${roleId.value}");
    }
  }

  // Update any field dynamically
  void updateRestaurantField(String key, dynamic value) {
    if (restaurantData.containsKey(key)) {
      restaurantData[key] = value;
      update(); // Notify listeners
    } else {
      print("Invalid field: $key");
    }
  }

  // Add social media links dynamically
  void addSocialMediaLinks(List<String> links) {
    if (links.isNotEmpty) {
      (restaurantData["socialMediaLinks"] as List).addAll(links);
      update();
    } else {
      Get.snackbar("Error", "Social media links cannot be empty");
    }
  }

  // Add or remove features dynamically
  void toggleFeature(String feature, bool isSelected) {
    if (isSelected) {
      if (!selectedFeatures.contains(feature)) selectedFeatures.add(feature);
    } else {
      selectedFeatures.remove(feature);
    }
    restaurantData["features"] = List<String>.from(selectedFeatures);
    update();
  }

  // Add or remove restaurant types and info dynamically
  void toggleSelection(String item, bool isSelected, String key) {
    var selectedList = key == "restaurantType"
        ? selectedRestaurantTypes
        : selectedRestaurantInfo;

    if (isSelected) {
      if (!selectedList.contains(item)) selectedList.add(item);
    } else {
      selectedList.remove(item);
    }
    restaurantData[key] = selectedList.join(", ");
    update();
  }

  // Toggle policy acceptance
  void toggleAcceptPolicies(bool value) {
    acceptPolicies.value = value;
    restaurantData["acceptReservation"] = value ? "Yes" : "No";
    update();
  }

  Future<void> submitRestaurantData(File? imageFile) async {
    print("IMage file $imageFile");
    const String apiUrl = "${AppConfig.baseURL}${AppConstant.signInRestaurant}";

    isLoading.value = true;
    errorMessage.value = "";

    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.fields['username'] = restaurantData['username']?.toString() ?? '';
      request.fields['email'] = restaurantData['email']?.toString() ?? '';
      request.fields['password'] = restaurantData['password']?.toString() ?? '';

      final Map<String, dynamic> restaurantDataMap = {
        "restaurantName": restaurantData['restaurantName']?.toString(),
        "restaurantAddress": restaurantData['restaurantAddress']?.toString(),
        "websiteUrl": restaurantData['websiteUrl']?.toString(),
        "socialMediaLinks": restaurantData['socialMediaLinks'],
        "phoneNumber": restaurantData['phoneNumber']?.toString(),
        "restaurantType": restaurantData['restaurantType'],
        "operationHours": restaurantData['operationHours']?.toString(),
        "minPriceRange": restaurantData['minPriceRange']?.toString(),
        "maxPriceRange": restaurantData['maxPriceRange']?.toString(),
        "restaurantInfo": restaurantData['restaurantInfo'],
        "acceptReservation": restaurantData['acceptReservation']?.toString(),
        "advanceReservationPeriods":
            restaurantData['advanceReservationPeriods'],
        "features": restaurantData['features'],
        "additionalNotes": restaurantData['additionalNotes']?.toString(),
      };

      request.fields['restaurantData'] = jsonEncode(restaurantDataMap);

      // Attach the image file if provided
      print("Image FIle $imageFile");
      if (imageFile != null && imageFile.existsSync()) {
        request.files.add(await http.MultipartFile.fromPath(
          'image',
          imageFile.path,
        ));
      } else {
        Get.snackbar("Error", "Image file not found.");
        return;
      }

      print("Request Fields: ${request.fields}");

      // Send the request
      var response = await request.send();
      var responseData = await response.stream.bytesToString();
      print("Response: ${response.statusCode} - $responseData");

      // Handle the response
      if (response.statusCode == 201) {
        Get.snackbar(
          "Success",
          "Restaurant added successfully!",
          backgroundColor: Colors.green,
        );
      } else {
        var jsonResponse = jsonDecode(responseData);
        errorMessage.value = jsonResponse['message'] ?? "Submission failed.";
        Get.snackbar(
          "Error",
          errorMessage.value,
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      errorMessage.value = "An error occurred: $e";
      print("Error: $e");
      Get.snackbar(
        "Error",
        errorMessage.value,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
