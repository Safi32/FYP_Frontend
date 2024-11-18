import 'package:dine_deal/controller/reservation_date_controller.dart';
import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/widgets/date_time_table.dart';
import 'package:dine_deal/view/user_side/reservation_time.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class ReservationDate extends StatelessWidget {
  const ReservationDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ReservationDateController controller =
        Get.put(ReservationDateController());

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              // Header with back button
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
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
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      title: "Table",
                      btnColor: Colors.white,
                      textColor: Colors.black,
                    ),
                  ],
                ),
              ),
              Obx(() => TableCalendar(
                    focusedDay: controller.selectedDate.value,
                    firstDay: DateTime.now(),
                    lastDay: DateTime(2100),
                    selectedDayPredicate: (day) {
                      return isSameDay(controller.selectedDate.value, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      controller.updateDate(selectedDay);
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
                  )),
              const Spacer(),
              SizedBox(
                width: Get.width * 0.45,
                child: Button(
                  title: "Next",
                  color: AppColors.orange,
                  onPressed: () {
                    Get.to(() => const ReservationTime());
                  },
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
