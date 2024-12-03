import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/presentation/getX/controller/tab_controller.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/date_time_table.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReservationTable extends StatelessWidget {
  const ReservationTable({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomTabController controller = Get.put(CustomTabController());
    return SafeArea(
      child: DefaultTabController(
        length: 3,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        title: "Person",
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
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TabBar(
                    indicatorColor: AppColors.orange,
                    labelColor: AppColors.orange,
                    unselectedLabelColor: Colors.grey,
                    labelStyle: TextStyle(fontSize: 16),
                    tabs: [
                      Tab(text: "First Floor"),
                      Tab(text: "Terrace"),
                      Tab(text: "Roof"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/01.png",
                                height: 100,
                                width: 80,
                              ),
                              Image.asset(
                                "assets/04.png",
                                height: 100,
                                width: 80,
                              ),
                              Image.asset(
                                "assets/09.png",
                                height: 100,
                                width: 80,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/06.png",
                                height: 100,
                                width: 80,
                              ),
                              Image.asset(
                                "assets/11.png",
                                height: 100,
                                width: 80,
                              ),
                              Image.asset(
                                "assets/07.png",
                                height: 100,
                                width: 80,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/11.png",
                                height: 100,
                                width: 80,
                              ),
                              Image.asset(
                                "assets/04.png",
                                height: 100,
                                width: 80,
                              ),
                              Image.asset(
                                "assets/12.png",
                                height: 100,
                                width: 80,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: AppColors.black, width: 2),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: RotatedBox(
                                quarterTurns: 1,
                                child: Text(
                                  "Window",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 100,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: AppColors.black, width: 2),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: RotatedBox(
                                quarterTurns: 1,
                                child: Text(
                                  "Window",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: Get.width * 0.5,
                      child: Button(
                        title: "Reserve",
                        color: AppColors.orange,
                        onPressed: () {},
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
