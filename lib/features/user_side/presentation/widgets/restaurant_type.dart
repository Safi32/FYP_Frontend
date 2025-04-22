// import 'package:flutter/material.dart';

// class RestaurantTypeCheckBox extends StatefulWidget {
//   const RestaurantTypeCheckBox({super.key, required this.title});

//   final String title;

//   @override
//   _CheckBoxWithTextState createState() => _CheckBoxWithTextState();
// }

// class _CheckBoxWithTextState extends State<RestaurantTypeCheckBox> {
//   bool isChecked = false;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Checkbox(
//           value: isChecked,
//           onChanged: (bool? value) {
//             setState(() {
//               isChecked = value ?? false;
//             });
//           },
//         ),
//         Text(
//           widget.title,
//           style: const TextStyle(fontSize: 16.0),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';

class RestaurantTypeCheckBox extends StatefulWidget {
  final String title;
  final ValueChanged<bool> onChanged; // Callback function to update state

  const RestaurantTypeCheckBox({
    super.key,
    required this.title,
    required this.onChanged,
  });

  @override
  _RestaurantTypeCheckBoxState createState() => _RestaurantTypeCheckBoxState();
}

class _RestaurantTypeCheckBoxState extends State<RestaurantTypeCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value ?? false;
            });
            widget.onChanged(isChecked); // Update parent widget
          },
        ),
        Expanded(
          child: Text(
            widget.title,
            style: const TextStyle(fontSize: 16.0),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
