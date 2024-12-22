import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class TimeSelection extends StatelessWidget {
  final List<String> times;
  final ValueNotifier<int?> selectedTimeIndex = ValueNotifier<int?>(null);

  TimeSelection({
    Key? key,
    required this.times,
    required Null Function(dynamic time) onTimeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int?>(
      valueListenable: selectedTimeIndex,
      builder: (context, selectedIndex, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: times.asMap().entries.map((entry) {
            int index = entry.key;
            String time = entry.value;

            bool isSelected = selectedIndex == index;

            return GestureDetector(
              onTap: () {
                selectedTimeIndex.value = index;
              },
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected ? AppColors.orange : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  time,
                  style: TextStyle(
                    color: isSelected ? AppColors.orange : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
