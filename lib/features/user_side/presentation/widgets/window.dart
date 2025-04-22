import 'package:flutter/material.dart';

class Window extends StatelessWidget {
  const Window({
    super.key,
    required this.image,
    required this.onPressed,
    required this.tableNumber,
  });

  final String image;
  final VoidCallback onPressed;
  final String tableNumber; // New parameter for table number

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              GestureDetector(
                onTap: onPressed,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                child: Text(
                  tableNumber,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
