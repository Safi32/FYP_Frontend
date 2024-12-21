import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class TableSelection extends StatelessWidget {
  final List<String> tableTypes;
  final ValueNotifier<int?> selectedTableIndex = ValueNotifier<int?>(null);

  TableSelection({
    Key? key,
    required this.tableTypes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int?>(
      valueListenable: selectedTableIndex,
      builder: (context, selectedIndex, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: tableTypes.asMap().entries.map((entry) {
            int index = entry.key;
            String type = entry.value;

            bool isSelected = selectedIndex == index;

            return GestureDetector(
              onTap: () {
                selectedTableIndex.value = index;
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
                  type,
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
