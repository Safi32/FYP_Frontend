import 'package:dine_deal/utils/colors.dart';
import 'package:dine_deal/view/user_side/reservation_time.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:dine_deal/widgets/date_time_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReservationDate extends StatelessWidget {
  const ReservationDate({super.key});

  @override
  Widget build(BuildContext context) {
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
                      btnColor: orange,
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
              const Spacer(),
              SizedBox(
                width: Get.width * 0.45,
                child: Button(
                  title: "Next",
                  color: orange,
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
