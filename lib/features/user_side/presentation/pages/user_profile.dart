// import 'package:dine_deal/core/resources/app_colors.dart';
// import 'package:dine_deal/features/user_side/presentation/pages/user_review_card.dart';
// import 'package:dine_deal/features/user_side/presentation/widgets/card_widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class UserProfile extends StatelessWidget {
//   const UserProfile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const CircleAvatar(
//                 radius: 60,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const Text(
//                 "Safiullah Shahid",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 15,
//                 ),
//               ),
//               const Text(
//                 "Safiullah@gmail.com",
//                 style: TextStyle(
//                   color: AppColors.orange,
//                   fontSize: 15,
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 20,
//                 ),
//                 child: Row(
//                   children: [
//                     UserReviewCard(),
//                     UserReviewCard(),
//                     UserReviewCard(),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 height: Get.height * 0.35,
//                 width: Get.width * 0.9,
//                 child: const Card(
//                   elevation: 1,
//                   color: Colors.white,
//                   child: Padding(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 10,
//                         vertical: 20,
//                       ),
//                       child: Column(
//                         children: [
//                           CardWidgets(
//                             imageURL: "assets/user.png",
//                             title: "Personal Setting",
//                             color: Colors.black,
//                             icon: Icons.arrow_forward_ios_outlined,
//                           ),
//                           SizedBox(height: 20),
//                           CardWidgets(
//                             imageURL: "assets/language.png",
//                             title: "Language",
//                             color: Colors.black,
//                             icon: Icons.arrow_forward_ios_outlined,
//                           ),
//                           SizedBox(height: 20),
//                           CardWidgets(
//                             imageURL: "assets/faq.png",
//                             title: "Faq's",
//                             color: Colors.black,
//                             icon: Icons.arrow_forward_ios_outlined,
//                           ),
//                           SizedBox(height: 20),
//                           CardWidgets(
//                             imageURL: "assets/faq.png",
//                             title: "About app",
//                             color: Colors.black,
//                             icon: Icons.arrow_forward_ios_outlined,
//                           ),
//                           SizedBox(height: 20),
//                           CardWidgets(
//                             imageURL: "assets/faq.png",
//                             title: "Terms & Conditions",
//                             color: Colors.black,
//                             icon: Icons.arrow_forward_ios_outlined,
//                           ),
//                           SizedBox(height: 20),
//                           CardWidgets(
//                             imageURL: "assets/logout.png",
//                             title: "Logout",
//                             color: AppColors.orange,
//                             showIcon: false,
//                             icon: Icons.arrow_forward_ios_outlined,
//                           ),
//                         ],
//                       )),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:dine_deal/core/resources/app_colors.dart';
// import 'package:dine_deal/features/user_side/presentation/getX/controller/logout_controller.dart';
// import 'package:dine_deal/features/user_side/presentation/pages/user_review_card.dart';
// import 'package:dine_deal/features/user_side/presentation/widgets/card_widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class UserProfile extends StatelessWidget {
//   const UserProfile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final LogoutController logoutController = Get.put(LogoutController());

//     return SafeArea(
//       child: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const CircleAvatar(
//                 radius: 60,
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 "Safiullah Shahid",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 15,
//                 ),
//               ),
//               const Text(
//                 "Safiullah@gmail.com",
//                 style: TextStyle(
//                   color: AppColors.orange,
//                   fontSize: 15,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 child: Row(
//                   children: [
//                     Expanded(child: UserReviewCard()),
//                     Expanded(child: UserReviewCard()),
//                     Expanded(child: UserReviewCard()),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                 height: Get.height * 0.5,
//                 width: Get.width * 0.9,
//                 child: Obx(
//                   () => Card(
//                     elevation: 1,
//                     color: Colors.white,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 10,
//                         vertical: 20,
//                       ),
//                       child: Column(
//                         children: [
//                           const CardWidgets(
//                             imageURL: "assets/user.png",
//                             title: "Personal Setting",
//                             color: Colors.black,
//                             icon: Icons.arrow_forward_ios_outlined,
//                           ),
//                           const SizedBox(height: 20),
//                           const CardWidgets(
//                             imageURL: "assets/language.png",
//                             title: "Language",
//                             color: Colors.black,
//                             icon: Icons.arrow_forward_ios_outlined,
//                           ),
//                           const SizedBox(height: 20),
//                           const CardWidgets(
//                             imageURL: "assets/faq.png",
//                             title: "Faq's",
//                             color: Colors.black,
//                             icon: Icons.arrow_forward_ios_outlined,
//                           ),
//                           const SizedBox(height: 20),
//                           const CardWidgets(
//                             imageURL: "assets/faq.png",
//                             title: "About app",
//                             color: Colors.black,
//                             icon: Icons.arrow_forward_ios_outlined,
//                           ),
//                           const SizedBox(height: 20),
//                           const CardWidgets(
//                             imageURL: "assets/faq.png",
//                             title: "Terms & Conditions",
//                             color: Colors.black,
//                             icon: Icons.arrow_forward_ios_outlined,
//                           ),
//                           const SizedBox(height: 20),
//                           GestureDetector(
//                             onTap: () async {
//                               // Fetch the stored JWT token from FlutterSecureStorage
//                               final token = await logoutController.storage
//                                   .read(key: 'jwt_token');
//                               if (token != null) {
//                                 // Call the logout method with the retrieved token
//                                 logoutController.logoutUser(token);
//                               } else {
//                                 Get.snackbar(
//                                   "Error",
//                                   "Unable to logout. Token not found.",
//                                   snackPosition: SnackPosition.TOP,
//                                 );
//                               }
//                             },
//                             child: CardWidgets(
//                               imageURL: "assets/logout.png",
//                               title: logoutController.isLoading.value
//                                   ? "Logging out..."
//                                   : "Logout",
//                               color: AppColors.orange,
//                               showIcon: false,
//                               icon: Icons.arrow_forward_ios_outlined,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/logout_controller.dart';
import 'package:dine_deal/features/user_side/presentation/pages/user_review_card.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/card_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final LogoutController logoutController = Get.put(LogoutController());

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
              ),
              const SizedBox(height: 20),
              const Text(
                "Safiullah Shahid",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const Text(
                "Safiullah@gmail.com",
                style: TextStyle(
                  color: AppColors.orange,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(child: UserReviewCard()),
                    Expanded(child: UserReviewCard()),
                    Expanded(child: UserReviewCard()),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: Get.height * 0.5,
                width: Get.width * 0.9,
                child: Card(
                  elevation: 1,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20,
                    ),
                    child: Column(
                      children: [
                        const CardWidgets(
                          imageURL: "assets/user.png",
                          title: "Personal Setting",
                          color: Colors.black,
                          icon: Icons.arrow_forward_ios_outlined,
                        ),
                        const SizedBox(height: 20),
                        const CardWidgets(
                          imageURL: "assets/language.png",
                          title: "Language",
                          color: Colors.black,
                          icon: Icons.arrow_forward_ios_outlined,
                        ),
                        const SizedBox(height: 20),
                        const CardWidgets(
                          imageURL: "assets/faq.png",
                          title: "Faq's",
                          color: Colors.black,
                          icon: Icons.arrow_forward_ios_outlined,
                        ),
                        const SizedBox(height: 20),
                        const CardWidgets(
                          imageURL: "assets/faq.png",
                          title: "About app",
                          color: Colors.black,
                          icon: Icons.arrow_forward_ios_outlined,
                        ),
                        const SizedBox(height: 20),
                        const CardWidgets(
                          imageURL: "assets/faq.png",
                          title: "Terms & Conditions",
                          color: Colors.black,
                          icon: Icons.arrow_forward_ios_outlined,
                        ),
                        const SizedBox(height: 20),
                        // Fix the Logout Button
                        Obx(() => GestureDetector(
                              onTap: () async {
                                if (!logoutController.isLoading.value) {
                                  await logoutController.logoutUser();
                                }
                              },
                              child: CardWidgets(
                                imageURL: "assets/logout.png",
                                title: logoutController.isLoading.value
                                    ? "Logging out..."
                                    : "Logout",
                                color: AppColors.orange,
                                showIcon: false,
                                icon: Icons.arrow_forward_ios_outlined,
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
