import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/deals_description.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/range_widget.dart';
import 'package:dine_deal/features/user_side/presentation/widgets/restaurant_type.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            child: Column(
              children: [
                Row(
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
                          "Refine Your Search",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  children: [
                    Text(
                      "Location",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "I-14 Islamabad",
                    prefixIcon: const Image(
                      image: AssetImage(
                        "assets/location.png",
                      ),
                    ),
                    suffixIcon: const Icon(
                      Icons.arrow_drop_down,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  children: [
                    Text(
                      "Price Range",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RangeWidget(
                      title: "Maximum",
                    ),
                    RangeWidget(
                      title: "Minimum",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Text(
                      "Restaurant Type",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    RestaurantTypeCheckBox(
                      title: "Vegan",
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    RestaurantTypeCheckBox(
                      title: "Flexitarian",
                    ),
                  ],
                ),
                const Row(
                  children: [
                    RestaurantTypeCheckBox(
                      title: "Vegetarian",
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    RestaurantTypeCheckBox(
                      title: "Desert",
                    ),
                  ],
                ),
                const Row(
                  children: [
                    RestaurantTypeCheckBox(
                      title: "Fast Food",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Text(
                      "Deals",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DealsDescription(
                      text: "All",
                    ),
                    DealsDescription(
                      text: "Two Persons Deal",
                    ),
                    DealsDescription(
                      text: "Three Persons Deal",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    DealsDescription(
                      text: "Four Persons Deal",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    DealsDescription(
                      text: "Family Deal",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Text(
                      "Restaurant Area",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    RestaurantTypeCheckBox(
                      title: "Basement",
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    RestaurantTypeCheckBox(
                      title: "Ground Floor",
                    ),
                  ],
                ),
                const Row(
                  children: [
                    RestaurantTypeCheckBox(
                      title: "Roof",
                    ),
                    SizedBox(
                      width: 90,
                    ),
                    RestaurantTypeCheckBox(
                      title: "Terrace",
                    ),
                  ],
                ),
                const Row(
                  children: [
                    RestaurantTypeCheckBox(
                      title: "Lawn",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Text(
                      "Rating",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                Slider(
                  value: _sliderValue,
                  min: 0.0,
                  max: 5,
                  divisions: 100,
                  label: _sliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                  activeColor: AppColors.orange,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Text(
                      "Additioanl Features",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    RestaurantTypeCheckBox(
                      title: "Basement",
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    RestaurantTypeCheckBox(
                      title: "Ground Floor",
                    ),
                  ],
                ),
                const Row(
                  children: [
                    RestaurantTypeCheckBox(
                      title: "Roof",
                    ),
                    SizedBox(
                      width: 90,
                    ),
                    RestaurantTypeCheckBox(
                      title: "Terrace",
                    ),
                  ],
                ),
                const Row(
                  children: [
                    RestaurantTypeCheckBox(
                      title: "Lawn",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: Get.width * 0.3,
                      height: Get.height * 0.06,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(
                            color: Colors.grey,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () => Get.back(),
                        child: const Text(
                          "Reset All",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: Get.width * 0.3,
                      child: Button(
                        title: "Apply",
                        color: AppColors.orange,
                        onPressed: () {},
                        textColor: AppColors.surface,
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
