import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/admin_side/widgets/drawer_details.dart';
import 'package:dine_deal/features/user_side/user_auth/presentation/getX/controller/logout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final LogoutController logoutController = Get.find<LogoutController>();
    return Drawer(
      backgroundColor: AppColors.orange,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Marriot Hotel Islamabad",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: AppColors.yellow,
                ),
                const SizedBox(width: 5),
                const Text(
                  "4.9",
                  style: TextStyle(
                    color: AppColors.surface,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 2,
                  height: 10,
                  color: AppColors.surface,
                ),
                const SizedBox(width: 5),
                const Text(
                  "48 reviews",
                  style: TextStyle(
                    color: AppColors.surface,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              children: [
                DrawerDetails(
                  onPressed: () {},
                  imageUrl: "assets/drawer_image_01.png",
                  title: "Account Information",
                  icon: Icons.arrow_forward_ios,
                ),
                const SizedBox(
                  height: 20,
                ),
                DrawerDetails(
                  onPressed: () {},
                  imageUrl: "assets/drawer_image_02.png",
                  title: "Help",
                  icon: Icons.arrow_forward_ios,
                ),
                const SizedBox(
                  height: 20,
                ),
                DrawerDetails(
                  onPressed: () {},
                  imageUrl: "assets/drawer_image_03.png",
                  title: "Privacy Policy",
                  icon: Icons.arrow_forward_ios,
                ),
                const SizedBox(
                  height: 20,
                ),
                DrawerDetails(
                  onPressed: () {},
                  imageUrl: "assets/drawer_image_04.png",
                  title: "Settings",
                  icon: Icons.arrow_forward_ios,
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                logoutController.logout();
              },
              child: const Row(
                children: [
                  Image(
                    image: AssetImage(
                      "assets/admin_logout.png",
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
