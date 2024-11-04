import 'package:flutter/material.dart';

class CardWidgets extends StatelessWidget {
  const CardWidgets({
    super.key,
    required this.imageURL,
    required this.title,
    required this.icon,
    required this.color,
    this.showIcon = true,
  });

  final String imageURL;
  final String title;
  final IconData icon;
  final Color color;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(
            imageURL,
          ),
        ),
        const SizedBox(width: 20),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: color,
          ),
        ),
        const Spacer(),
        if (showIcon)
          Icon(
            icon,
            color: color,
          ),
      ],
    );
  }
}
