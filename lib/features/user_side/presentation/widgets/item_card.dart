import 'package:dine_deal/features/user_side/presentation/getX/controller/quantity_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemCard extends StatelessWidget {
  ItemCard({super.key});

  final QuantityController controller = Get.find<QuantityController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            // Image Section
            Image.asset(
              "assets/noodles.png", // Replace with your asset path
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 15),

            // Text Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Noodles",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Dough, Sauce, Toppings",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Pkr 389",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange, // Use AppColors.orange if defined
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),

            // Quantity Selector
            Row(
              children: [
                IconButton(
                  onPressed: controller.decrement, // Call decrement function
                  icon: const Icon(Icons.remove),
                  color: Colors.grey,
                ),
                Obx(() {
                  return Text(
                    controller.quantity.toString(), // Reactive quantity
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  );
                }),
                IconButton(
                  onPressed: controller.increment, // Call increment function
                  icon: const Icon(Icons.add),
                  color: Colors.orange, // Use AppColors.orange if defined
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
