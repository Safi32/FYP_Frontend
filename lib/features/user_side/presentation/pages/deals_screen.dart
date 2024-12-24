import 'package:dine_deal/features/user_side/presentation/getX/controller/get_deals_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DealsScreen extends StatelessWidget {
  final GetDealsController dealsController = Get.put(GetDealsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Deals"),
      ),
      body: Obx(() {
        if (dealsController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (dealsController.dealsList.isEmpty) {
          return const Center(
            child: Text(
              "No Deals Available",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          );
        }

        return ListView.builder(
          itemCount: dealsController.dealsList.length,
          itemBuilder: (context, index) {
            final deal = dealsController.dealsList[index];
            return ListTile(
              title: Text(deal["deal_name"] ?? "Unnamed Deal"),
              subtitle: Text(deal["deal_details"] ?? "No Details"),
              leading: Image.network(
                deal["image"] ?? "",
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
              ),
            );
          },
        );
      }),
    );
  }
}
