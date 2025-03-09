import 'dart:convert';
import 'dart:io';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ListRestaurantController extends GetxController {
  final RxString restaurantName = ''.obs;
  final RxString restaurantAddress = ''.obs;
  final RxString operationalHours = ''.obs;
  final RxString minPriceRange = ''.obs;
  final RxString maxPriceRange = ''.obs;
  final RxString additionalNotes = ''.obs;
  final RxInt restaurantMinDays = 1.obs;
  final RxInt restaurantMinHours = 24.obs;
  final RxString websiteUrl = ''.obs;

  final RxList<String> restaurantType = <String>[].obs;
  final RxList<String> restaurantFeatures = <String>[].obs;
  final RxList<String> restaurantInfo = <String>[].obs;
  final RxList<String> socialMediaLinks = <String>[].obs;

  final Rxn<File> selectedImage = Rxn<File>();
  final RxBool hasImage = false.obs;

  final RxString username = ''.obs;
  final RxString email = ''.obs;
  final RxString password = ''.obs;

  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  var acceptPolicies = "No".obs;
  final RxString role = ''.obs;
  final RxInt roleId = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchRole();
  }

  Future<void> fetchRole() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      role.value = prefs.getString('user_role') ?? '';
      roleId.value = prefs.getInt('role_id') ?? 0;
    } catch (e) {
      debugPrint('Error fetching role: $e');
    }
  }

  void updateRestaurantField(String field, dynamic value) {
    print('Updating field: $field with value: $value'); // Debug print

    if (value == null) {
      print('Warning: Null value received for field: $field');
      return;
    }

    switch (field) {
      case 'restaurantName':
        restaurantName.value = value.toString().trim();
        break;
      case 'restaurantAddress':
        restaurantAddress.value = value.toString().trim();
        break;
      case 'operationalHours':
        operationalHours.value = value.toString().trim();
        break;
      case 'minPriceRange':
        minPriceRange.value = value.toString().trim();
        break;
      case 'maxPriceRange':
        maxPriceRange.value = value.toString().trim();
        break;
      case 'additionalNotes':
        additionalNotes.value = value.toString().trim();
        break;
      case 'restaurantMinDays':
        restaurantMinDays.value = int.tryParse(value.toString()) ?? 1;
        break;
      case 'restaurantMinHours':
        restaurantMinHours.value = int.tryParse(value.toString()) ?? 24;
        break;
      case 'username':
        username.value = value.toString().trim();
        break;
      case 'email':
        final trimmedEmail = value.toString().trim();
        print('Setting email to: $trimmedEmail'); // Debug print
        email.value = trimmedEmail;
        break;
      case 'password':
        password.value = value.toString();
        break;
      case 'websiteUrl':
        websiteUrl.value = value.toString().trim();
        break;
    }
    update();
  }

  // List Management
  void addSocialMediaLinks(List<String> links) {
    if (links.isNotEmpty) {
      socialMediaLinks.clear();
      socialMediaLinks.addAll(links.map((e) => e.trim()));
      update();
    }
  }

  void toggleFeature(String feature, bool isSelected) {
    if (isSelected && !restaurantFeatures.contains(feature)) {
      restaurantFeatures.add(feature.trim());
    } else {
      restaurantFeatures.remove(feature);
    }
    update();
  }

  void toggleSelection(String item, bool isSelected, String key) {
    final trimmedItem = item.trim();
    switch (key) {
      case 'restaurantType':
        if (isSelected && !restaurantType.contains(trimmedItem)) {
          restaurantType.add(trimmedItem);
        } else {
          restaurantType.remove(trimmedItem);
        }
        break;
      case 'restaurantInfo':
        if (isSelected && !restaurantInfo.contains(trimmedItem)) {
          restaurantInfo.add(trimmedItem);
        } else {
          restaurantInfo.remove(trimmedItem);
        }
        break;
    }
    update();
  }

  // Image Handling
  void updateImage(File? image) {
    selectedImage.value = image;
    hasImage.value = image != null;
    update();
  }

  String getImageMimeType(String fileName) {
    final extension = fileName.split('.').last.toLowerCase();
    return extension == 'png' ? 'png' : 'jpeg';
  }

  // Validation
  bool validateRestaurantData() {
    try {
      // Email validation first
      final trimmedEmail = email.value.trim();
      print('Validating email: $trimmedEmail'); // Debug print

      if (trimmedEmail.isEmpty) {
        _showError('Please enter email');
        return false;
      }

      if (!GetUtils.isEmail(trimmedEmail)) {
        _showError('Please enter a valid email address');
        return false;
      }

      // Print current values for debugging
      print('Validating data:');
      print('Restaurant Name: "${restaurantName.value}"');
      print('Email: "${email.value}"');
      print('Username: "${username.value}"');
      print('Restaurant Types: ${restaurantType.toList()}');
      print('Restaurant Features: ${restaurantFeatures.toList()}');

      if (username.value.trim().isEmpty) {
        _showError('Please enter username');
        return false;
      }
      if (password.value.isEmpty) {
        _showError('Please enter password');
        return false;
      }
      if (restaurantName.value.trim().isEmpty) {
        _showError('Please enter restaurant name');
        return false;
      }
      if (restaurantAddress.value.trim().isEmpty) {
        _showError('Please enter restaurant address');
        return false;
      }
      if (restaurantType.isEmpty) {
        _showError('Please select at least one restaurant type');
        return false;
      }
      if (operationalHours.value.trim().isEmpty) {
        _showError('Please enter operational hours');
        return false;
      }
      if (minPriceRange.value.trim().isEmpty) {
        _showError('Please enter minimum price range');
        return false;
      }
      if (maxPriceRange.value.trim().isEmpty) {
        _showError('Please enter maximum price range');
        return false;
      }
      if (restaurantFeatures.isEmpty) {
        _showError('Please select at least one restaurant feature');
        return false;
      }
      if (restaurantInfo.isEmpty) {
        _showError('Please select at least one restaurant info');
        return false;
      }
      if (additionalNotes.value.trim().isEmpty) {
        _showError('Please enter additional notes');
        return false;
      }

      // Validate numeric fields
      int.parse(minPriceRange.value.trim());
      int.parse(maxPriceRange.value.trim());
      int.parse(restaurantMinDays.value.toString());
      int.parse(restaurantMinHours.value.toString());

      return true;
    } catch (e) {
      _showError(
          'Please enter valid numeric values for price ranges and time periods');
      return false;
    }
  }

  bool _showError(String message) {
    errorMessage.value = message;
    Get.snackbar(
      'Validation Error',
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
    return false;
  }

  Future<void> submitRestaurantData() async {
    if (!validateRestaurantData()) return;
    if (selectedImage.value == null) {
      _showError('Please select an image file');
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';

    try {
      final Map<String, String> userData = {
        'email': email.value.trim(),
        'username': username.value.trim(),
        'password': password.value,
      };

      final Map<String, dynamic> restaurantData = {
        'restaurantName': restaurantName.value.trim(),
        'restaurantAddress': restaurantAddress.value.trim(),
        'websiteUrl': websiteUrl.value.trim(),
        'socialMediaLinks': socialMediaLinks,
        'restaurantType': restaurantType,
        'operationalHours': operationalHours.value.trim(),
        'minPriceRange': int.parse(minPriceRange.value.trim()),
        'maxPriceRange': int.parse(maxPriceRange.value.trim()),
        'acceptReservation': acceptPolicies.value,
        'restaurantMinDays': int.parse(restaurantMinDays.value.toString()),
        'restaurantMinHours': int.parse(restaurantMinHours.value.toString()),
        'restaurantFeatures': restaurantFeatures,
        'restaurantInfo': restaurantInfo,
        'additionalNotes': additionalNotes.value.trim(),
        'status': 'Pending'
      };

      final request = http.MultipartRequest(
        'POST',
        Uri.parse('${AppConfig.baseURL}${AppConstant.signInRestaurant}'),
      );

      // Add user data as form fields
      userData.forEach((key, value) {
        request.fields[key] = value;
      });

      // Convert restaurant data to JSON string
      request.fields['restaurantData'] = jsonEncode(restaurantData);

      print('Sending data: ${jsonEncode(restaurantData)}');

      // Add image
      if (selectedImage.value != null) {
        final file = selectedImage.value!;
        request.files.add(
          await http.MultipartFile.fromPath('image', file.path,
              filename: file.path.split('/').last),
        );
      }

      final response = await request.send();
      final responseData = await response.stream.bytesToString();
      print('Response: $responseData');
      final jsonResponse = jsonDecode(responseData);

      if (response.statusCode == 201 && jsonResponse['success'] == true) {
        Get.snackbar(
          'Success',
          'Restaurant and admin account created successfully!',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
        clearFormData();
      } else {
        _showError(jsonResponse['message'] ?? 'Submission failed');
      }
    } catch (e) {
      _showError('An error occurred: $e');
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Form Reset
  void clearFormData() {
    restaurantName.value = '';
    restaurantAddress.value = '';
    operationalHours.value = '';
    minPriceRange.value = '';
    maxPriceRange.value = '';
    additionalNotes.value = '';
    restaurantMinDays.value = 1;
    restaurantMinHours.value = 24;
    selectedImage.value = null;
    hasImage.value = false;
    restaurantType.clear();
    restaurantFeatures.clear();
    restaurantInfo.clear();
    socialMediaLinks.clear();
    username.value = '';
    email.value = '';
    password.value = '';
    websiteUrl.value = '';

    update();
  }

  // UI Helpers
  void toggleAcceptPolicies(String value) {
    acceptPolicies.value = value;
    print("acceptPolicies changed to: $value");
  }

  void verifyData() {
    print('Debug values:');
    print('restaurantName: ${restaurantName.value}');
    print('restaurantAddress: ${restaurantAddress.value}');
    print('restaurantType: ${restaurantType}');
    print('operationalHours: ${operationalHours.value}');
    print('minPriceRange: ${minPriceRange.value}');
    print('maxPriceRange: ${maxPriceRange.value}');
    print('restaurantMinDays: ${restaurantMinDays.value}');
    print('restaurantMinHours: ${restaurantMinHours.value}');
    print('restaurantFeatures: ${restaurantFeatures}');
    print('restaurantInfo: ${restaurantInfo}');
    print('additionalNotes: ${additionalNotes.value}');
  }
}
