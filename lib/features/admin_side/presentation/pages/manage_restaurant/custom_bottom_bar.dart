import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar(
      {super.key,
      required this.selectedIndex,
      required this.indexSelectionCallback});

  int selectedIndex;
  Function(int) indexSelectionCallback;

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  bool toggle = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => widget.indexSelectionCallback(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/home.png",
                      color: widget.selectedIndex == 0
                          ? const Color(0xFFC75E28)
                          : Colors.grey,
                      height: 22,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                        fontSize: 14,
                        color: widget.selectedIndex == 0
                            ? const Color(0xFFC75E28)
                            : Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 100,
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => widget.indexSelectionCallback(1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/Restaurant.png",
                      color: widget.selectedIndex == 1
                          ? const Color(0xFFC75E28)
                          : Colors.grey,
                      height: 22,
                    ),
                    Text(
                      "Restaurant",
                      style: TextStyle(
                        fontSize: 14,
                        color: widget.selectedIndex == 1
                            ? const Color(0xFFC75E28)
                            : Colors.grey,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: -15,
            child: SizedBox(
              width: 50,
              height: 50,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -15,
                    child: Transform.rotate(
                      angle: 40,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          setState(() {
                            toggle = !toggle;
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFFC75E28),
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (toggle)
                    Positioned(
                      top: -100,
                      left: -4,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/sitting.png',
                              height: 20,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Sitting",
                              style:
                                  TextStyle(fontSize: 10, color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ),
                  if (toggle)
                    Positioned(
                      top: -55,
                      left: -45,
                      child: Transform.rotate(
                        angle: -70,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/details.png',
                                  height: 20,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "Details",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.grey),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  if (toggle)
                    Positioned(
                      top: -60,
                      right: -40,
                      child: Transform.rotate(
                        angle: 51,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/features.png',
                                height: 20,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "Features",
                                style:
                                    TextStyle(fontSize: 10, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
