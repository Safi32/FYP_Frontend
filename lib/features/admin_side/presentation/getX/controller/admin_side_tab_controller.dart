import 'package:get/get.dart';

class AdminHomeScreenController extends GetxController {
  var isSwitched = false.obs;

  void toggleSwitch() {
    isSwitched.value = !isSwitched.value;
  }

  void acceptReservation(int index) {}

  void rejectReservation(int index) {}
}
