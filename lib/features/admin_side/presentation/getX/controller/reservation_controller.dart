import 'dart:convert';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ReservationController extends GetxController {
  var reservations = [].obs; // Store all reservations
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllReservations(); // Fetch reservations when the controller is initialized
  }

  Future<void> fetchAllReservations() async {
    const String getAllReservationUrl =
        "${AppConfig.baseURL}${AppConstant.getAllReservations}";
    try {
      isLoading(true);
      errorMessage.value = '';

      final response = await http.get(Uri.parse(getAllReservationUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['success'] && data['data'] is List) {
          reservations.value = data['data'];
          print("Fetched Reservations: ${reservations.length}");
          // Print each reservation to the console
          for (var reservation in reservations) {
            print(
                "Reservation -> Username: ${reservation['username']}, Table: ${reservation['tableNumber']}, "
                "Date: ${reservation['reservationDate']}, Time: ${reservation['reservationTime']}, "
                "Persons: ${reservation['numberOfPersons']}");
          }
        } else {
          errorMessage.value =
              data['message'] ?? "Failed to fetch reservations.";
          print("Error: ${errorMessage.value}");
        }
      } else {
        errorMessage.value =
            "Error ${response.statusCode}: Unable to fetch reservations.";
        print("Error: ${errorMessage.value}");
      }
    } catch (e) {
      errorMessage.value = "An error occurred: $e";
      print("Error fetching reservations: $e");
    } finally {
      isLoading(false);
    }
  }
}
