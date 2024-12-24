import 'package:flutter/material.dart';

class AboutPageDescription extends StatelessWidget {
  final String restaurantType;
  final String location;
  final String operationalHours;
  final String sitting;
  final String reservationPolicy;

  const AboutPageDescription({
    super.key,
    required this.restaurantType,
    required this.location,
    required this.operationalHours,
    required this.sitting,
    required this.reservationPolicy,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow("Restaurant Type:", restaurantType),
        _buildInfoRow("Location:", location),
        _buildInfoRow("Operational Hours:", operationalHours),
        _buildInfoRow("Sitting:", sitting),
        _buildInfoRow("Reservation Policy:", reservationPolicy),
      ],
    );
  }

  Widget _buildInfoRow(String title, String value) {
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
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
