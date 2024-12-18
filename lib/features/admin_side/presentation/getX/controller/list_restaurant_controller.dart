import 'dart:io';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListRestaurantController extends GetxController {
  var restaurantData = {
    "username": null,
    "email": null,
    "password": null,
    "roleId": null,
    "userType": null,
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
    "image": null,
    "advanceReservationPeriods": {"days": 0, "hours": 0},
    "features": [],
    "additionalNotes": null,
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
  var roleId = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchRole();
  }

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

  void toggleAcceptPolicies(bool value) {
    acceptPolicies.value = value;
    restaurantData["acceptReservations"] = value ? "Yes" : "No";
    update();
  }

  void updateAdditionalInformation(String info) {
    restaurantData["additionalNotes"] = info;
    update();
  }

  void toggleFeature(String feature, bool isSelected) {
    if (isSelected) {
      if (!selectedFeatures.contains(feature)) selectedFeatures.add(feature);
    } else {
      selectedFeatures.remove(feature);
    }
    restaurantData["features"] = List<String>.from(selectedFeatures);
    update();
  }

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
    }
    update();
  }

  void addSocialMediaLinks(List<String> links) {
    if (links.isNotEmpty) {
      (restaurantData["socialMediaLinks"] as List).addAll(links);
      update();
    } else {
      Get.snackbar("Error", "Social media links cannot be empty");
    }
  }

  Future<void> submitRestaurantData(File imageFile) async {
    const String apiUrl = "${AppConfig.baseURL}${AppConstant.signInRestaurant}";
    final dio.Dio dioClient = dio.Dio();

    try {
      isLoading.value = true;
      errorMessage.value = "";

      Map<String, dynamic> validData = {};
      restaurantData.value.forEach((key, value) {
        if (value != null && value.toString().isNotEmpty) {
          validData[key] = value;
        }
      });

      dio.FormData formData = dio.FormData.fromMap({
        ...validData,
        "image": await dio.MultipartFile.fromFile(
          imageFile.path,
          filename: imageFile.path.split('/').last,
        ),
      });

      print("FormData Sent: ${formData.fields}");
      print("Image Path: ${imageFile.path}");

      // Send data using Dio
      final response = await dioClient.post(
        apiUrl,
        data: formData,
        options: dio.Options(headers: {"Content-Type": "multipart/form-data"}),
      );

      print("Response Status: ${response.statusCode}");
      print("Response Body: ${response.data}");

      // Handle success
      if (response.statusCode == 201) {
        final responseData = response.data;
        final adminData = responseData['data']['admin'];
        role.value = adminData['userType'];
        roleId.value = adminData['roleId'];

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("user_role", role.value);
        await prefs.setInt("role_id", roleId.value);

        Get.snackbar(
            "Success", "Restaurant and user data submitted successfully.");
      } else {
        errorMessage.value = response.data['message'] ?? "Submission failed.";
        Get.snackbar("Error", errorMessage.value);
      }
    } catch (e) {
      errorMessage.value = "An error occurred: $e";
      print("Error: $e");
      Get.snackbar("Error", errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }
}
