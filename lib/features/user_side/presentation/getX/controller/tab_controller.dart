import 'package:get/get.dart';

class CustomTabController extends GetxController {
  var selectedTab = 'About'.obs;
  var selectedBreakfast = ''.obs;
  var selectedLunch = ''.obs;
  var selectedDinner = ''.obs;
  var selectedHall = ''.obs;
  var isRestaurantSelected = true.obs;
  RxInt selectTab = 0.obs;

  void changeTab(int index) {
    selectedTab.value = index as String;
  }

  void updateTab(String tab) {
    selectedTab.value = tab;
  }

  void selectBreakfast(String time) {
    selectedBreakfast.value = time;
  }

  void selectLunch(String time) {
    selectedLunch.value = time;
  }

  void selectDinner(String time) {
    selectedDinner.value = time;
  }

  void selectHall(String hall) {
    selectedHall.value = hall;
  }

  void toggleSelection(bool isRestaurant) {
    isRestaurantSelected.value = isRestaurant;
  }
}
