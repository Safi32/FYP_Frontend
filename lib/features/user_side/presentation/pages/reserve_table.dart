import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/presentation/pages/review_information.dart';
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
    "Marriot Hotel Islamabad",
  );

  final List<String> timeSlots = ["12:00", "13:30", "14:00", "15:30"];
  final List<String> seatingAreas = [
    "Inside",
    "Terrace",
    "Family",
    "Roof",
    "Lawn"
  ];

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
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: const Row(
                          children: [
                            SizedBox(width: 10),
                            Image(
                              image: AssetImage(
                                "assets/prefix.png",
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Marriot Hotel Islamabad",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "Agha Khan Rd, F-5/1 F-5, Islamabad",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
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
                                  firstDate: DateTime(2020),
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
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: ValueListenableBuilder<String>(
                            valueListenable: selectedTable,
                            builder: (context, table, child) {
                              return Row(
                                children: seatingAreas.map((area) {
                                  return GestureDetector(
                                    onTap: () {
                                      selectedTable.value = area;
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                        horizontal: 20,
                                      ),
                                      decoration: BoxDecoration(
                                        color: selectedTable.value == area
                                            ? AppColors.orange
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: selectedTable.value == area
                                              ? AppColors.orange
                                              : Colors.grey,
                                          width: 2,
                                        ),
                                      ),
                                      child: Text(
                                        area,
                                        style: TextStyle(
                                          color: selectedTable.value == area
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
                      ],
                    ),
                    const SizedBox(height: 15),
                    Button(
                      title: "Reserve This Table",
                      color: AppColors.orange,
                      onPressed: () {
                        print("Reservation Details:");
                        print("Restaurant Name: ${restaurantName.value}");
                        print("Person Count: ${personCount.value}");
                        print("Selected Date: ${selectedDate.value}");
                        print("Selected Time: ${selectedTime.value}");
                        print("Selected Table: ${selectedTable.value}");
                        Get.to(() => ReviewInformation(
                              restaurantName: restaurantName.value,
                              personCount: personCount.value,
                              selectedDate: selectedDate.value,
                              selectedTime: selectedTime.value,
                              selectedTable: selectedTable.value,
                            ));
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
