import 'package:dine_deal/utils/colors.dart';
import 'package:dine_deal/view/admin_side/reserveration_policies.dart';
import 'package:dine_deal/widgets/button.dart';
import 'package:dine_deal/widgets/restaurant_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurantInformation extends StatelessWidget {
  const RestaurantInformation({super.key});

  final String fontName = "NunitoSans";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: orange,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.white,
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Apply for Partnership",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          child: Text(
                            "Restaurant Information",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        children: const [
                          Text(
                            "Area",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      child: Column(
                        children: const [
                          RestaurantCheckbox(
                            title: "Basement",
                          ),
                          RestaurantCheckbox(
                            title: "Ground Floor",
                          ),
                          RestaurantCheckbox(
                            title: "First Floor",
                          ),
                          RestaurantCheckbox(
                            title: "Second Floor",
                          ),
                          RestaurantCheckbox(
                            title: "Terrace",
                          ),
                          RestaurantCheckbox(
                            title: "Roof",
                          ),
                        ],
                      ),
                    ),
                    // New container added here
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: Get.height * 0.08,
                            width: Get.width * 0.5,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: background,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                )),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image(
                                    image: AssetImage(
                                      "assets/media.png",
                                    ),
                                  ),
                                  const Text(
                                    "Upload Media",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Button(
                        title: "Next",
                        color: orange,
                        onPressed: () {
                          Get.to(() => const ReserverationPolicies());
                        },
                        textColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Text.rich(
                        TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: fontName,
                            fontWeight: FontWeight.bold,
                            color: black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Login",
                              style: TextStyle(
                                fontFamily: fontName,
                                fontWeight: FontWeight.bold,
                                color: orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
