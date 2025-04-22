import 'package:flutter/material.dart';

class DrawerDetails extends StatelessWidget {
  const DrawerDetails(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.icon,
      required this.onPressed});

  final String imageUrl;
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(
              imageUrl,
            ),
          ),
          const SizedBox(width: 30),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          const Spacer(),
          Icon(
            icon,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
