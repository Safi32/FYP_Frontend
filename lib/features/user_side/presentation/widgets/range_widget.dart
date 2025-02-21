// import 'package:flutter/material.dart';

// class RangeWidget extends StatelessWidget {
//   const RangeWidget({super.key, required this.title});

//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 50,
//       width: 180,
//       child: TextFormField(
//         decoration: InputDecoration(
//           hintText: title,
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           errorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(
//                 color: Colors.red,
//               )),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class RangeWidget extends StatelessWidget {
  final String title;
  final TextEditingController controller;

  const RangeWidget({super.key, required this.title, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 180,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: title,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
