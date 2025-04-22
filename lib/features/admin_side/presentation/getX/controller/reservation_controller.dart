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
  var users = <Map<String, dynamic>>[].obs;
  var savedReservation = {}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    const String getAllUsersUrl =
        "${AppConfig.baseURL}${AppConstant.getAllUser}";
    try {
      isLoading(true);
      errorMessage('');

      final response = await http.get(Uri.parse(getAllUsersUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['success'] && data['data'] is List) {
          users.value = List<Map<String, dynamic>>.from(data['data']);
          print("Users fetched: ${users.length}");
          await getAllReservations();
        } else {
          errorMessage.value = data['message'] ?? 'Failed to fetch users.';
        }
      } else {
        errorMessage.value =
            'Error ${response.statusCode}: Unable to fetch users.';
      }
    } catch (e) {
      errorMessage.value = 'An error occurred while fetching users: $e';
    } finally {
      isLoading(false);
    }
  }

  Future<void> getAllReservations() async {
    const String getAllReservationUrl =
        "${AppConfig.baseURL}${AppConstant.getAllReservations}";
    try {
      isLoading(true);
      errorMessage('');

      final response = await http.get(Uri.parse(getAllReservationUrl));

      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print("Fetched data: $data");

        if (data['success'] && data['data'] is List) {
          reservations.value = (data['data'] as List<dynamic>)
              .map((reservation) {
                final userId = reservation['userId'];
                final user = _getUserById(userId);

                if (user['userType'] == 'User') {
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

          // Log the length of reservations and the actual data
          print("Reservations fetched: ${reservations.length}");
          print("Reservations data: ${reservations}");
        } else {
          errorMessage.value =
              data['message'] ?? 'Failed to fetch reservations.';
        }
      } else {
        errorMessage.value =
            'Error ${response.statusCode}: Unable to fetch reservations.';
      }
    } catch (e) {
      errorMessage.value = 'An error occurred while fetching reservations: $e';
    } finally {
      isLoading(false);
    }
  }

  Future<void> saveReservation({
    required String restaurant,
    required int persons,
    required String date,
    required String time,
  }) async {
    final reservationData = {
      "reservationTime": time,
      "reservationDate": date,
      "numberOfPersons": persons,
      "reservationPlace": "Inside",
      "reservationStatus": "Pending",
      "restaurantId": 1,
    };

    try {
      isLoading(true);
      errorMessage('');

      const String saveReservationUrl =
          "${AppConfig.baseURL}${AppConstant.reservation}";

      final response = await http.post(
        Uri.parse(saveReservationUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(reservationData),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['success']) {
          savedReservation.value = reservationData;
          print("Reservation saved successfully: ${savedReservation.value}");
        } else {
          errorMessage.value = data['message'] ?? 'Failed to save reservation.';
        }
      } else {
        errorMessage.value =
            'Error ${response.statusCode}: Unable to save reservation.';
      }
    } catch (e) {
      errorMessage.value = 'An error occurred while saving the reservation: $e';
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
      return DateFormat.jm().format(parsedTime);
    } catch (e) {
      return "Invalid Time";
    }
  }
}
