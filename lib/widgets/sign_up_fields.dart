import 'package:flutter/material.dart';

import '../utils/colors.dart';

class SignUpFields extends StatelessWidget {
  const SignUpFields({
    super.key,
    this.hintText,
    this.tag,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    required this.controller,
  });

  final fontName = 'NunitoSans';
  final String? hintText;
  final String? tag;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (tag != null)
          Text(
            tag!,
            style: TextStyle(
              fontFamily: fontName,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: black,
            ),
          ),
        if (tag != null)
          const SizedBox(
            height: 10,
          ),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType ?? TextInputType.text,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey, fontFamily: fontName),
            suffixIcon: suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.4),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.4),
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
