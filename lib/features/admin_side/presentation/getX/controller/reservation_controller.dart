import 'dart:convert';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ReservationController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var reservations = <Map<String, dynamic>>[].obs;
  var users = <Map<String, dynamic>>[].obs; // Store all users here

  @override
  void onInit() {
    super.onInit();
    fetchUsers(); // Fetch all users first
  }

  Future<void> fetchUsers() async {
    try {
      isLoading(true);
      const String getAllUsersUrl =
          "${AppConfig.baseURL}${AppConstant.getAllUser}";

      final response = await http.get(Uri.parse(getAllUsersUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        users.value = List<Map<String, dynamic>>.from(data['data']);
        print("Users Fetched: ${users.length}");

        getAllReservations();
      } else {
        errorMessage.value = "Unable to fetch users.";
      }
    } catch (e) {
      errorMessage.value = "An error occurred while fetching users: $e";
    } finally {
      isLoading(false);
    }
  }

  Future<void> getAllReservations() async {
    const String getAllReservationUrl =
        "${AppConfig.baseURL}${AppConstant.getAllReservations}";

    try {
      isLoading(true);

      final response = await http.get(Uri.parse(getAllReservationUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print("Raw Reservation Data: $data");

        if (data['success'] && data['data'] is List) {
          final reservationsList = data['data'] as List;
          reservations.value = (data['data'] as List<dynamic>)
              .map((reservation) {
                final userId = reservation['userId'];
                final user = _getUserById(userId);

                if (user['userType'] == 'User') {
                  print(
                      "Number of Persons from API: ${reservation['numberOfPersons']}"); // Debug

                  return {
                    "username": user['username'] ?? "N/A",
                    "tableNumber":
                        reservation['reservationTableId']?.toString() ?? "N/A",
                    "numberOfPersons":
                        reservation['numberOfPersons']?.toString() ?? "N/A",
                    "formattedDate":
                        _formatDate(reservation['reservationDate']),
                    "formattedTime":
                        _formatTime(reservation['reservationTime']),
                  };
                }
                return null;
              })
              .where((reservation) => reservation != null)
              .cast<Map<String, dynamic>>()
              .toList();

          // reservations.value = (data['data'] as List<dynamic>)
          //     .map((reservation) {
          //       final userId = reservation['userId'];
          //       final user = _getUserById(userId);

          //       print(
          //           "Reservation Data: ${reservation}"); // Print the full reservation object

          //       if (user['userType'] == 'User') {
          //         print(
          //             "Number of Persons: ${reservation['numberOfPersons']}"); // Debug print
          //         return {
          //           "username": user['username'] ?? "N/A",
          //           "tableNumber":
          //               reservation['reservationTableId']?.toString() ?? "N/A",
          //           "numberOfPersons":
          //               reservation['numberOfPersons']?.toString() ?? "N/A",
          //           "formattedDate":
          //               _formatDate(reservation['reservationDate']),
          //           "formattedTime":
          //               _formatTime(reservation['reservationTime']),
          //         };
          //       }
          //       return null;
          //     })
          //     .where((reservation) => reservation != null)
          //     .cast<Map<String, dynamic>>()
          //     .toList();

          print("Final Reservations: $reservations");

          // reservations.value = (data['data'] as List<dynamic>)
          //     .map((reservation) {
          //       final userId = reservation['userId'];
          //       final user = _getUserById(userId);

          //       if (user['userType'] == 'User') {
          //         return {
          //           "username": user['username'] ?? "N/A",
          //           "tableNumber":
          //               reservation['reservationTableId']?.toString() ?? "N/A",
          //           "numberOfPersons":
          //               reservation['numberOfPersons']?.toString() ?? "N/A",
          //           "formattedDate":
          //               _formatDate(reservation['reservationDate']),
          //           "formattedTime":
          //               _formatTime(reservation['reservationTime']),
          //         };
          //       }
          //       return null;
          //     })
          //     .where((reservation) => reservation != null)
          //     .cast<Map<String, dynamic>>()
          //     .toList();

          print("Filtered Reservations for Users: ${reservations.length}");
        } else {
          errorMessage.value =
              data['message'] ?? "Failed to fetch reservations.";
        }
      } else {
        errorMessage.value =
            "Error ${response.statusCode}: Unable to fetch reservations.";
      }
    } catch (e) {
      errorMessage.value = "An error occurred: $e";
      print("Error: $e");
    } finally {
      isLoading(false);
    }
  }

  Map<String, dynamic> _getUserById(int userId) {
    return users.firstWhere(
      (user) => user['id'] == userId,
      orElse: () => {"username": "Unknown", "userType": "N/A"},
    );
  }

  String _formatDate(String date) {
    try {
      final parsedDate = DateTime.parse(date);
      return DateFormat('dd MMM').format(parsedDate);
    } catch (e) {
      return "Invalid Date";
    }
  }

  String _formatTime(String time) {
    try {
      final parsedTime = DateFormat("HH:mm:ss").parse(time);
      return DateFormat.jm().format(parsedTime); // Outputs in 12-hour format
    } catch (e) {
      return "Invalid Time";
    }
  }
}
