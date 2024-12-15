import 'package:dine_deal/features/admin_side/admin_auth/presentation/getX/controller/admin_loginController.dart';
import 'package:dine_deal/features/admin_side/presentation/getX/controller/reservation_controller.dart';
import 'package:dine_deal/features/home/controller/assigning_roles.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/get_restaurant_controller.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/tab_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CustomTabController(), permanent: true);
    Get.put(ReservationController(), permanent: true);
    Get.put(RestaurantController(), permanent: true);
    Get.put(AssigningRoles(), permanent: true);
    Get.put(AdminLoginController(), permanent: true);
  }
}
