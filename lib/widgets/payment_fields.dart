import 'package:flutter/material.dart';

class PaymentFields extends StatelessWidget {
  final bool showDropdown; // Determines whether to show the dropdown or not
  final String labelText;
  final String title;
  final bool showCardImage; // Determines whether to show the card image

  const PaymentFields({
    super.key,
    this.showDropdown = true,
    this.showCardImage = false, // Default is not to show the card image
    required this.labelText,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 10),
          showDropdown
              ? DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  hint: Text(
                    title,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey,
                  ),
                  isExpanded: true,
                  items: [
                    "Credit Card",
                    "Debit Card",
                    "PayPal",
                    "Bank Transfer"
                  ].map((String method) {
                    return DropdownMenuItem<String>(
                      value: method,
                      child: Text(method),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    print("Selected payment method: $newValue");
                  },
                )
              : TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: title,
                    hintStyle: const TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: showCardImage
                        ? Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  'assets/card 1.png',
                                  height: 24,
                                  width: 24,
                                ),
                                Image.asset(
                                  'assets/card 2.png',
                                  height: 24,
                                  width: 24,
                                ),
                              ],
                            ),
                          )
                        : null,
                  ),
                ),
        ],
      ),
    );
  }
}
