import 'package:flutter/material.dart';

class DetailNotesTextField extends StatelessWidget {
  final String hintText;
  final int maxLines;
  final int maxLength;

  const DetailNotesTextField({
    Key? key,
    this.hintText = "e.g proposal, anniversaries, birthdays, allergies...etc",
    this.maxLines = 4,
    this.maxLength = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Detail notes",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey),
            ),
            child: TextFormField(
              maxLines: maxLines,
              maxLength: maxLength,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                contentPadding: const EdgeInsets.all(10),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
