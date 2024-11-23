// import 'package:dine_deal/core/resources/app_colors.dart';
// import 'package:dine_deal/features/admin_side/presentation/getX/controller/list_restaurant_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../../widgets/button.dart';

// class MediaGallery extends StatelessWidget {
//   MediaGallery({super.key});

//   final ListRestaurantController controller =
//       Get.put(ListRestaurantController());

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         backgroundColor: AppColors.orange,
//         body: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 10,
//                 vertical: 20,
//               ),
//               child: Row(
//                 children: [
//                   IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: const Icon(
//                       Icons.arrow_back_sharp,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const Expanded(
//                     child: Center(
//                       child: Text(
//                         "Apply for Partnership",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 25,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 width: double.infinity,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     const Row(
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.symmetric(
//                             horizontal: 20,
//                             vertical: 20,
//                           ),
//                           child: Text(
//                             "Media and Gallery",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 20,
//                       ),
//                       child: Row(
//                         children: [
//                           Text(
//                             "Restaurant Photos",
//                             style: TextStyle(
//                               fontSize: 15,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 20,
//                           ),
//                           child: GestureDetector(
//                             onTap: controller.pickImage,
//                             child: Container(
//                               height: 50,
//                               width: 200,
//                               margin: const EdgeInsets.symmetric(vertical: 20),
//                               decoration: BoxDecoration(
//                                 color: AppColors.background,
//                                 borderRadius: BorderRadius.circular(10),
//                                 border: Border.all(color: Colors.grey.shade300),
//                               ),
//                               child: const Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Icon(Icons.upload_file, color: Colors.orange),
//                                   SizedBox(width: 10),
//                                   Text(
//                                     "Upload Media",
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 20,
//                       ),
//                       child: Row(
//                         children: [
//                           Text(
//                             "You can upload upto 4 pictures",
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 20,
//                       ),
//                       child: Row(
//                         children: [
//                           Text(
//                             "Additional Information",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 20,
//                         vertical: 20,
//                       ),
//                       child: TextFormField(
//                         maxLines: 5,
//                         decoration: InputDecoration(
//                           hintText: "Additioanl notes or comments",
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.grey.shade300,
//                             ),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.grey.shade300,
//                             ),
//                           ),
//                           errorBorder: const OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.red,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const Spacer(),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 20,
//                       ),
//                       child: Button(
//                         title: "Finish",
//                         color: AppColors.orange,
//                         onPressed: controller.submitRestaurantData,
//                         textColor: Colors.white,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     const Center(
//                       child: Text.rich(
//                         TextSpan(
//                           text: "Already have an account? ",
//                           style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             color: AppColors.black,
//                           ),
//                           children: <TextSpan>[
//                             TextSpan(
//                               text: "Login",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: AppColors.orange,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/admin_side/presentation/getX/controller/list_restaurant_controller.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MediaGallery extends StatelessWidget {
  MediaGallery({super.key});

  final ListRestaurantController controller =
      Get.put(ListRestaurantController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.orange,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.white,
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Apply for Partnership",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Media and Gallery",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Restaurant Photos",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              controller.pickImage("media_gallery");
                            },
                            child: Container(
                              height: 50,
                              width: 200,
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                color: AppColors.background,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.upload_file, color: Colors.orange),
                                  SizedBox(width: 10),
                                  Text(
                                    "Upload Media",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "You can upload up to 4 pictures",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Additional Information",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: TextFormField(
                        maxLines: 5,
                        onChanged: (value) {
                          controller.updateAdditionalInformation(value);
                        },
                        decoration: InputDecoration(
                          hintText: "Additional notes or comments",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Button(
                        title: "Finish",
                        color: AppColors.orange,
                        onPressed: controller.submitRestaurantData,
                        textColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Center(
                      child: Text.rich(
                        TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
