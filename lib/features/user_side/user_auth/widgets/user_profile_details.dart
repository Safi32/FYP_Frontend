import 'package:flutter/material.dart';

class UserProfileDetails extends StatelessWidget {
  const UserProfileDetails(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.onPressed});

  final String imageUrl;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          Image(
            image: AssetImage(
              imageUrl,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
