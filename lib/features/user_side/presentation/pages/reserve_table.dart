import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/reservation_controller.dart';
import 'package:dine_deal/features/user_side/presentation/pages/restaurant_name.dart';
import 'package:dine_deal/features/user_side/presentation/pages/review_information.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/window.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReserveTable extends StatelessWidget {
  final ValueNotifier<int> personCount = ValueNotifier<int>(1);
  final ValueNotifier<String> selectedDate = ValueNotifier<String>(
    DateTime.now().toIso8601String().split('T')[0],
  );
  final ValueNotifier<String> selectedTime = ValueNotifier<String>("");
  final ValueNotifier<String> selectedTable = ValueNotifier<String>("");
  final ValueNotifier<String> restaurantName = ValueNotifier<String>(
    "",
  );

  final List<String> timeSlots = ["12:00", "13:30", "14:00", "15:30"];

  ReserveTable({super.key});

  void _incrementPerson() {
    personCount.value++;
  }

  void _decrementPerson() {
    if (personCount.value > 1) {
      personCount.value--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  const Image(
                    image: AssetImage("assets/tick.png"),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new_sharp,
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "Reservation",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Restaurant",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const RestaurantName(),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Person",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: 35,
                              width: MediaQuery.of(context).size.width * 0.3,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: _decrementPerson,
                                    child: const Icon(
                                      Icons.remove,
                                      color: AppColors.orange,
                                    ),
                                  ),
                                  ValueListenableBuilder<int>(
                                    valueListenable: personCount,
                                    builder: (context, count, child) {
                                      return Text(
                                        '$count',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      );
                                    },
                                  ),
                                  GestureDetector(
                                    onTap: _incrementPerson,
                                    child: const Icon(
                                      Icons.add,
                                      color: AppColors.orange,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Date",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2030),
                                ).then((pickedDate) {
                                  if (pickedDate != null) {
                                    selectedDate.value = pickedDate
                                        .toIso8601String()
                                        .split('T')[0];
                                  }
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: ValueListenableBuilder<String>(
                                  valueListenable: selectedDate,
                                  builder: (context, date, child) {
                                    return Text(
                                      date,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Time",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Add Manually",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: AppColors.orange,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: ValueListenableBuilder<String>(
                            valueListenable: selectedTime,
                            builder: (context, time, child) {
                              return Row(
                                children: timeSlots.map((t) {
                                  return GestureDetector(
                                    onTap: () {
                                      selectedTime.value = t;
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                        horizontal: 20,
                                      ),
                                      decoration: BoxDecoration(
                                        color: selectedTime.value == t
                                            ? AppColors.orange
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: selectedTime.value == t
                                              ? AppColors.orange
                                              : Colors.grey,
                                          width: 2,
                                        ),
                                      ),
                                      child: Text(
                                        t,
                                        style: TextStyle(
                                          color: selectedTime.value == t
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Select Table",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: Get.height * 0.55,
                          width: Get.width,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Any Where",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      "First Floor",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      "Terrace",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      "Roof",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                thickness: 1.0,
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 10,
                                          width: 10,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade400,
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Available",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.grey.shade400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 10,
                                          width: 10,
                                          decoration: BoxDecoration(
                                            color: AppColors.orange,
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          "Selected",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: AppColors.orange,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 10,
                                          width: 10,
                                          decoration: BoxDecoration(
                                            color: Colors.yellow,
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        const Text(
                                          "Reserved",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.yellow,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Window(
                                            image: "assets/table_number_01.png",
                                            tableNumber: "1",
                                            onPressed: () {
                                              final reservationsController =
                                                  Get.put(
                                                      ReservationsController());
                                              reservationsController
                                                  .selectedTable.value = "1";
                                            },
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Window(
                                            image: "assets/table_number_02.png",
                                            tableNumber: "2",
                                            onPressed: () {
                                              final reservationsController =
                                                  Get.put(
                                                      ReservationsController());
                                              reservationsController
                                                  .selectedTable.value = "2";
                                            },
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Window(
                                            image: "assets/table_number_03.png",
                                            tableNumber: "3",
                                            onPressed: () {
                                              final reservationsController =
                                                  Get.put(
                                                      ReservationsController());
                                              reservationsController
                                                  .selectedTable.value = "3";
                                            },
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Window(
                                            image: "assets/table_number_04.png",
                                            tableNumber: "4",
                                            onPressed: () {
                                              final reservationsController =
                                                  Get.put(
                                                      ReservationsController());
                                              reservationsController
                                                  .selectedTable.value = "4";
                                            },
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Window(
                                            image: "assets/table_number_05.png",
                                            tableNumber: "5",
                                            onPressed: () {
                                              final reservationsController =
                                                  Get.put(
                                                      ReservationsController());
                                              reservationsController
                                                  .selectedTable.value = "5";
                                            },
                                          ),
                                          const SizedBox(
                                            width: 40,
                                          ),
                                          Window(
                                            image: "assets/table_number_06.png",
                                            tableNumber: "6",
                                            onPressed: () {
                                              final reservationsController =
                                                  Get.put(
                                                      ReservationsController());
                                              reservationsController
                                                  .selectedTable.value = "6";
                                            },
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Window(
                                            image: "assets/table_number_07.png",
                                            tableNumber: "7",
                                            onPressed: () {
                                              final reservationsController =
                                                  Get.put(
                                                      ReservationsController());
                                              reservationsController
                                                  .selectedTable.value = "7";
                                            },
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Window(
                                            image: "assets/table_number_08.png",
                                            tableNumber: "8",
                                            onPressed: () {
                                              final reservationsController =
                                                  Get.put(
                                                      ReservationsController());
                                              reservationsController
                                                  .selectedTable.value = "8";
                                            },
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Window(
                                            image: "assets/table_number_09.png",
                                            tableNumber: "9",
                                            onPressed: () {
                                              final reservationsController =
                                                  Get.put(
                                                      ReservationsController());
                                              reservationsController
                                                  .selectedTable.value = "9";
                                            },
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Window(
                                            image: "assets/table_number_10.png",
                                            tableNumber: "10",
                                            onPressed: () {
                                              final reservationsController =
                                                  Get.put(
                                                      ReservationsController());
                                              reservationsController
                                                  .selectedTable.value = "10";
                                            },
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Window(
                                            image: "assets/table_number_11.png",
                                            tableNumber: "11",
                                            onPressed: () {
                                              final reservationsController =
                                                  Get.put(
                                                      ReservationsController());
                                              reservationsController
                                                  .selectedTable.value = "11";
                                            },
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Window(
                                            image: "assets/table_number_12.png",
                                            tableNumber: "12",
                                            onPressed: () {
                                              final reservationsController =
                                                  Get.put(
                                                      ReservationsController());
                                              reservationsController
                                                  .selectedTable.value = "12";
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height: 110,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: const Center(
                                          child: RotatedBox(
                                            quarterTurns: 9,
                                            child: Text(
                                              "Window",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      Container(
                                        height: 110,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: const Center(
                                          child: RotatedBox(
                                            quarterTurns: 9,
                                            child: Text(
                                              "Window",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Button(
                      title: "Reserve This Table",
                      color: AppColors.orange,
                      onPressed: () {
                        final reservationsController =
                            Get.put(ReservationsController());

                        if (reservationsController
                            .selectedTable.value.isEmpty) {
                          Get.snackbar(
                            "No Table Selected",
                            "Please select a table before proceeding.",
                            snackPosition: SnackPosition.TOP,
                            duration: const Duration(seconds: 2),
                          );
                        } else {
                          Get.snackbar(
                            "Reservation Confirmed",
                            "Table ${reservationsController.selectedTable.value} has been reserved.",
                            snackPosition: SnackPosition.TOP,
                            duration: const Duration(seconds: 2),
                          );
                          Get.to(
                            () => ReviewInformation(
                              restaurantName: selectedRestaurantName.value,
                              personCount: personCount.value,
                              selectedDate: selectedDate.value,
                              selectedTime: selectedTime.value,
                              selectedTable:
                                  reservationsController.selectedTable.value,
                            ),
                          );
                        }
                      },
                      textColor: AppColors.surface,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
