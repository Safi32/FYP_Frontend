import 'package:flutter/material.dart';
import 'package:dine/widgets/sidebar_menu.dart';
import 'package:dine/widgets/top_navbar.dart';

class RestaurantDetailScreen extends StatefulWidget {
  @override
  _RestaurantDetailScreenState createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  bool showReviews = false; // Toggle for Reviews Tab
  bool isHoveringRemove = false; // Hover state for Remove button
  bool isHoveringReview = false; // Hover state for Review button

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: Row(
        children: [
          // Sidebar
          SidebarMenu(activeItem: 'Restaurants'),

          // Main Content
          Expanded(
            child: Column(
              children: [
                // Top Navbar
                TopNavbar(avatarPath: 'assets/admin_avatar.png'),

                // Add margin below Top Navbar
                SizedBox(height: 10),

                // Header Section with Back Arrow
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 201, 74, 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (showReviews) {
                            setState(() {
                              showReviews = false;
                            });
                          } else {
                            Navigator.pop(context);
                          }
                        },
                        child: Icon(Icons.arrow_back, color: Colors.white, size: 24),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Marriott Hotel Islamabad",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Registration date: 17/10/2024 at 11:30am",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow, size: 20),
                                SizedBox(width: 5),
                                Text(
                                  "4.9 | 49 Reviews",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Main Content with Scroll
                Expanded(
                  child: showReviews
                      ? _buildReviewsTab()
                      : SingleChildScrollView(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Left Section: Restaurant Information
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Restaurant Information
                                    _sectionTitle("Restaurant Information"),
                                    _infoRow("Name", "Marriott Hotel Islamabad"),
                                    _infoRow("Email", "MarriottHotel@gmail.com"),
                                    _infoRow("Contact", "+92 305 5533 069"),
                                    SizedBox(height: 20),

                                    // Restaurant Address
                                    _sectionTitle("Restaurant Address"),
                                    _infoRow("Street", "Marriott Hotel Islamabad"),
                                    _infoRow("City", "Islamabad"),
                                    SizedBox(height: 20),

                                    // Social Media
                                    _sectionTitle("Social Media"),
                                    _infoRow("Facebook Link", "Marriott Hotel Islamabad"),
                                    _infoRow("Instagram Link", "Marriott Hotel Islamabad"),
                                    _infoRow("Twitter Link", "Marriott Hotel Islamabad"),
                                    SizedBox(height: 20),

                                    // Restaurant Type
                                    _sectionTitle("Restaurant Type"),
                                    _infoRow("Food Offering", "Brunch, Fast Food"),
                                    SizedBox(height: 20),

                                    // Operational Details
                                    _sectionTitle("Operational Details"),
                                    _infoRow("Opening Time", "09:00 am"),
                                    _infoRow("Closing Time", "03:00 am"),
                                    _infoRow("Minimum Price", "PKR 500"),
                                    _infoRow("Maximum Price", "PKR 10,000"),
                                    SizedBox(height: 20),

                                    // Restaurant Sitting Area
                                    _sectionTitle("Restaurant Sitting Area"),
                                    _infoRow("Sitting Area", "Inside, Terrace, Roof, Lawn, Family Hall"),
                                    SizedBox(height: 20),

                                    // Reservation Policy
                                    _sectionTitle("Reservation Policy"),
                                    _infoRow("Accept Reservation", "Yes"),
                                    SizedBox(height: 20),

                                    // Additional Features
                                    _sectionTitle("Restaurant Additional Features"),
                                    _infoRow("Features", "Place for Prayer, Parking, Free WiFi, Rest Room"),
                                    SizedBox(height: 20),
                                  ],
                                ),
                              ),

                              SizedBox(width: 20),

                              // Right Section: Restaurant Images
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _sectionTitle("Restaurant Images"),
                                    SizedBox(height: 10),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        "assets/food1.jpg",
                                        height: 150,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image.asset(
                                              "assets/food2.jpg",
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image.asset(
                                              "assets/food3.jpg",
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        "assets/restaurant1.webp",
                                        height: 150,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                ),

                // Bottom Buttons
                if (!showReviews)
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onHover: (hovering) {
                            setState(() {
                              isHoveringRemove = hovering;
                            });
                          },
                          onTap: () {
                            // Remove Registration logic
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isHoveringRemove
                                  ? Colors.white
                                  : const Color.fromARGB(255, 201, 74, 1),
                              border: Border.all(
                                color: const Color.fromARGB(255, 201, 74, 1),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 30),
                            child: Text(
                              "Remove Registration",
                              style: TextStyle(
                                fontSize: 16,
                                color: isHoveringRemove
                                    ? const Color.fromARGB(255, 201, 74, 1)
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        InkWell(
                          onHover: (hovering) {
                            setState(() {
                              isHoveringReview = hovering;
                            });
                          },
                          onTap: () {
                            setState(() {
                              showReviews = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isHoveringReview
                                  ? Colors.white
                                  : const Color.fromARGB(255, 201, 74, 1),
                              border: Border.all(
                                color: const Color.fromARGB(255, 201, 74, 1),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 30),
                            child: Text(
                              "Check Review",
                              style: TextStyle(
                                fontSize: 16,
                                color: isHoveringReview
                                    ? const Color.fromARGB(255, 201, 74, 1)
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: const Color.fromARGB(255, 201, 74, 1),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewsTab() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Total Reviews 49",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          _buildReviewItem("Ali", "Great experience!", false),
          _buildReviewItem("Kamran shah", "Amazing service!", true, "Thanks!"),
          _buildReviewItem("Ali", "Highly recommend!", false),
        ],
      ),
    );
  }

  Widget _buildReviewItem(String name, String review, bool hasReply,
      [String? reply]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.person, color: Colors.white),
              ),
              SizedBox(width: 10),
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            review,
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          if (hasReply) ...[
            SizedBox(height: 10),
            Text(
              "Reply",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 5),
            Text(
              reply!,
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
          Divider(color: Colors.grey[300]),
        ],
      ),
    );
  }
}
