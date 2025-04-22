import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReservationTabsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var selectedTabIndex = 0.obs;

  late TabController tabController;

  final List<String> tabs = ['Upcoming', 'Ongoing', 'Past'];

  @override
  void onInit() {
    tabController = TabController(length: tabs.length, vsync: this);
    tabController.addListener(() {
      selectedTabIndex.value = tabController.index;
    });
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
