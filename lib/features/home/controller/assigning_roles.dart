import 'package:dine_deal/features/admin_side/admin_auth/presentation/pages/admin_login.dart';
import 'package:dine_deal/features/user_side/user_auth/presentation/pages/login.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AssigningRoles extends GetxController {
  var errorMessage = ''.obs;
  Future<void> assignRole(String role) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_role', role);

      Get.snackbar(
        "Success",
        "Role assigned successfully: $role",
      );

      if (role.toLowerCase() == 'admin') {
        Get.to(() => AdminLogin());
      } else if (role.toLowerCase() == 'user') {
        Get.to(() => LoginScreen());
      } else {
        throw Exception("Invalid role selected");
      }
    } catch (e) {
      errorMessage.value = 'Something went wrong: $e';
      Get.snackbar("Error", errorMessage.value);
    }
  }
}
