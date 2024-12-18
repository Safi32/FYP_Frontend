// import 'package:dine_deal/models/get_restaurant_data_model.dart';
// import 'package:flutter/material.dart';

// class AboutPageDescription extends StatelessWidget {
//   const AboutPageDescription({super.key, required this.restaurant});

//   final Restaurant restaurant;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text(
//           restaurant.restaurantType,
//           style: const TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         Text(
//           restaurant,
//           style: const TextStyle(
//             color: Colors.grey,
//             fontSize: 13,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:dine_deal/models/get_restaurant_data_model.dart';
import 'package:flutter/material.dart';

class AboutPageDescription extends StatelessWidget {
  const AboutPageDescription({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow("Restaurant Type", restaurant.restaurantType),
        _buildInfoRow("Location", restaurant.restaurantAddress),
        _buildInfoRow("Operational Hours", restaurant.operationalHours),
        _buildInfoRow("Sitting", restaurant.restaurantInfo.join(",")),
        _buildInfoRow("Reservation Policy", restaurant.acceptReservation),
      ],
    );
  }

  /// Helper Method to Display Title and Value
  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title (e.g., "Restaurant Type")
          SizedBox(
            width: 150, // Fixed width for titles
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Value (e.g., "Fast Food")
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
