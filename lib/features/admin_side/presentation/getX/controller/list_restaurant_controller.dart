// import 'dart:convert';
// import 'dart:io';

// import 'package:dine_deal/config/app_config.dart';
// import 'package:dine_deal/core/constants/app_constant.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class ListRestaurantController extends GetxController {
//   var restaurantData = {
//     "username": null,
//     "email": null,
//     "password": null,
//     "roleId": null,
//     "userType": null,
//     "restaurantName": null,
//     "restaurantAddress": null,
//     "websiteUrl": null,
//     "socialMediaLinks": [],
//     "phoneNumber": null,
//     "restaurantType": [],
//     "operationHours": null,
//     "minPriceRange": null,
//     "maxPriceRange": null,
//     "restaurantInfo": [],
//     "acceptReservation": null,
//     "image": null,
//     "advanceReservationPeriods": {"days": 0, "hours": 0},
//     "features": [],
//     "additionalNotes": null,
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
//   var roleId = 0.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchRole();
//   }

//   Future<void> fetchRole() async {
//     final prefs = await SharedPreferences.getInstance();
//     role.value = prefs.getString('user_role') ?? "";
//     roleId.value = prefs.getInt('role_id') ?? 0;

//     if (role.value.isEmpty || roleId.value == 0) {
//       print("Error: No role defined in SharedPreferences.");
//     } else {
//       print("Fetched role: ${role.value}, Role ID: ${roleId.value}");
//     }
//   }

//   void toggleAcceptPolicies(bool value) {
//     acceptPolicies.value = value;
//     restaurantData["acceptReservation"] = value ? "Yes" : "No";
//     update();
//   }

//   void updateAdditionalInformation(String info) {
//     restaurantData["additionalNotes"] = info;
//     update();
//   }

//   void toggleFeature(String feature, bool isSelected) {
//     if (isSelected) {
//       if (!selectedFeatures.contains(feature)) selectedFeatures.add(feature);
//     } else {
//       selectedFeatures.remove(feature);
//     }
//     restaurantData["features"] = List<String>.from(selectedFeatures);
//     update();
//   }

//   void toggleSelection(String item, bool isSelected, String key) {
//     var selectedList = key == "restaurantType"
//         ? selectedRestaurantTypes
//         : selectedRestaurantInfo;

//     if (isSelected) {
//       if (!selectedList.contains(item)) selectedList.add(item);
//     } else {
//       selectedList.remove(item);
//     }
//     restaurantData[key] = selectedList.join(", ");
//     update();
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

//   Future<void> submitRestaurantData(File imageFile) async {
//     const String apiUrl = "${AppConfig.baseURL}${AppConstant.signInRestaurant}";

//     isLoading.value = true;
//     errorMessage.value = "";

//     try {
//       // Create a multipart request
//       var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

//       // Add fields from restaurantData
//       restaurantData.value.forEach((key, value) {
//         if (value != null && value.toString().isNotEmpty) {
//           if (value is Map) {
//             // Convert nested maps to JSON strings
//             request.fields[key] = jsonEncode(value);
//           } else if (value is List) {
//             // Convert lists to comma-separated strings
//             request.fields[key] = value.join(",");
//           } else {
//             request.fields[key] = value.toString();
//           }
//         }
//       });

//       // Attach the image file if it exists
//       if (imageFile.existsSync()) {
//         request.files.add(await http.MultipartFile.fromPath(
//           'image',
//           imageFile.path,
//         ));
//       } else {
//         Get.snackbar("Error", "Image file not found");
//         return;
//       }

//       print("Sending request: ${request.fields}");

//       // Send the request
//       var response = await request.send();
//       var responseData = await response.stream.bytesToString();
//       print("Response: ${response.statusCode} - $responseData");

//       // Handle the response
//       if (response.statusCode == 201) {
//         Get.snackbar("Success", "Restaurant added successfully!");
//       } else {
//         var jsonResponse = jsonDecode(responseData);
//         errorMessage.value = jsonResponse['message'] ?? "Submission failed.";
//         Get.snackbar("Error", errorMessage.value);
//       }
//     } catch (e) {
//       errorMessage.value = "An error occurred: $e";
//       print("Error: $e");
//       Get.snackbar("Error", errorMessage.value);
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   // Future<void> submitRestaurantData(File imageFile) async {
//   //   const String apiUrl = "${AppConfig.baseURL}${AppConstant.signInRestaurant}";

//   //   isLoading.value = true;
//   //   errorMessage.value = "";

//   //   try {
//   //     // Create a multipart request
//   //     var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

//   //     // Add fields from restaurantData
//   //     restaurantData.value.forEach((key, value) {
//   //       if (value != null && value.toString().isNotEmpty) {
//   //         if (value is Map) {
//   //           // Convert nested maps to JSON strings
//   //           request.fields[key] = jsonEncode(value);
//   //         } else if (value is List) {
//   //           // Convert lists to comma-separated strings
//   //           request.fields[key] = value.join(",");
//   //         } else {
//   //           request.fields[key] = value.toString();
//   //         }
//   //       }
//   //     });

//   //     // Attach the image file if provided
//   //     if (imageFile.existsSync()) {
//   //       request.files.add(await http.MultipartFile.fromPath(
//   //         'image',
//   //         imageFile.path,
//   //       ));
//   //     } else {
//   //       Get.snackbar(
//   //           "Error", "Image file not found at path: ${imageFile.path}");
//   //       return;
//   //     }

//   //     print("Sending request: ${request.fields}");

//   //     // Send the request
//   //     var response = await request.send();
//   //     var responseData = await response.stream.bytesToString();
//   //     print("Response: ${response.statusCode} - $responseData");

//   //     // Handle the response
//   //     if (response.statusCode == 201) {
//   //       // Success
//   //       Get.snackbar("Success", "Restaurant added successfully!");
//   //     } else {
//   //       // Extract the error message from the response
//   //       var jsonResponse = jsonDecode(responseData);
//   //       errorMessage.value = jsonResponse['message'] ?? "Submission failed.";
//   //       Get.snackbar("Error", errorMessage.value);
//   //     }
//   //   } catch (e) {
//   //     errorMessage.value = "An error occurred: $e";
//   //     print("Error: $e");
//   //     Get.snackbar("Error", errorMessage.value);
//   //   } finally {
//   //     isLoading.value = false;
//   //   }
//   // }

//   // Future<void> submitRestaurantData(File imageFile) async {
//   //   const String apiUrl = "${AppConfig.baseURL}${AppConstant.signInRestaurant}";
//   //   final dio.Dio dioClient = dio.Dio();

//   //   try {
//   //     isLoading.value = true;
//   //     errorMessage.value = "";

//   //     Map<String, dynamic> validData = {};
//   //     restaurantData.value.forEach((key, value) {
//   //       if (value != null && value.toString().isNotEmpty) {
//   //         validData[key] = value;
//   //       }
//   //     });

//   //     dio.FormData formData = dio.FormData.fromMap({
//   //       ...validData,
//   //       "image": await dio.MultipartFile.fromFile(
//   //         imageFile.path,
//   //         filename: imageFile.path.split('/').last,
//   //       ),
//   //     });

//   //     print("FormData Sent: ${formData.fields}");
//   //     print("Image Path: ${imageFile.path}");

//   //     // Send data using Dio
//   //     final response = await dioClient.post(
//   //       apiUrl,
//   //       data: formData,
//   //       options: dio.Options(headers: {"Content-Type": "multipart/form-data"}),
//   //     );

//   //     print("Response Status: ${response.statusCode}");
//   //     print("Response Body: ${response.data}");

//   //     // Handle success
//   //     if (response.statusCode == 201) {
//   //       final responseData = response.data;
//   //       final adminData = responseData['data']['admin'];
//   //       role.value = adminData['userType'];
//   //       roleId.value = adminData['roleId'];

//   //       final prefs = await SharedPreferences.getInstance();
//   //       await prefs.setString("user_role", role.value);
//   //       await prefs.setInt("role_id", roleId.value);

//   //       Get.snackbar(
//   //           "Success", "Restaurant and user data submitted successfully.");
//   //     } else {
//   //       errorMessage.value = response.data['message'] ?? "Submission failed.";
//   //       Get.snackbar("Error", errorMessage.value);
//   //     }
//   //   } catch (e) {
//   //     errorMessage.value = "An error occurred: $e";
//   //     print("Error: $e");
//   //     Get.snackbar("Error", errorMessage.value);
//   //   } finally {
//   //     isLoading.value = false;
//   //   }
//   // }
// }
import 'dart:convert';
import 'dart:io';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ListRestaurantController extends GetxController {
  // Observable map to store restaurant data dynamically
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
    const String apiUrl = "${AppConfig.baseURL}${AppConstant.signInRestaurant}";

    isLoading.value = true;
    errorMessage.value = "";

    try {
      // Create a multipart request
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

      // Add user-related fields (explicitly cast to String)
      request.fields['username'] = restaurantData['username']?.toString() ?? '';
      request.fields['email'] = restaurantData['email']?.toString() ?? '';
      request.fields['password'] = restaurantData['password']?.toString() ?? '';

      // Add restaurantData as a JSON string
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
        Get.snackbar("Success", "Restaurant added successfully!");
      } else {
        var jsonResponse = jsonDecode(responseData);
        errorMessage.value = jsonResponse['message'] ?? "Submission failed.";
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

  // // Submit restaurant data to the backend
  // Future<void> submitRestaurantData(File? imageFile) async {
  //   const String apiUrl = "${AppConfig.baseURL}${AppConstant.signInRestaurant}";

  //   isLoading.value = true;
  //   errorMessage.value = "";

  //   try {
  //     // Create a multipart request
  //     var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

  //     // Add fields from restaurantData
  //     restaurantData.value.forEach((key, value) {
  //       if (value != null) {
  //         if (value is Map) {
  //           // Convert nested maps to JSON strings
  //           request.fields[key] = jsonEncode(value);
  //         } else if (value is List) {
  //           // Convert lists to comma-separated strings
  //           request.fields[key] = value.join(",");
  //         } else {
  //           request.fields[key] = value.toString();
  //         }
  //       }
  //     });

  //     // Attach the image file if provided
  //     if (imageFile != null && imageFile.existsSync()) {
  //       request.files.add(await http.MultipartFile.fromPath(
  //         'image',
  //         imageFile.path,
  //       ));
  //     } else {
  //       Get.snackbar("Error", "Image file not found.");
  //       isLoading.value = false;
  //       return;
  //     }

  //     print("Sending request: ${request.fields}");

  //     // Send the request
  //     var response = await request.send();
  //     var responseData = await response.stream.bytesToString();
  //     print("Response: ${response.statusCode} - $responseData");

  //     // Handle the response
  //     if (response.statusCode == 201) {
  //       Get.snackbar("Success", "Restaurant added successfully!");
  //     } else {
  //       var jsonResponse = jsonDecode(responseData);
  //       errorMessage.value = jsonResponse['message'] ?? "Submission failed.";
  //       Get.snackbar("Error", errorMessage.value);
  //     }
  //   } catch (e) {
  //     errorMessage.value = "An error occurred: $e";
  //     print("Error: $e");
  //     Get.snackbar("Error", errorMessage.value);
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
}
