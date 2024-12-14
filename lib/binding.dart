import 'package:dine_deal/features/admin_side/presentation/getX/controller/reservation_controller.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/get_restaurant_controller.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/tab_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CustomTabController(), permanent: true); // CustomTabController
    Get.put(ReservationController(), permanent: true); // ReservationController
    Get.put(RestaurantController(), permanent: true);
  }
}
