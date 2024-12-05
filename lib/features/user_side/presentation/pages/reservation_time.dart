import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/reservation_controller.dart';
import 'package:dine_deal/features/user_side/presentation/pages/reservation_person.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/date_time_table.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/time.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReservationTime extends StatelessWidget {
  const ReservationTime({super.key});

  @override
  Widget build(BuildContext context) {
    final ReservationsController reservationsController =
        Get.find<ReservationsController>();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
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
                        btnColor: Colors.white,
                        textColor: Colors.black),
                    DateTimeTable(
                        title: "Time",
                        btnColor: AppColors.orange,
                        textColor: Colors.white),
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
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    Text(
                      "Breakfast",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          reservationsController.selectedTime("09:00 am"),
                      child: Obx(() => TimeWidget(
                            color: reservationsController.selectedTime.value ==
                                    "09:00 am"
                                ? AppColors.orange
                                : Colors.white,
                            textColor:
                                reservationsController.selectedTime.value ==
                                        "09:00 am"
                                    ? Colors.white
                                    : Colors.black,
                            title: "09:00 am",
                          )),
                    ),
                    GestureDetector(
                      onTap: () =>
                          reservationsController.selectedTime("10:00 am"),
                      child: Obx(() => TimeWidget(
                            color: reservationsController.selectedTime.value ==
                                    "10:00 am"
                                ? AppColors.orange
                                : Colors.white,
                            textColor:
                                reservationsController.selectedTime.value ==
                                        "10:00 am"
                                    ? Colors.white
                                    : Colors.black,
                            title: "10:00 am",
                          )),
                    ),
                    GestureDetector(
                      onTap: () =>
                          reservationsController.selectedTime("11:00 am"),
                      child: Obx(() => TimeWidget(
                            color: reservationsController.selectedTime.value ==
                                    "11:00 am"
                                ? AppColors.orange
                                : Colors.white,
                            textColor:
                                reservationsController.selectedTime.value ==
                                        "11:00 am"
                                    ? Colors.white
                                    : Colors.black,
                            title: "11:00 am",
                          )),
                    ),
                    GestureDetector(
                      onTap: () =>
                          reservationsController.selectedTime("12:00 am"),
                      child: Obx(
                        () => TimeWidget(
                          color: reservationsController.selectedTime.value ==
                                  "12:00 am"
                              ? AppColors.orange
                              : Colors.white,
                          textColor:
                              reservationsController.selectedTime.value ==
                                      "12:00 am"
                                  ? Colors.white
                                  : Colors.black,
                          title: "12:00 am",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    Text(
                      "Lunch",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () =>
                              reservationsController.selectedTime("01:00 pm"),
                          child: Obx(() => TimeWidget(
                                color:
                                    reservationsController.selectedTime.value ==
                                            "01:00 pm"
                                        ? AppColors.orange
                                        : Colors.white,
                                textColor:
                                    reservationsController.selectedTime.value ==
                                            "01:00 pm"
                                        ? Colors.white
                                        : Colors.black,
                                title: "01:00 pm",
                              )),
                        ),
                        GestureDetector(
                          onTap: () =>
                              reservationsController.selectedTime("02:00 pm"),
                          child: Obx(() => TimeWidget(
                                color:
                                    reservationsController.selectedTime.value ==
                                            "02:00 pm"
                                        ? AppColors.orange
                                        : Colors.white,
                                textColor:
                                    reservationsController.selectedTime.value ==
                                            "02:00 pm"
                                        ? Colors.white
                                        : Colors.black,
                                title: "02:00 pm",
                              )),
                        ),
                        GestureDetector(
                          onTap: () =>
                              reservationsController.selectedTime("03:00 pm"),
                          child: Obx(() => TimeWidget(
                                color:
                                    reservationsController.selectedTime.value ==
                                            "03:00 pm"
                                        ? AppColors.orange
                                        : Colors.white,
                                textColor:
                                    reservationsController.selectedTime.value ==
                                            "03:00 pm"
                                        ? Colors.white
                                        : Colors.black,
                                title: "03:00 pm",
                              )),
                        ),
                        GestureDetector(
                          onTap: () =>
                              reservationsController.selectedTime("04:00 pm"),
                          child: Obx(() => TimeWidget(
                                color:
                                    reservationsController.selectedTime.value ==
                                            "04:00 pm"
                                        ? AppColors.orange
                                        : Colors.white,
                                textColor:
                                    reservationsController.selectedTime.value ==
                                            "04:00 pm"
                                        ? Colors.white
                                        : Colors.black,
                                title: "04:00 pm",
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () =>
                              reservationsController.selectedTime("05:00 pm"),
                          child: Obx(() => TimeWidget(
                                color:
                                    reservationsController.selectedTime.value ==
                                            "05:00 pm"
                                        ? AppColors.orange
                                        : Colors.white,
                                textColor:
                                    reservationsController.selectedTime.value ==
                                            "05:00 pm"
                                        ? Colors.white
                                        : Colors.black,
                                title: "05:00 pm",
                              )),
                        ),
                        const SizedBox(width: 15),
                        GestureDetector(
                          onTap: () =>
                              reservationsController.selectedTime("06:00 pm"),
                          child: Obx(() => TimeWidget(
                                color:
                                    reservationsController.selectedTime.value ==
                                            "06:00 pm"
                                        ? AppColors.orange
                                        : Colors.white,
                                textColor:
                                    reservationsController.selectedTime.value ==
                                            "06:00 pm"
                                        ? Colors.white
                                        : Colors.black,
                                title: "06:00 pm",
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    Text(
                      "Dinner",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () =>
                              reservationsController.selectedTime("07:00 pm"),
                          child: Obx(
                            () => TimeWidget(
                              color:
                                  reservationsController.selectedTime.value ==
                                          "07:00 pm"
                                      ? AppColors.orange
                                      : Colors.white,
                              textColor:
                                  reservationsController.selectedTime.value ==
                                          "07:00 pm"
                                      ? Colors.white
                                      : Colors.black,
                              title: "07:00 pm",
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              reservationsController.selectedTime("08:00 pm"),
                          child: Obx(
                            () => TimeWidget(
                              color:
                                  reservationsController.selectedTime.value ==
                                          "08:00 pm"
                                      ? AppColors.orange
                                      : Colors.white,
                              textColor:
                                  reservationsController.selectedTime.value ==
                                          "08:00 pm"
                                      ? Colors.white
                                      : Colors.black,
                              title: "08:00 pm",
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              reservationsController.selectedTime("09:00 pm"),
                          child: Obx(
                            () => TimeWidget(
                              color:
                                  reservationsController.selectedTime.value ==
                                          "09:00 pm"
                                      ? AppColors.orange
                                      : Colors.white,
                              textColor:
                                  reservationsController.selectedTime.value ==
                                          "09:00 pm"
                                      ? Colors.white
                                      : Colors.black,
                              title: "09:00 pm",
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              reservationsController.selectedTime("10:00 pm"),
                          child: Obx(
                            () => TimeWidget(
                              color:
                                  reservationsController.selectedTime.value ==
                                          "10:00 pm"
                                      ? AppColors.orange
                                      : Colors.white,
                              textColor:
                                  reservationsController.selectedTime.value ==
                                          "10:00 pm"
                                      ? Colors.white
                                      : Colors.black,
                              title: "10:00 pm",
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () =>
                              reservationsController.selectedTime("11:00 pm"),
                          child: Obx(
                            () => TimeWidget(
                              color:
                                  reservationsController.selectedTime.value ==
                                          "11:00 pm"
                                      ? AppColors.orange
                                      : Colors.white,
                              textColor:
                                  reservationsController.selectedTime.value ==
                                          "11:00 pm"
                                      ? Colors.white
                                      : Colors.black,
                              title: "11:00 pm",
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              reservationsController.selectedTime("12:00 pm"),
                          child: Obx(
                            () => TimeWidget(
                              color:
                                  reservationsController.selectedTime.value ==
                                          "12:00 pm"
                                      ? AppColors.orange
                                      : Colors.white,
                              textColor:
                                  reservationsController.selectedTime.value ==
                                          "12:00 pm"
                                      ? Colors.white
                                      : Colors.black,
                              title: "12:00 pm",
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              reservationsController.selectedTime("01:00 am"),
                          child: Obx(
                            () => TimeWidget(
                              color:
                                  reservationsController.selectedTime.value ==
                                          "01:00 am"
                                      ? AppColors.orange
                                      : Colors.white,
                              textColor:
                                  reservationsController.selectedTime.value ==
                                          "01:00 am"
                                      ? Colors.white
                                      : Colors.black,
                              title: "01:00 am",
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              reservationsController.selectedTime("02:00 am"),
                          child: Obx(
                            () => TimeWidget(
                              color:
                                  reservationsController.selectedTime.value ==
                                          "02:00 am"
                                      ? AppColors.orange
                                      : Colors.white,
                              textColor:
                                  reservationsController.selectedTime.value ==
                                          "02:00 am"
                                      ? Colors.white
                                      : Colors.black,
                              title: "02:00 am",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: Get.width * 0.45,
                child: Button(
                  title: "Next",
                  color: AppColors.orange,
                  onPressed: () {
                    Get.to(() => const ReservationPerson());
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
