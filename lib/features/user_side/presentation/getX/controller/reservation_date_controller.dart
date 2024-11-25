import 'package:get/get.dart';

class ReservationDateController extends GetxController {
  var selectedDate = DateTime.now().obs;
  void updateDate(DateTime date) {
    selectedDate.value = date;
  }
}
