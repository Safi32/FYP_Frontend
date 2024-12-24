// // import 'dart:convert';

// // import 'package:dine_deal/config/app_config.dart';
// // import 'package:dine_deal/core/constants/app_constant.dart';
// // import 'package:get/get.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:intl/intl.dart';

// // class ReservationController extends GetxController {
// //   var isLoading = false.obs;
// //   var errorMessage = ''.obs;
// //   var reservations = <Map<String, dynamic>>[].obs;
// //   var users = <Map<String, dynamic>>[].obs; // Store all users here

// //   @override
// //   void onInit() {
// //     super.onInit();
// //     fetchUsers(); // Fetch all users first
// //   }

// //   Future<void> fetchUsers() async {
// //     try {
// //       isLoading(true);
// //       const String getAllUsersUrl =
// //           "${AppConfig.baseURL}${AppConstant.getAllUser}";

// //       final response = await http.get(Uri.parse(getAllUsersUrl));

// //       if (response.statusCode == 200) {
// //         final data = json.decode(response.body);
// //         users.value = List<Map<String, dynamic>>.from(data['data']);
// //         print("Users Fetched: ${users.length}");

// //         getAllReservations();
// //       } else {
// //         errorMessage.value = "Unable to fetch users.";
// //       }
// //     } catch (e) {
// //       errorMessage.value = "An error occurred while fetching users: $e";
// //     } finally {
// //       isLoading(false);
// //     }
// //   }

// //   Future<void> getAllReservations() async {
// //     const String getAllReservationUrl =
// //         "${AppConfig.baseURL}${AppConstant.getAllReservations}";

// //     try {
// //       isLoading(true);

// //       final response = await http.get(Uri.parse(getAllReservationUrl));

// //       if (response.statusCode == 200) {
// //         final data = json.decode(response.body);
// //         print("Raw Reservation Data: $data");

// //         if (data['success'] && data['data'] is List) {
// //           final reservationsList = data['data'] as List;
// //           reservations.value = (data['data'] as List<dynamic>)
// //               .map((reservation) {
// //                 final userId = reservation['userId'];
// //                 final user = _getUserById(userId);

// //                 if (user['userType'] == 'User') {
// //                   print(
// //                       "Number of Persons from API: ${reservation['numberOfPersons']}"); // Debug

// //                   return {
// //                     "username": user['username'] ?? "N/A",
// //                     "tableNumber":
// //                         reservation['reservationTableId']?.toString() ?? "N/A",
// //                     "numberOfPersons":
// //                         reservation['numberOfPersons']?.toString() ?? "N/A",
// //                     "formattedDate":
// //                         _formatDate(reservation['reservationDate']),
// //                     "formattedTime":
// //                         _formatTime(reservation['reservationTime']),
// //                   };
// //                 }
// //                 return null;
// //               })
// //               .where((reservation) => reservation != null)
// //               .cast<Map<String, dynamic>>()
// //               .toList();

// //           // reservations.value = (data['data'] as List<dynamic>)
// //           //     .map((reservation) {
// //           //       final userId = reservation['userId'];
// //           //       final user = _getUserById(userId);

// //           //       print(
// //           //           "Reservation Data: ${reservation}"); // Print the full reservation object

// //           //       if (user['userType'] == 'User') {
// //           //         print(
// //           //             "Number of Persons: ${reservation['numberOfPersons']}"); // Debug print
// //           //         return {
// //           //           "username": user['username'] ?? "N/A",
// //           //           "tableNumber":
// //           //               reservation['reservationTableId']?.toString() ?? "N/A",
// //           //           "numberOfPersons":
// //           //               reservation['numberOfPersons']?.toString() ?? "N/A",
// //           //           "formattedDate":
// //           //               _formatDate(reservation['reservationDate']),
// //           //           "formattedTime":
// //           //               _formatTime(reservation['reservationTime']),
// //           //         };
// //           //       }
// //           //       return null;
// //           //     })
// //           //     .where((reservation) => reservation != null)
// //           //     .cast<Map<String, dynamic>>()
// //           //     .toList();

// //           print("Final Reservations: $reservations");

// //           // reservations.value = (data['data'] as List<dynamic>)
// //           //     .map((reservation) {
// //           //       final userId = reservation['userId'];
// //           //       final user = _getUserById(userId);

// //           //       if (user['userType'] == 'User') {
// //           //         return {
// //           //           "username": user['username'] ?? "N/A",
// //           //           "tableNumber":
// //           //               reservation['reservationTableId']?.toString() ?? "N/A",
// //           //           "numberOfPersons":
// //           //               reservation['numberOfPersons']?.toString() ?? "N/A",
// //           //           "formattedDate":
// //           //               _formatDate(reservation['reservationDate']),
// //           //           "formattedTime":
// //           //               _formatTime(reservation['reservationTime']),
// //           //         };
// //           //       }
// //           //       return null;
// //           //     })
// //           //     .where((reservation) => reservation != null)
// //           //     .cast<Map<String, dynamic>>()
// //           //     .toList();

// //           print("Filtered Reservations for Users: ${reservations.length}");
// //         } else {
// //           errorMessage.value =
// //               data['message'] ?? "Failed to fetch reservations.";
// //         }
// //       } else {
// //         errorMessage.value =
// //             "Error ${response.statusCode}: Unable to fetch reservations.";
// //       }
// //     } catch (e) {
// //       errorMessage.value = "An error occurred: $e";
// //       print("Error: $e");
// //     } finally {
// //       isLoading(false);
// //     }
// //   }

// //   Map<String, dynamic> _getUserById(int userId) {
// //     return users.firstWhere(
// //       (user) => user['id'] == userId,
// //       orElse: () => {"username": "Unknown", "userType": "N/A"},
// //     );
// //   }

// //   String _formatDate(String date) {
// //     try {
// //       final parsedDate = DateTime.parse(date);
// //       return DateFormat('dd MMM').format(parsedDate);
// //     } catch (e) {
// //       return "Invalid Date";
// //     }
// //   }

// //   String _formatTime(String time) {
// //     try {
// //       final parsedTime = DateFormat("HH:mm:ss").parse(time);
// //       return DateFormat.jm().format(parsedTime); // Outputs in 12-hour format
// //     } catch (e) {
// //       return "Invalid Time";
// //     }
// //   }
// // }
// import 'dart:convert';

// import 'package:dine_deal/config/app_config.dart';
// import 'package:dine_deal/core/constants/app_constant.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';

// class ReservationController extends GetxController {
//   var isLoading = false.obs;
//   var errorMessage = ''.obs;
//   var reservations = <Map<String, dynamic>>[].obs;
//   var users = <Map<String, dynamic>>[].obs;

//   // Reservation Details
//   var savedReservation = {}.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchUsers(); // Fetch users initially
//   }

//   Future<void> fetchUsers() async {
//     try {
//       isLoading(true);
//       const String getAllUsersUrl =
//           "${AppConfig.baseURL}${AppConstant.getAllUser}";

//       final response = await http.get(Uri.parse(getAllUsersUrl));

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         users.value = List<Map<String, dynamic>>.from(data['data']);
//         print("Users Fetched: ${users.length}");

//         getAllReservations();
//       } else {
//         errorMessage.value = "Unable to fetch users.";
//       }
//     } catch (e) {
//       errorMessage.value = "An error occurred while fetching users: $e";
//     } finally {
//       isLoading(false);
//     }
//   }

//   Future<void> getAllReservations() async {
//     const String getAllReservationUrl =
//         "${AppConfig.baseURL}${AppConstant.getAllReservations}";

//     try {
//       isLoading(true);

//       final response = await http.get(Uri.parse(getAllReservationUrl));

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);

//         if (data['success'] && data['data'] is List) {
//           reservations.value = (data['data'] as List<dynamic>)
//               .map((reservation) {
//                 final userId = reservation['userId'];
//                 final user = _getUserById(userId);

//                 if (user['userType'] == 'User') {
//                   return {
//                     "username": user['username'] ?? "N/A",
//                     "tableNumber":
//                         reservation['reservationTableId']?.toString() ?? "N/A",
//                     "numberOfPersons":
//                         reservation['numberOfPersons']?.toString() ?? "N/A",
//                     "formattedDate":
//                         _formatDate(reservation['reservationDate']),
//                     "formattedTime":
//                         _formatTime(reservation['reservationTime']),
//                   };
//                 }
//                 return null;
//               })
//               .where((reservation) => reservation != null)
//               .cast<Map<String, dynamic>>()
//               .toList();

//           print("Filtered Reservations for Users: ${reservations.length}");
//         } else {
//           errorMessage.value =
//               data['message'] ?? "Failed to fetch reservations.";
//         }
//       } else {
//         errorMessage.value =
//             "Error ${response.statusCode}: Unable to fetch reservations.";
//       }
//     } catch (e) {
//       errorMessage.value = "An error occurred: $e";
//       print("Error: $e");
//     } finally {
//       isLoading(false);
//     }
//   }

//   Map<String, dynamic> _getUserById(int userId) {
//     return users.firstWhere(
//       (user) => user['id'] == userId,
//       orElse: () => {"username": "Unknown", "userType": "N/A"},
//     );
//   }

//   String _formatDate(String date) {
//     try {
//       final parsedDate = DateTime.parse(date);
//       return DateFormat('dd MMM').format(parsedDate);
//     } catch (e) {
//       return "Invalid Date";
//     }
//   }

//   String _formatTime(String time) {
//     try {
//       final parsedTime = DateFormat("HH:mm:ss").parse(time);
//       return DateFormat.jm().format(parsedTime); // Outputs in 12-hour format
//     } catch (e) {
//       return "Invalid Time";
//     }
//   }

//   // New saveReservation Method
//   void saveReservation({
//     required String restaurant,
//     required int persons,
//     required String date,
//     required String time,
//     required String table,
//   }) {
//     savedReservation.value = {
//       "restaurantName": restaurant,
//       "numberOfPersons": persons,
//       "reservationDate": date,
//       "reservationTime": time,
//       "tableNumber": table,
//     };

//     print("Reservation Saved: ${json.encode(savedReservation.value)}");
//   }
// }
import 'dart:convert';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ReservationController extends GetxController {
  // Observable variables
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var reservations = <Map<String, dynamic>>[].obs;
  var users = <Map<String, dynamic>>[].obs;

  // Reservation Details
  var savedReservation = {}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  // Fetch all users
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

  // Fetch all reservations
  Future<void> getAllReservations() async {
    const String getAllReservationUrl =
        "${AppConfig.baseURL}${AppConstant.getAllReservations}";
    try {
      isLoading(true);
      errorMessage('');

      final response = await http.get(Uri.parse(getAllReservationUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
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

          print("Reservations fetched: ${reservations.length}");
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
      "reservationPlace": "Inside", // Default or optional value
      "reservationStatus": "Pending",
      "restaurantId":
          1, // Example restaurant ID, ensure you pass this dynamically
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

  // Save a reservation
  // Future<void> saveReservation({
  //   required String restaurant,
  //   required int persons,
  //   required String date,
  //   required String time,
  //   required String table,
  // }) async {
  //   final reservationData = {
  //     "restaurantName": restaurant,
  //     "numberOfPersons": persons,
  //     "reservationDate": date,
  //     "reservationTime": time,
  //     "tableNumber": table,
  //   };

  //   try {
  //     isLoading(true);
  //     errorMessage('');

  //     const String saveReservationUrl =
  //         "${AppConfig.baseURL}${AppConstant.reservation}";

  //     final response = await http.post(
  //       Uri.parse(saveReservationUrl),
  //       headers: {
  //         "Content-Type": "application/json",
  //       },
  //       body: json.encode(reservationData),
  //     );

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       final data = json.decode(response.body);
  //       if (data['success']) {
  //         savedReservation.value = reservationData;
  //         print(
  //             "Reservation saved successfully: ${json.encode(savedReservation.value)}");
  //       } else {
  //         errorMessage.value = data['message'] ?? 'Failed to save reservation.';
  //       }
  //     } else {
  //       errorMessage.value =
  //           'Error ${response.statusCode}: Unable to save reservation.';
  //     }
  //   } catch (e) {
  //     errorMessage.value = 'An error occurred while saving the reservation: $e';
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  // Helper to get user by ID
  Map<String, dynamic> _getUserById(int userId) {
    return users.firstWhere(
      (user) => user['id'] == userId,
      orElse: () => {"username": "Unknown", "userType": "N/A"},
    );
  }

  // Helper to format date
  String _formatDate(String date) {
    try {
      final parsedDate = DateTime.parse(date);
      return DateFormat('dd MMM').format(parsedDate);
    } catch (e) {
      return "Invalid Date";
    }
  }

  // Helper to format time
  String _formatTime(String time) {
    try {
      final parsedTime = DateFormat("HH:mm:ss").parse(time);
      return DateFormat.jm().format(parsedTime); // Outputs in 12-hour format
    } catch (e) {
      return "Invalid Time";
    }
  }
}
