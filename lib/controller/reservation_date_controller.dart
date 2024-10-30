import 'package:get/get.dart';

class ReservationDateController extends GetxController {
  // Initialize with the current date by default
  var selectedDate = DateTime.now().obs;

  // Method to update the selected date
  void updateDate(DateTime date) {
    selectedDate.value = date;
  }
}
