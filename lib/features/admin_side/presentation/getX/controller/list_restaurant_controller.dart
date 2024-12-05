// import 'dart:convert';

// import 'package:dine_deal/config/app_config.dart';
// import 'package:dine_deal/core/constants/app_constant.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ListRestaurantController extends GetxController {
//   var restaurantData = {
//     "name": null,
//     "phoneNumber": null,
//     "email": null,
//     "address": null,
//     "websiteURL": null,
//     "socialMediaLinks": [],
//     "restaurantType": [],
//     "operationHours": null,
//     "minimumPriceRange": null,
//     "maximumPriceRange": null,
//     "restaurantInfo": [],
//     "pictures": [],
//     "acceptPolicies": null,
//     "advanceReservationPeriods": {
//       "days": 0,
//       "hours": 0,
//     },
//     "restaurantFeatures": [],
//     "additionalInformation": null,
//   }.obs;

//   var selectedFeatures = <String>[].obs;
//   var selectedRestaurantTypes = <String>[].obs;
//   var selectedRestaurantInfo = <String>[].obs;
//   var isLoading = false.obs;
//   var errorMessage = "".obs;
//   var acceptPolicies = false.obs;
//   var reservationOption = 'Yes'.obs;
//   var selectedImagePath = ''.obs;
//   var role = "".obs;

//   @override
//   void onInit() async {
//     super.onInit();
//     await loadRoleFromPreferences();
//   }

//   Future<void> loadRoleFromPreferences() async {
//     final prefs = await SharedPreferences.getInstance();
//     role.value = prefs.getString("role") ?? "";
//     if (role.value != "restaurant") {
//       Get.snackbar(
//           "Error", "Only users with a restaurant role can access this");
//     }
//   }

//   void toggleAcceptPolicies(bool value) {
//     acceptPolicies.value = value;
//     restaurantData["acceptPolicies"] = value ? "Yes" : "No";
//     update();
//   }

//   void updateAdditionalInformation(String info) {
//     restaurantData["additionalInformation"] = info;
//     update();
//   }

//   void toggleFeature(String feature, bool isSelected) {
//     if (isSelected) {
//       if (!selectedFeatures.contains(feature)) {
//         selectedFeatures.add(feature);
//       }
//     } else {
//       selectedFeatures.remove(feature);
//     }
//     restaurantData["restaurantFeatures"] = selectedFeatures;
//     print("Chalo na jee ${restaurantData["restaurantFeatures"]}");
//     update();
//   }

//   void toggleSelection(String type, bool isSelected, String key) {
//     var selectedList = key == "restaurantType"
//         ? selectedRestaurantTypes
//         : selectedRestaurantInfo;

//     if (isSelected) {
//       if (!selectedList.contains(type)) {
//         selectedList.add(type);
//       }
//     } else {
//       selectedList.remove(type);
//     }
//     restaurantData[key] = List<String>.from(selectedList);
//     update();
//   }

//   Future<void> pickImage(String type) async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       String fileExtension = image.path.split('.').last.toLowerCase();

//       if (fileExtension == 'jpeg' ||
//           fileExtension == 'jpg' ||
//           fileExtension == 'png') {
//         var pictureData = {
//           "type": type,
//           "url": image.path,
//         };
//         (restaurantData["pictures"] as List).add(pictureData);
//         selectedImagePath.value = image.path;

//         update();
//       } else {
//         Get.snackbar("Error", "Only .jpeg, .jpg, and .png files are allowed");
//       }
//     } else {
//       Get.snackbar("Error", "No image selected");
//     }
//   }

//   // void updateField(String key, dynamic value) {
//   //   restaurantData[key] = value;
//   //   update();
//   // }

//     void updateField(String key, dynamic value) {
//     if (restaurantData.containsKey(key)) {
//       restaurantData[key] = value;
//     } else if (key.contains(".")) {
//       // Handle nested fields
//       final keys = key.split(".");
//       dynamic current = restaurantData;
//       for (var i = 0; i < keys.length - 1; i++) {
//         current = current[keys[i]];
//       }
//       current[keys.last] = value;
//     } else {
//       errorMessage.value = "Invalid field: $key";
//     }
//     update();
//   }

//   void addSocialMediaLinks(List<String> links) {
//     if (links.isNotEmpty) {
//       (restaurantData["socialMediaLinks"] as List).addAll(links);
//       update();
//     } else {
//       Get.snackbar("Error", "Social media links cannot be empty");
//     }
//   }

//   Future<void> submitRestaurantData() async {
//     if ((restaurantData["pictures"] as List).isEmpty) {
//       Get.snackbar("Error", "Please upload at least one picture");
//       return;
//     }

//     isLoading.value = true;
//     errorMessage.value = "";
//     const String restaurantURL = "${AppConfig.baseURL}${AppConstant.signUpUri}";
//     print("API URL: $restaurantURL");

//     try {
//       var request = http.MultipartRequest(
//         'POST',
//         Uri.parse(restaurantURL),
//       );

//       restaurantData.forEach((key, value) {
//         if (value != null) {
//           if (value is List || value is Map) {
//             request.fields[key] = jsonEncode(value);
//           } else {
//             request.fields[key] = value.toString();
//           }
//         }
//       });
//       for (var picture in (restaurantData["pictures"] as List)) {
//         var path = picture["url"];
//         request.files.add(await http.MultipartFile.fromPath(
//           'pictures',
//           path,
//         ));
//       }

//       try {
//         var response = await request.send();

//         if (response.statusCode == 200) {
//           Get.snackbar("Success", "Restaurant data submitted successfully");
//         } else {
//           var responseData = await response.stream.bytesToString();
//           print("Backend Error Response: $responseData"); // Log backend error
//           var errorResponse = jsonDecode(responseData);
//           errorMessage.value = errorResponse['message'] ?? "Submission failed";
//           Get.snackbar("Error", errorMessage.value);
//         }
//       } catch (e) {
//         errorMessage.value = "An error occurred: $e";
//         Get.snackbar("Error", errorMessage.value);
//         print("Error: $errorMessage.value");
//       }
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   void updateRestaurantField(String key, dynamic value) {
//     if (restaurantData.containsKey(key)) {
//       restaurantData[key] = value;
//     } else if (key.contains(".")) {
//       final keys = key.split(".");
//       dynamic current = restaurantData;
//       for (var i = 0; i < keys.length - 1; i++) {
//         current = current[keys[i]];
//       }
//       current[keys.last] = value;
//     } else {
//       errorMessage.value = "Invalid field: $key";
//     }
//   }

//   void updateReservationOption(String value) {
//     reservationOption.value = value;
//   }
// }
import 'dart:convert';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    "minimumPriceRange": null,
    "maximumPriceRange": null,
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
  var role = "".obs;

  @override
  void onInit() async {
    super.onInit();
    await loadRoleFromPreferences();
  }

  /// Load role from SharedPreferences and validate access
  Future<void> loadRoleFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    role.value = prefs.getString("role") ?? "";
    if (role.value != "restaurant") {
      Get.snackbar(
          "Error", "Only users with a restaurant role can access this");
    }
  }

  /// Toggle accept policies
  void toggleAcceptPolicies(bool value) {
    acceptPolicies.value = value;
    restaurantData["acceptPolicies"] = value ? "Yes" : "No";
    update();
  }

  /// Update additional information
  void updateAdditionalInformation(String info) {
    restaurantData["additionalInformation"] = info;
    update();
  }

  /// Toggle features (add/remove)
  void toggleFeature(String feature, bool isSelected) {
    if (isSelected) {
      if (!selectedFeatures.contains(feature)) {
        selectedFeatures.add(feature);
      }
    } else {
      selectedFeatures.remove(feature);
    }
    restaurantData["restaurantFeatures"] = List<String>.from(selectedFeatures);
    update();
  }

  /// Toggle selection for restaurant type or info
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

  /// Pick and validate an image
  Future<void> pickImage(String type) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      String fileExtension = image.path.split('.').last.toLowerCase();

      if (['jpeg', 'jpg', 'png'].contains(fileExtension)) {
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

  /// Update a specific field in the restaurant data
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

  /// Add social media links
  void addSocialMediaLinks(List<String> links) {
    if (links.isNotEmpty) {
      (restaurantData["socialMediaLinks"] as List).addAll(links);
      update();
    } else {
      Get.snackbar("Error", "Social media links cannot be empty");
    }
  }

  /// Submit restaurant data to the backend
  Future<void> submitRestaurantData() async {
    if ((restaurantData["pictures"] as List).isEmpty) {
      Get.snackbar("Error", "Please upload at least one picture");
      return;
    }

    isLoading.value = true;
    errorMessage.value = "";
    const String restaurantURL = "${AppConfig.baseURL}${AppConstant.signUpUri}";

    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(restaurantURL),
      );

      // Add restaurant data to the request
      restaurantData.forEach((key, value) {
        if (value != null) {
          if (value is List || value is Map) {
            request.fields[key] = jsonEncode(value);
          } else {
            request.fields[key] = value.toString();
          }
        }
      });

      // Add images to the request
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
      }
    } catch (e) {
      errorMessage.value = "An error occurred: $e";
      Get.snackbar("Error", errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }

  /// Update reservation option
  void updateReservationOption(String value) {
    reservationOption.value = value;
  }
}
