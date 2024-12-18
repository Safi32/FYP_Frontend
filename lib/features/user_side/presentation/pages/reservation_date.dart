// import 'package:dine_deal/core/resources/app_colors.dart';
// import 'package:dine_deal/features/admin_side/presentation/getX/controller/reservation_controller.dart';
// import 'package:dine_deal/features/user_side/presentation/getX/controller/reservation_controller.dart';
// import 'package:dine_deal/features/user_side/presentation/pages/reservation_time.dart';
// import 'package:dine_deal/features/user_side/presentation/widgets/date_time_table.dart';
// import 'package:dine_deal/widgets/button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:table_calendar/table_calendar.dart';

// class ReservationDate extends StatelessWidget {
//   ReservationDate({super.key});

//   final ReservationController reservationController =
//       Get.find<ReservationController>();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 20),
//           child: Column(
//             children: [
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 child: Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: const Icon(Icons.arrow_back_ios_new_sharp),
//                     ),
//                     const Expanded(
//                       child: Center(
//                         child: Text(
//                           "Reservation",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Tabs
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     DateTimeTable(
//                       title: "Date",
//                       btnColor: AppColors.orange,
//                       textColor: Colors.white,
//                     ),
//                     DateTimeTable(
//                       title: "Time",
//                       btnColor: Colors.white,
//                       textColor: Colors.black,
//                     ),
//                     DateTimeTable(
//                       title: "Person",
//                       btnColor: Colors.white,
//                       textColor: Colors.black,
//                     ),
//                     DateTimeTable(
//                       title: "Table",
//                       btnColor: Colors.white,
//                       textColor: Colors.black,
//                     ),
//                   ],
//                 ),
//               ),

//               Obx(() {
//                 return TableCalendar(
//                   focusedDay: reservationController.,
//                   firstDay: DateTime.now(),
//                   lastDay: DateTime(2100),
//                   selectedDayPredicate: (day) {
//                     return isSameDay(
//                         reservationController.selectedDate.value, day);
//                   },
//                   onDaySelected: (selectedDay, focusedDay) {
//                     reservationController.setSelectedDate(selectedDay);
//                   },
//                   calendarStyle: const CalendarStyle(
//                     todayTextStyle: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     selectedDecoration: BoxDecoration(
//                       color: AppColors.orange,
//                       shape: BoxShape.circle,
//                     ),
//                     selectedTextStyle: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     defaultTextStyle: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     weekendTextStyle: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 );
//               }),
//               const Spacer(),
//               // Next Button
//               SizedBox(
//                 width: Get.width * 0.45,
//                 child: Button(
//                   title: "Next",
//                   color: AppColors.orange,
//                   onPressed: () {
//                     if (reservationController.selectedDate.value != null) {
//                       Get.to(() => ReservationTime());
//                     } else {
//                       Get.snackbar(
//                         "Error",
//                         "Please select a date first.",
//                         snackPosition: SnackPosition.BOTTOM,
//                       );
//                     }
//                   },
//                   textColor: Colors.white,
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
import 'package:dine_deal/features/user_side/presentation/getX/controller/reservation_controller.dart';
import 'package:dine_deal/features/user_side/presentation/pages/reservation_time.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/date_time_table.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class ReservationDate extends StatelessWidget {
  final ReservationsController reservationController =
      Get.find<ReservationsController>();

  ReservationDate({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              _buildHeader(context),
              _buildTabs(),
              Obx(() => _buildCalendar()),
              const Spacer(),
              _buildNextButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios_new_sharp),
          ),
          const Expanded(
            child: Center(
              child: Text(
                "Reservation",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DateTimeTable(
            title: "Date",
            btnColor: AppColors.orange,
            textColor: Colors.white,
          ),
          DateTimeTable(
            title: "Time",
            btnColor: Colors.white,
            textColor: Colors.black,
          ),
          DateTimeTable(
            title: "Person",
            btnColor: Colors.white,
            textColor: Colors.black,
          ),
          DateTimeTable(
            title: "Table",
            btnColor: Colors.white,
            textColor: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget _buildCalendar() {
    return TableCalendar(
      focusedDay: reservationController.selectedDate.value,
      firstDay: DateTime.now(),
      lastDay: DateTime(2100),
      selectedDayPredicate: (day) =>
          isSameDay(reservationController.selectedDate.value, day),
      onDaySelected: (selectedDay, focusedDay) {
        reservationController.selectedDate(selectedDay);
      },
      calendarStyle: const CalendarStyle(
        todayTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        selectedDecoration: BoxDecoration(
          color: AppColors.orange,
          shape: BoxShape.circle,
        ),
        selectedTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        defaultTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        weekendTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return SizedBox(
      width: Get.width * 0.45,
      child: Button(
        title: "Next",
        color: AppColors.orange,
        onPressed: () {
          if (reservationController.selectedDate.value != null) {
            Get.to(() => const ReservationTime());
          } else {
            Get.snackbar("Error", "Please select a date first.",
                snackPosition: SnackPosition.BOTTOM);
          }
        },
        textColor: Colors.white,
      ),
    );
  }
}
