import 'package:dine_deal/controller/tab_controller.dart';
import 'package:dine_deal/utils/colors.dart';
import 'package:dine_deal/view/user_side/reservation_table.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:dine_deal/widgets/date_time_table.dart';
import 'package:dine_deal/widgets/time.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReservationTime extends StatelessWidget {
  const ReservationTime({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomTabController controller = Get.put(CustomTabController());

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
                        btnColor: orange,
                        textColor: Colors.white),
                    DateTimeTable(
                        title: "Table",
                        btnColor: Colors.white,
                        textColor: Colors.black),
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
                      onTap: () => controller.selectBreakfast("09:00 am"),
                      child: Obx(() => TimeWidget(
                            color:
                                controller.selectedBreakfast.value == "09:00 am"
                                    ? orange
                                    : Colors.white,
                            textColor:
                                controller.selectedBreakfast.value == "09:00 am"
                                    ? Colors.white
                                    : Colors.black,
                            title: "09:00 am",
                          )),
                    ),
                    GestureDetector(
                      onTap: () => controller.selectBreakfast("10:00 am"),
                      child: Obx(() => TimeWidget(
                            color:
                                controller.selectedBreakfast.value == "10:00 am"
                                    ? orange
                                    : Colors.white,
                            textColor:
                                controller.selectedBreakfast.value == "10:00 am"
                                    ? Colors.white
                                    : Colors.black,
                            title: "10:00 am",
                          )),
                    ),
                    GestureDetector(
                      onTap: () => controller.selectBreakfast("11:00 am"),
                      child: Obx(() => TimeWidget(
                            color:
                                controller.selectedBreakfast.value == "11:00 am"
                                    ? orange
                                    : Colors.white,
                            textColor:
                                controller.selectedBreakfast.value == "11:00 am"
                                    ? Colors.white
                                    : Colors.black,
                            title: "11:00 am",
                          )),
                    ),
                    GestureDetector(
                      onTap: () => controller.selectBreakfast("12:00 pm"),
                      child: Obx(() => TimeWidget(
                            color:
                                controller.selectedBreakfast.value == "12:00 pm"
                                    ? orange
                                    : Colors.white,
                            textColor:
                                controller.selectedBreakfast.value == "12:00 pm"
                                    ? Colors.white
                                    : Colors.black,
                            title: "12:00 pm",
                          )),
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
                          onTap: () => controller.selectLunch("01:00 pm"),
                          child: Obx(() => TimeWidget(
                                color:
                                    controller.selectedLunch.value == "01:00 pm"
                                        ? orange
                                        : Colors.white,
                                textColor:
                                    controller.selectedLunch.value == "01:00 pm"
                                        ? Colors.white
                                        : Colors.black,
                                title: "01:00 pm",
                              )),
                        ),
                        GestureDetector(
                          onTap: () => controller.selectLunch("02:00 pm"),
                          child: Obx(() => TimeWidget(
                                color:
                                    controller.selectedLunch.value == "02:00 pm"
                                        ? orange
                                        : Colors.white,
                                textColor:
                                    controller.selectedLunch.value == "02:00 pm"
                                        ? Colors.white
                                        : Colors.black,
                                title: "02:00 pm",
                              )),
                        ),
                        GestureDetector(
                          onTap: () => controller.selectLunch("03:00 pm"),
                          child: Obx(() => TimeWidget(
                                color:
                                    controller.selectedLunch.value == "03:00 pm"
                                        ? orange
                                        : Colors.white,
                                textColor:
                                    controller.selectedLunch.value == "03:00 pm"
                                        ? Colors.white
                                        : Colors.black,
                                title: "03:00 pm",
                              )),
                        ),
                        GestureDetector(
                          onTap: () => controller.selectLunch("04:00 pm"),
                          child: Obx(() => TimeWidget(
                                color:
                                    controller.selectedLunch.value == "04:00 pm"
                                        ? orange
                                        : Colors.white,
                                textColor:
                                    controller.selectedLunch.value == "04:00 pm"
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
                          onTap: () => controller.selectLunch("05:00 pm"),
                          child: Obx(() => TimeWidget(
                                color:
                                    controller.selectedLunch.value == "05:00 pm"
                                        ? orange
                                        : Colors.white,
                                textColor:
                                    controller.selectedLunch.value == "05:00 pm"
                                        ? Colors.white
                                        : Colors.black,
                                title: "05:00 pm",
                              )),
                        ),
                        const SizedBox(width: 15),
                        GestureDetector(
                          onTap: () => controller.selectLunch("06:00 pm"),
                          child: Obx(() => TimeWidget(
                                color:
                                    controller.selectedLunch.value == "06:00 pm"
                                        ? orange
                                        : Colors.white,
                                textColor:
                                    controller.selectedLunch.value == "06:00 pm"
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
                          onTap: () => controller.selectDinner("07:00 pm"),
                          child: Obx(
                            () => TimeWidget(
                              color:
                                  controller.selectedDinner.value == "07:00 pm"
                                      ? orange
                                      : Colors.white,
                              textColor:
                                  controller.selectedDinner.value == "07:00 pm"
                                      ? Colors.white
                                      : Colors.black,
                              title: "07:00 pm",
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => controller.selectDinner("08:00 pm"),
                          child: Obx(
                            () => TimeWidget(
                              color:
                                  controller.selectedDinner.value == "08:00 pm"
                                      ? orange
                                      : Colors.white,
                              textColor:
                                  controller.selectedDinner.value == "08:00 pm"
                                      ? Colors.white
                                      : Colors.black,
                              title: "08:00 pm",
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => controller.selectDinner("09:00 pm"),
                          child: Obx(
                            () => TimeWidget(
                              color:
                                  controller.selectedDinner.value == "09:00 pm"
                                      ? orange
                                      : Colors.white,
                              textColor:
                                  controller.selectedDinner.value == "09:00 pm"
                                      ? Colors.white
                                      : Colors.black,
                              title: "09:00 pm",
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => controller.selectDinner("10:00 pm"),
                          child: Obx(
                            () => TimeWidget(
                              color:
                                  controller.selectedDinner.value == "10:00 pm"
                                      ? orange
                                      : Colors.white,
                              textColor:
                                  controller.selectedDinner.value == "10:00 pm"
                                      ? Colors.white
                                      : Colors.black,
                              title: "10:00 pm",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => controller.selectDinner("11:00 pm"),
                          child: Obx(
                            () => TimeWidget(
                              color:
                                  controller.selectedDinner.value == "11:00 pm"
                                      ? orange
                                      : Colors.white,
                              textColor:
                                  controller.selectedDinner.value == "11:00 pm"
                                      ? Colors.white
                                      : Colors.black,
                              title: "11:00 pm",
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => controller.selectDinner("12:00 pm"),
                          child: Obx(
                            () => TimeWidget(
                              color:
                                  controller.selectedDinner.value == "12:00 pm"
                                      ? orange
                                      : Colors.white,
                              textColor:
                                  controller.selectedDinner.value == "12:00 pm"
                                      ? Colors.white
                                      : Colors.black,
                              title: "12:00 pm",
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => controller.selectDinner("01:00 pm"),
                          child: Obx(
                            () => TimeWidget(
                              color:
                                  controller.selectedDinner.value == "01:00 pm"
                                      ? orange
                                      : Colors.white,
                              textColor:
                                  controller.selectedDinner.value == "01:00 pm"
                                      ? Colors.white
                                      : Colors.black,
                              title: "01:00 pm",
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => controller.selectDinner("02:00 pm"),
                          child: Obx(
                            () => TimeWidget(
                              color:
                                  controller.selectedDinner.value == "02:00 pm"
                                      ? orange
                                      : Colors.white,
                              textColor:
                                  controller.selectedDinner.value == "02:00 pm"
                                      ? Colors.white
                                      : Colors.black,
                              title: "02:00 pm",
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
                  color: orange,
                  onPressed: () {
                    Get.to(() => const ReservationTable());
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
