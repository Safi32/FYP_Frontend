import 'package:get/get.dart';

class CustomTabController extends GetxController {
  var selectedTab = 'About'.obs;

  void updateTab(String tab) {
    selectedTab.value = tab;
  }
}
