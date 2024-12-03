import 'dart:convert';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ReservationController extends GetxController {
  var onGoingReservations = [].obs;
  var pastReservations = [].obs;
  var isLoading = false.obs;

  final String getAllReservationsURL =
      "${AppConfig.baseURL}${AppConstant.seeAllReservation}";

  final String doneReservation =
      "${AppConfig.baseURL}${AppConstant.doneReservation}";

  final String cancelReservation =
      "${AppConfig.baseURL}${AppConstant.cancelReservation}";

  Future<void> fetchReservations() async {
    isLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse(getAllReservationsURL),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        onGoingReservations.value = data['ongoingReservations'] ?? [];
      } else {
        Get.snackbar("Error", "Failed to fetch reservations");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> doneReservations(String reservationId) async {
    try {
      final response = await http.patch(
        Uri.parse(doneReservation),
      );
      if (response.statusCode == 200) {
        fetchReservations();
        Get.snackbar("Success", "Your reservation have been accepted");
      } else {
        Get.snackbar("Error", "Your reservation have been rejected");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred $e");
    }
  }

  Future<void> cancelReservations(String reservationId) async {
    try {
      final response = await http.patch(
        Uri.parse(cancelReservation),
      );
      if (response.statusCode == 200) {
        fetchReservations();
        Get.snackbar("Success", "Reservation Cancelled");
      } else {
        Get.snackbar("Error", "Failed to cancel reservation");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred $e");
    }
  }
}
