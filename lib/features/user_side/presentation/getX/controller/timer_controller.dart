// import 'dart:async';

// import 'package:dine_deal/core/resources/app_colors.dart';
// import 'package:dine_deal/widgets/button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class TimerController extends GetxController {
//   final RxInt timeRemaining = 600.obs;
//   late Timer _timer;

//   @override
//   void onInit() {
//     super.onInit();
//     _startTimer();
//   }

//   void _startTimer() {
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (timeRemaining.value > 0) {
//         timeRemaining.value--;
//       } else {
//         _timer.cancel();
//         _showTimeExpiredDialog();
//       }
//     });
//   }

//   void _showTimeExpiredDialog() {
//     Get.dialog(
//       AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         icon: Image(
//           image: AssetImage(
//             "assets/dialog-box.png",
//           ),
//           fit: BoxFit.cover,
//         ),
//         title: const Text(
//           "Oh no...",
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//         ),
//         content: const Text(
//           "The table you have selected is released after 10 minutes of reviewing. Please kindly re-select the table.",
//         ),
//         actions: [
//           Button(
//             title: "Re-select Table",
//             color: AppColors.orange,
//             onPressed: () {
//               Get.back();
//               Get.back();
//             },
//             textColor: AppColors.surface,
//           ),
//         ],
//       ),
//       barrierDismissible: false,
//     );
//   }

//   @override
//   void onClose() {
//     _timer.cancel();
//     super.onClose();
//   }
// }
import 'dart:async';

import 'package:get/get.dart';

class TimerController extends GetxController {
  RxInt timeRemaining = 0.obs; // Observable to track remaining time
  Timer? _timer;

  void startTimer(int durationInSeconds) {
    timeRemaining.value = durationInSeconds;

    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeRemaining.value > 0) {
        timeRemaining.value--; // Decrement timeRemaining
      } else {
        timer.cancel();
        Get.snackbar("Time Up", "The reservation time has ended.");
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel(); // Clean up timer on controller destruction
    super.onClose();
  }
}
