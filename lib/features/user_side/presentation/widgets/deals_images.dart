import 'package:flutter/material.dart';

class DealsImages extends StatelessWidget {
  const DealsImages(
      {super.key,
      required this.imageURL1,
      required this.imageURL2,
      required this.imageURL3});

  final String imageURL1;
  final String imageURL2;
  final String imageURL3;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Wrap(
            spacing: 10,
            children: [
              Image.asset(
                imageURL1,
              ),
              Image.asset(
                imageURL2,
              ),
              Image.asset(
                imageURL3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
