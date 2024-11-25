import 'package:flutter/material.dart';

class Window extends StatelessWidget {
  const Window({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image(
            image: AssetImage(
              image,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
