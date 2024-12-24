import 'dart:convert';

import 'package:dine_deal/config/app_config.dart';
import 'package:dine_deal/core/constants/app_constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GetReservationController extends GetxController {
  var reservations = [].obs;
  Future<void> fetchReservations() async {
    try {
      print('Fetching reservations...');
      final response = await http.get(
          Uri.parse('${AppConfig.baseURL}${AppConstant.getAllReservations}'));

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print('Decoded Response: $responseData');

        if (responseData.containsKey('reservations') &&
            responseData['reservations'] != null) {
          reservations.assignAll(responseData['reservations']);
          print('Reservations assigned: ${reservations.length}');
        } else {
          print('No reservations found or incorrect response structure.');
        }
      } else {
        print(
            'Failed to fetch reservations. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching reservations: $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchReservations();
  }
}
