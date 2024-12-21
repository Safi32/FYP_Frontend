// import 'package:get/get.dart';

// class CustomTabController extends GetxController {
//   var selectedTab = 'About'.obs;
//   var selectedBreakfast = ''.obs;
//   var selectedLunch = ''.obs;
//   var selectedDinner = ''.obs;
//   var selectedHall = ''.obs;
//   var isRestaurantSelected = true.obs;
//   RxInt selectTab = 0.obs;
//   var selectedIndex = 0.obs;

//   final tabs = ['Deals For Today', 'Two Person', 'Family'];

//   void updateIndex(int index) {
//     selectedIndex.value = index;
//   }

//   void changeTab(int index) {
//     selectedTab.value = index as String;
//   }

//   void updateTab(String tab) {
//     selectedTab.value = tab;
//   }

//   void selectBreakfast(String time) {
//     selectedBreakfast.value = time;
//   }

//   void selectLunch(String time) {
//     selectedLunch.value = time;
//   }

//   void selectDinner(String time) {
//     selectedDinner.value = time;
//   }

//   void selectHall(String hall) {
//     selectedHall.value = hall;
//   }

//   void toggleSelection(bool isRestaurant) {
//     isRestaurantSelected.value = isRestaurant;
//   }
// }
import 'package:get/get.dart';

class CustomTabController extends GetxController {
  var selectedTab = 'About'.obs;
  var selectedBreakfast = ''.obs;
  var selectedLunch = ''.obs;
  var selectedDinner = ''.obs;
  var selectedHall = ''.obs;
  var isRestaurantSelected = true.obs;
  var selectedIndex = 0.obs;
  var selectedTabIndex = 0.obs;

  final tabs = ['Deals For Today', 'Two Person', 'Family'];

  void toggleSelections(int index) {
    selectedTabIndex.value = index;
  }

  // Updates selected index for the tabs
  void updateIndex(int index) {
    selectedIndex.value = index;
  }

  // Updates the selected tab
  void updateTab(String tab) {
    selectedTab.value = tab;
  }

  // Select time for breakfast
  void selectBreakfast(String time) {
    selectedBreakfast.value = time;
  }

  // Select time for lunch
  void selectLunch(String time) {
    selectedLunch.value = time;
  }

  // Select time for dinner
  void selectDinner(String time) {
    selectedDinner.value = time;
  }

  // Select a hall
  void selectHall(String hall) {
    selectedHall.value = hall;
  }

  // Toggles between restaurant and hall selection
  void toggleSelection(bool isRestaurant) {
    isRestaurantSelected.value = isRestaurant;
  }
}
