import 'package:dine_deal/features/admin_side/admin_auth/presentation/getX/controller/admin_loginController.dart';
import 'package:dine_deal/features/admin_side/presentation/getX/controller/get_reservation_controller.dart';
import 'package:dine_deal/features/admin_side/presentation/getX/controller/list_restaurant_controller.dart';
import 'package:dine_deal/features/admin_side/presentation/getX/controller/reservation_controller.dart';
import 'package:dine_deal/features/home/controller/assigning_roles.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/deals_controller.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/get_deals_controller.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/get_restaurant_controller.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/get_type_controller.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/restaurant_controllers.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/tab_controller.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/timer_controller.dart';
import 'package:dine_deal/features/user_side/user_auth/presentation/getX/controller/change_password_controller.dart';
import 'package:dine_deal/features/user_side/user_auth/presentation/getX/controller/logout_controller.dart';
import 'package:dine_deal/features/user_side/user_auth/presentation/getX/controller/signup_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AdminLoginController(), permanent: true);
    Get.put(SignUpController(), permanent: true);
    Get.put(CustomTabController(), permanent: true);
    Get.put(RestaurantControllers(), permanent: true);
    Get.put(ReservationController(), permanent: true);
    Get.put(GetReservationController(), permanent: true);
    Get.put(ListRestaurantController(), permanent: true);
    Get.put(TimerController(), permanent: true);
    Get.put(AssigningRoles(), permanent: true);
    Get.put(GetDealsController(), permanent: true);
    Get.put(GetCategoriesController(), permanent: true);
    Get.put(RestaurantController(), permanent: true);
    Get.put(DealsController(), permanent: true);
    Get.put(LogoutController(), permanent: true);
    Get.put(ChangePasswordController(), permanent: true);
  }
}
