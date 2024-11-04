import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  bool isRestaurantSelected = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Favourite",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isRestaurantSelected = true;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            "Restaurant",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: isRestaurantSelected
                                  ? Colors.orange
                                  : Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            height: 2,
                            width: 80,
                            color: isRestaurantSelected
                                ? Colors.orange
                                : Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isRestaurantSelected = false;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            "Deals",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: isRestaurantSelected
                                  ? Colors.grey
                                  : Colors.orange,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            height: 2,
                            width: 80,
                            color: !isRestaurantSelected
                                ? Colors.orange
                                : Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(
                        isRestaurantSelected
                            ? "assets/fav_table.png"
                            : "assets/fav_table 2.png",
                      ),
                      height: 150,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      isRestaurantSelected
                          ? "No Restaurant in favourite"
                          : "No Deals in favourite",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
