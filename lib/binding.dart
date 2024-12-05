import 'package:dine_deal/features/admin_side/presentation/getX/controller/reservation_controller.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/tab_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // Register all controllers and services here
    Get.put(CustomTabController(), permanent: true); // CustomTabController
    Get.put(ReservationController(), permanent: true); // ReservationController
  }
}
