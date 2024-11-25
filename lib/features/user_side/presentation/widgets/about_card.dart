import 'package:flutter/material.dart';

class AboutCard extends StatelessWidget {
  const AboutCard({
    super.key,
    required this.heading,
    required this.subHeading,
  });

  final String heading;
  final String subHeading;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          heading,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subHeading,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
