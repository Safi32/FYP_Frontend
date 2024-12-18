import 'package:dine_deal/features/admin_side/admin_auth/presentation/getX/controller/admin_loginController.dart';
import 'package:dine_deal/features/home/controller/assigning_roles.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/reservation_controller.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/tab_controller.dart';
import 'package:dine_deal/features/user_side/user_auth/presentation/getX/controller/signup_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController(), permanent: true);
    Get.put(CustomTabController(), permanent: true);
    Get.put(ReservationsController(), permanent: true);
    Get.put(AssigningRoles(), permanent: true);
    Get.put(AdminLoginController(), permanent: true);
  }
}
