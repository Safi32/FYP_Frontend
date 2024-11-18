import 'package:dine_deal/controller/tab_controller.dart';
import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/widgets/date_time_table.dart';
import 'package:dine_deal/view/user_side/payment_screen.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReservationTable extends StatelessWidget {
  const ReservationTable({super.key});

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
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DateTimeTable(
                      title: "Date",
                      btnColor: Colors.white,
                      textColor: Colors.black,
                    ),
                    DateTimeTable(
                      title: "Time",
                      btnColor: Colors.white,
                      textColor: Colors.black,
                    ),
                    DateTimeTable(
                      title: "Table",
                      btnColor: AppColors.orange,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => controller.selectedHall("Basement"),
                      child: Obx(
                        () => Text(
                          "Basement",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: controller.selectedHall.value == "Basement"
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => controller.selectedHall("First Floor"),
                      child: Obx(() => Text(
                            "First Floor",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color:
                                  controller.selectedHall.value == "First Floor"
                                      ? Colors.black
                                      : Colors.grey,
                            ),
                          )),
                    ),
                    GestureDetector(
                      onTap: () => controller.selectedHall("Family Hall"),
                      child: Obx(() => Text(
                            "Family Hall",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color:
                                  controller.selectedHall.value == "Family Hall"
                                      ? Colors.black
                                      : Colors.grey,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: Get.width * 0.9,
                    child: Button(
                      title: "Make Payment",
                      color: AppColors.orange,
                      onPressed: () {
                        Get.to(
                          () => const PaymentScreen(),
                        );
                      },
                      textColor: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
