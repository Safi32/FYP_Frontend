import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/admin_side/presentation/getX/controller/list_restaurant_controller.dart';
import 'package:dine_deal/features/admin_side/presentation/pages/manage_restaurant/add_additional_features.dart';
import 'package:dine_deal/features/admin_side/widgets/floor_table.dart';
import 'package:dine_deal/features/admin_side/widgets/post_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddSitting extends StatefulWidget {
  const AddSitting({super.key});

  @override
  _AddSittingState createState() => _AddSittingState();
}

class _AddSittingState extends State<AddSitting>
    with SingleTickerProviderStateMixin {
  final ListRestaurantController controller =
      Get.put(ListRestaurantController());
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new_sharp,
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Add Sitting",
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
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
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
                    "Arrange tables according to restaurant.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TabBar(
              controller: _tabController,
              labelColor: AppColors.orange,
              unselectedLabelColor: Colors.grey,
              indicatorColor: AppColors.orange,
              indicatorWeight: 3.0,
              tabs: const [
                Tab(
                  text: "First Floor",
                ),
                Tab(
                  text: "Terrace",
                ),
                Tab(
                  text: "Roof",
                ),
                Tab(
                  icon: Icon(
                    Icons.add,
                    color: AppColors.orange,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  FloorTable(),
                  Center(child: Text("Terrace Tab Content")),
                  Center(child: Text("Roof Tab Content")),
                ],
              ),
            ),
            const SizedBox(height: 20),
            PostButton(
              onPressed: () {
                Get.to(() => AddAdditionalFeatures());
              },
              title: "Update",
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
