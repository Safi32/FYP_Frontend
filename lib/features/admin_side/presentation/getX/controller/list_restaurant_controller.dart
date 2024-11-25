import 'dart:convert';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ListRestaurantController extends GetxController {
  var restaurantData = {
    "name": null,
    "phoneNumber": null,
    "email": null,
    "address": null,
    "websiteURL": null,
    "socialMediaLinks": [],
    "restaurantType": [],
    "operationHours": null,
    "minPriceRange": null,
    "maxPriceRange": null,
    "restaurantInfo": [],
    "pictures": [],
    "acceptPolicies": null,
    "advanceReservationPeriods": {
      "days": 0,
      "hours": 0,
    },
    "restaurantFeatures": [],
    "additionalInformation": null,
  }.obs;

  var selectedFeatures = <String>[].obs;
  var selectedRestaurantTypes = <String>[].obs;
  var selectedRestaurantInfo = <String>[].obs;
  var isLoading = false.obs;
  var errorMessage = "".obs;
  var acceptPolicies = false.obs;
  var reservationOption = 'Yes'.obs;
  var selectedImagePath = ''.obs;

  void updateAdditionalInformation(String info) {
    restaurantData["additionalInformation"] = info;
    update();
  }

  void toggleFeature(String feature, bool isSelected) {
    if (isSelected) {
      if (!selectedFeatures.contains(feature)) {
        selectedFeatures.add(feature);
      }
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
      if (!selectedList.contains(type)) {
        selectedList.add(type);
      }
    } else {
      selectedList.remove(type);
    }
    restaurantData[key] = List<String>.from(selectedList);
    update();
  }

  // Future<void> pickImage(String type) async {
  //   // Type can be "restaurant_information" or "media_gallery"
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     // Add image path and type as metadata
  //     var pictureData = {
  //       "type": type,
  //       "url": image.path,
  //     };
  //     (restaurantData["pictures"] as List).add(pictureData);
  //     update();
  //   } else {
  //     Get.snackbar("Error", "No image selected");
  //   }
  // }

  Future<void> pickImage(String type) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      String fileExtension = image.path.split('.').last.toLowerCase();

      if (fileExtension == 'jpeg' ||
          fileExtension == 'jpg' ||
          fileExtension == 'png') {
        var pictureData = {
          "type": type,
          "url": image.path,
        };
        (restaurantData["pictures"] as List).add(pictureData);
        selectedImagePath.value = image.path;

        update();
      } else {
        Get.snackbar("Error", "Only .jpeg, .jpg, and .png files are allowed");
      }
    } else {
      Get.snackbar("Error", "No image selected");
    }
  }

  void updateField(String key, dynamic value) {
    restaurantData[key] = value;
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

  Future<void> submitRestaurantData() async {
    if ((restaurantData["pictures"] as List).isEmpty) {
      Get.snackbar("Error", "Please upload at least one picture");
      return;
    }

    isLoading.value = true;
    errorMessage.value = "";

    try {
      var request = http.MultipartRequest('POST',
          Uri.parse("${AppConfig.baseURL}${AppConstant.listRestaurantUri}"));
      print(
          "API Endpoint: ${AppConfig.baseURL}${AppConstant.listRestaurantUri}");

      restaurantData.forEach((key, value) {
        if (value != null) {
          if (value is List || value is Map) {
            request.fields[key] = jsonEncode(value);
          } else {
            request.fields[key] = value.toString();
          }
        }
      });
      for (var picture in (restaurantData["pictures"] as List)) {
        var path = picture["url"];
        request.files.add(await http.MultipartFile.fromPath(
          'pictures',
          path,
        ));
      }

      var response = await request.send();

      if (response.statusCode == 200) {
        Get.snackbar("Success", "Restaurant data submitted successfully");
      } else {
        var responseData = await response.stream.bytesToString();
        var errorResponse = jsonDecode(responseData);
        errorMessage.value = errorResponse['message'] ?? "Submission failed";
        Get.snackbar("Error", errorMessage.value);
        print("Error $errorMessage.value");
      }
    } catch (e) {
      errorMessage.value = "An error occurred: $e";
      Get.snackbar("Error", errorMessage.value);
      print("Error $errorMessage.value");
    } finally {
      isLoading.value = false;
    }
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
  }

  void toggleAcceptPolicies(bool value) {
    acceptPolicies.value = value;
    restaurantData["acceptPolicies"] = value;
  }

  void updateReservationOption(String value) {
    reservationOption.value = value;
  }
}
