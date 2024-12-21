import 'package:flutter/material.dart';

class AboutPageDescription extends StatelessWidget {
  const AboutPageDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow("Restaurant Type"),
        _buildInfoRow("Location"),
        _buildInfoRow("Operational Hours"),
        _buildInfoRow("Sitting"),
        _buildInfoRow("Reservation Policy"),
      ],
    );
  }

  Widget _buildInfoRow(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Expanded(
          //   child: Text(
          //     value,
          //     style: const TextStyle(
          //       fontSize: 13,
          //       color: Colors.grey,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
