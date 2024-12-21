// import 'package:dine_deal/core/resources/app_colors.dart';
// import 'package:dine_deal/features/user_side/presentation/pages/menu_page.dart';
// import 'package:dine_deal/features/user_side/presentation/widgets/detail_notes_textfield.dart';
// import 'package:dine_deal/features/user_side/presentation/widgets/email_remainder.dart';
// import 'package:dine_deal/features/user_side/presentation/widgets/reservation_info.dart';
// import 'package:dine_deal/features/user_side/presentation/widgets/sign_up_fields.dart';
// import 'package:dine_deal/widgets/button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ReviewInformation extends StatelessWidget {
//   const ReviewInformation({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 20,
//               vertical: 20,
//             ),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: const Icon(
//                         Icons.arrow_back_ios_new_sharp,
//                       ),
//                     ),
//                     const Expanded(
//                       child: Center(
//                         child: Text(
//                           "Review Information",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const ReservationInfo(
//                   restaurantName: "Marriot Hotel Islamabad",
//                   tableInfo: "Table for 2",
//                   dateTime: "Today 14/02/2022, 13:00",
//                   timeRemaining: "09:59",
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const Row(
//                   children: [
//                     Text(
//                       "Contact Info",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 SizedBox(
//                   width: Get.width,
//                   child: Card(
//                     elevation: 1,
//                     color: AppColors.surface,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 20,
//                         vertical: 20,
//                       ),
//                       child: Column(
//                         children: [
//                           SignUpFields(
//                             validator: (value) {
//                               if (value!.isEmpty || value.length <= 3) {
//                                 return "Username must be at least 3 characters long.";
//                               } else if (value.length > 15) {
//                                 return "Username cannot exceed 15 characters.";
//                               }
//                               return null;
//                             },
//                             controller: TextEditingController(),
//                             hintText: "Enter your username",
//                             tag: "Full Name",
//                             keyboardType: TextInputType.name,
//                           ),
//                           SignUpFields(
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return "Please enter your email address.";
//                               }
//                               final emailRegex = RegExp(
//                                   r"^[a-zA-Z0-9._-]+@[a-zA-Z]+\.[a-zA-Z]+$");
//                               if (!emailRegex.hasMatch(value)) {
//                                 return "Please enter a valid email address.";
//                               } else if (!value.contains("@") ||
//                                   !value.contains(".")) {
//                                 return "Please enter a valid email address";
//                               } else if (!value.endsWith("com")) {
//                                 return "The email address must end with a valid domain, such as '.com'.";
//                               }
//                               return null;
//                             },
//                             controller: TextEditingController(),
//                             hintText: "example@gmail.com",
//                             tag: "Email",
//                             keyboardType: TextInputType.emailAddress,
//                           ),
//                           SignUpFields(
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return "Please enter your phone number.";
//                               }
//                               return null;
//                             },
//                             controller: TextEditingController(),
//                             hintText: "Enter your phone number",
//                             tag: "Phone Number",
//                             keyboardType: TextInputType.emailAddress,
//                           ),
//                           EmailReminder(),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Row(
//                   children: [
//                     Text(
//                       "Add Deals (optional)",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: Get.height * 0.38,
//                   child: Card(
//                     elevation: 1,
//                     color: AppColors.surface,
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.symmetric(
//                             horizontal: 20,
//                             vertical: 20,
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 children: [
//                                   Text(
//                                     "Explore deals",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 20,
//                                     ),
//                                   ),
//                                   Text(
//                                     "Offering 20+ deals",
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   Get.to(() => MenuPage());
//                                 },
//                                 child: Icon(
//                                   Icons.add_circle_outline_outlined,
//                                   color: AppColors.orange,
//                                   size: 40,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(
//                             horizontal: 20,
//                           ),
//                           child: Divider(
//                             color: Colors.grey,
//                           ),
//                         ),
//                         DetailNotesTextField(),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Button(
//                   title: "Reserve",
//                   color: AppColors.orange,
//                   onPressed: () {},
//                   textColor: AppColors.surface,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/timer_controller.dart';
import 'package:dine_deal/features/user_side/presentation/pages/menu_page.dart';
import 'package:dine_deal/features/user_side/presentation/pages/payment_screen.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/detail_notes_textfield.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/email_remainder.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/reservation_info.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/sign_up_fields.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewInformation extends StatelessWidget {
  const ReviewInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final TimerController timerController = Get.find<TimerController>();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new_sharp,
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          "Review Information",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => ReservationInfo(
                    restaurantName: "Marriot Hotel Islamabad",
                    tableInfo: "Table for 2",
                    dateTime: "Today 14/02/2022, 13:00",
                    timeRemaining: _formatTimeRemaining(
                        timerController.timeRemaining.value),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Text(
                      "Contact Info",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: Get.width,
                  child: Card(
                    elevation: 1,
                    color: AppColors.surface,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Column(
                        children: [
                          SignUpFields(
                            validator: (value) {
                              if (value!.isEmpty || value.length <= 3) {
                                return "Username must be at least 3 characters long.";
                              } else if (value.length > 15) {
                                return "Username cannot exceed 15 characters.";
                              }
                              return null;
                            },
                            controller: TextEditingController(),
                            hintText: "Enter your username",
                            tag: "Full Name",
                            keyboardType: TextInputType.name,
                          ),
                          SignUpFields(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your email address.";
                              }
                              final emailRegex = RegExp(
                                  r"^[a-zA-Z0-9._-]+@[a-zA-Z]+\.[a-zA-Z]+$");
                              if (!emailRegex.hasMatch(value)) {
                                return "Please enter a valid email address.";
                              } else if (!value.contains("@") ||
                                  !value.contains(".")) {
                                return "Please enter a valid email address";
                              } else if (!value.endsWith("com")) {
                                return "The email address must end with a valid domain, such as '.com'.";
                              }
                              return null;
                            },
                            controller: TextEditingController(),
                            hintText: "example@gmail.com",
                            tag: "Email",
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SignUpFields(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your phone number.";
                              }
                              return null;
                            },
                            controller: TextEditingController(),
                            hintText: "Enter your phone number",
                            tag: "Phone Number",
                            keyboardType: TextInputType.phone,
                          ),
                          EmailReminder(),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Text(
                      "Add Deals (optional)",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.38,
                  child: Card(
                    elevation: 1,
                    color: AppColors.surface,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Explore deals",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    "Offering 20+ deals",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => MenuPage());
                                },
                                child: Icon(
                                  Icons.add_circle_outline_outlined,
                                  color: AppColors.orange,
                                  size: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                        DetailNotesTextField(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Button(
                  title: "Reserve",
                  color: AppColors.orange,
                  onPressed: () {
                    timerController.timeRemaining.value = 0;
                    Get.to(
                      () => const PaymentScreen(),
                    );
                  },
                  textColor: AppColors.surface,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatTimeRemaining(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }
}
