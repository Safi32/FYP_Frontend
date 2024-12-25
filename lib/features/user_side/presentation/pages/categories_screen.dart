import 'package:dine_deal/features/user_side/presentation/getX/controller/get_type_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final GetCategoriesController categoriesController =
      Get.find<GetCategoriesController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("All Categories"),
        ),
        body: Obx(() {
          if (categoriesController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (categoriesController.categoriesList.isEmpty) {
            return const Center(
              child: Text(
                "No Categories Available",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            );
          }

          return ListView.builder(
            itemCount: categoriesController.categoriesList.length,
            itemBuilder: (context, index) {
              final category = categoriesController.categoriesList[index];

              return ListTile(
                title: Text(
                  category,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
