import 'package:flutter/material.dart';

class DateContainer extends StatelessWidget {
  final String dateText;
  final VoidCallback onCalendarTap;

  const DateContainer({
    Key? key,
    required this.dateText,
    required this.onCalendarTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 150,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            dateText,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          GestureDetector(
            onTap: onCalendarTap,
            child: const Icon(
              Icons.calendar_today_outlined,
              size: 20,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
