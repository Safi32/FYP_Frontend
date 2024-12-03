import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/admin_side/widgets/update_area.dart';
import 'package:flutter/material.dart';

class AddArea extends StatelessWidget {
  const AddArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new_sharp,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Add Area",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 10,
                    decoration: const BoxDecoration(
                      color: AppColors.orange,
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    "Add Another Place.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: TabBar(
                              indicatorColor: AppColors.orange,
                              labelColor: AppColors.orange,
                              unselectedLabelColor: Colors.grey,
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              tabs: [
                                Tab(text: "First Floor"),
                                Tab(text: "Terrace"),
                                Tab(text: "Roof"),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 30,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: AppColors.orange,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            UpdateArea(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
