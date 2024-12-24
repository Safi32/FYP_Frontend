import 'dart:convert';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:dine_deal/models/get_restaurant_data_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RestaurantController extends GetxController {
  var restaurants = <Restaurant>[].obs; // All restaurants
  var latestRestaurant = Rxn<Restaurant>();
  var selectedRestaurant = Rxn<Restaurant>(); // Currently selected restaurant
  var isLoading = false.obs; // Loading state
  var errorMessage = ''.obs; // Error message state
  RxString selectedDeal = ''.obs;
  RxString additionalNotes = ''.obs; // Reactive variable for additional notes

  @override
  void onInit() {
    super.onInit();
    fetchRestaurants();
  }

  void updateSelectedDeal(String deal) {
    selectedDeal.value = deal;
  }

  // Update additional notes
  void updateAdditionalNotes(String notes) {
    additionalNotes.value = notes;
  }

  // Fetch restaurants from API
  Future<void> fetchRestaurants() async {
    const String url = "${AppConfig.baseURL}${AppConstant.getRestaurant}";

    try {
      isLoading(true);
      errorMessage(''); // Clear error message

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['success']) {
          var restaurantList = data['data'] as List;
          restaurants.value =
              restaurantList.map((e) => Restaurant.fromJson(e)).toList();

          // Set the latest restaurant based on `createdAt`
          if (restaurants.isNotEmpty) {
            latestRestaurant.value =
                restaurants.first; // Assuming API sorts descending
          }
        } else {
          errorMessage.value = data['message'] ?? 'Failed to fetch restaurants';
        }
      } else {
        errorMessage.value =
            'Error ${response.statusCode}: Unable to fetch data';
      }
    } catch (e) {
      errorMessage.value = 'An error occurred: $e';
    } finally {
      isLoading(false);
    }
  }

  void setSelectedRestaurant(Restaurant restaurant) {
    selectedRestaurant.value = restaurant; // Set globally
  }
}
