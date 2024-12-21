import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StarRating extends StatelessWidget {
  final RxDouble selectedRating = 0.0.obs;
  final RxList<String> selectedReviewOptions = <String>[].obs;

  final List<String> reviewOptions = [
    "Good music",
    "Clean and neat",
    "Careful driving",
    "Nice car",
    "Polite driver",
    "Driver arrived quickly"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            children: List.generate(
              5,
              (index) => GestureDetector(
                onTapDown: (details) {
                  final position = details.localPosition.dx;
                  const starWidth = 30.0;

                  selectedRating.value =
                      position < starWidth / 2 ? index + 0.5 : index + 1.0;

                  _showReviewBottomSheet(context);
                },
                child: Obx(() {
                  return Stack(
                    children: [
                      Image.asset(
                        "assets/Star 8.png",
                        height: 30,
                        width: 30,
                        color: Colors.grey,
                      ),
                      ClipRect(
                        clipper: _StarClipper(
                          percentage: selectedRating.value > index
                              ? (selectedRating.value - index).clamp(0.0, 1.0)
                              : 0.0,
                        ),
                        child: Image.asset(
                          "assets/Star 8.png",
                          height: 30,
                          width: 30,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showReviewBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildBottomSheet(),
    );
  }

  Widget _buildBottomSheet() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final mediaQuery = MediaQuery.of(context);
        final bottomInset = mediaQuery.viewInsets.bottom;

        return AnimatedPadding(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          padding: EdgeInsets.only(bottom: bottomInset),
          child: DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.4,
            maxChildSize: 0.8,
            builder: (_, controller) {
              return Container(
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: controller,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 100,
                          height: 5,
                          decoration: BoxDecoration(
                            color: AppColors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Obx(() => Center(
                            child: Text(
                              _getReviewText(selectedRating.value),
                              style: const TextStyle(
                                color: AppColors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                      const SizedBox(height: 10),
                      Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              5,
                              (index) => Stack(
                                children: [
                                  Image.asset(
                                    "assets/Star 8.png",
                                    height: 30,
                                    width: 30,
                                    color: Colors.grey,
                                  ),
                                  ClipRect(
                                    clipper: _StarClipper(
                                      percentage: selectedRating.value > index
                                          ? (selectedRating.value - index)
                                              .clamp(0.0, 1.0)
                                          : 0.0,
                                    ),
                                    child: Image.asset(
                                      "assets/Star 8.png",
                                      height: 30,
                                      width: 30,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      const SizedBox(height: 20),
                      Obx(() => Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: reviewOptions.map((option) {
                              final isSelected =
                                  selectedReviewOptions.contains(option);
                              return GestureDetector(
                                onTap: () {
                                  if (isSelected) {
                                    selectedReviewOptions.remove(option);
                                  } else {
                                    selectedReviewOptions.add(option);
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? AppColors.orange
                                        : AppColors.surface,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    option,
                                    style: TextStyle(
                                      color: isSelected
                                          ? AppColors.surface
                                          : AppColors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          )),
                      const SizedBox(height: 20),
                      TextField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: "Write your review here...",
                          hintStyle: const TextStyle(color: AppColors.black),
                          filled: true,
                          fillColor: AppColors.surface,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: AppColors.orange,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: Get.width,
                        child: ElevatedButton(
                          onPressed: () {
                            print(
                                "Review submitted with rating: ${selectedRating.value}");
                            print(
                                "Selected review options: ${selectedReviewOptions.join(', ')}");
                            Get.back(); // Close the bottom sheet
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 15,
                            ),
                          ),
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                              color: AppColors.surface,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  String _getReviewText(double rating) {
    if (rating == 0.0) return "No Rating";
    if (rating <= 1.0) return "Poor";
    if (rating <= 2.0) return "Fair";
    if (rating <= 3.0) return "Good";
    if (rating <= 4.0) return "Very Good";
    return "Excellent";
  }
}

class _StarClipper extends CustomClipper<Rect> {
  final double percentage;

  _StarClipper({required this.percentage});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, size.width * percentage, size.height);
  }

  @override
  bool shouldReclip(_StarClipper oldClipper) {
    return oldClipper.percentage != percentage;
  }
}
