import 'package:dine/screens/restaurant_detail_screen.dart';
import 'package:dine/widgets/sidebar_menu.dart';
import 'package:dine/widgets/top_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurantScreen extends StatefulWidget {
  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  bool isHoveringSendEmail = false;

  bool showRegistered = true; // Toggle state
  bool showEmailConfirmation = false; // Email Confirmation state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

                // Restaurant Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!showEmailConfirmation) ...[
                          // Tab Buttons
                          Row(
                            children: [
                              _TabButton(
                                label: 'Registered Restaurant',
                                isActive: showRegistered,
                                onTap: () {
                                  setState(() {
                                    showRegistered = true;
                                    showEmailConfirmation = false;
                                  });
                                },
                              ),
                              SizedBox(width: 10),
                              _TabButton(
                                label: 'Restaurant Request',
                                isActive: !showRegistered,
                                onTap: () {
                                  setState(() {
                                    showRegistered = false;
                                    showEmailConfirmation = false;
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 20),

                          // Header Text
                          Text(
                            showRegistered
                                ? "Registered Restaurant (1000)"
                                : "Restaurant Registration Request",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),

                          // Restaurants Table
                          showRegistered
                              ? _buildRegisteredRestaurantTable()
                              : _buildRestaurantRequestTable(),
                        ] else ...[
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.arrow_back),
                                onPressed: () {
                                  setState(() {
                                    showEmailConfirmation = false;
                                  });
                                },
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Send Confirmation Email",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          _buildEmailConfirmationScreen("Marriott Hotel"),
                        ]
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white, // Set background color of the page to white
    );
  }

  Widget _TabButton({
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isActive ? const Color.fromARGB(255, 201, 74, 1) : Colors.grey[200],
        foregroundColor: isActive ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Text(label, style: TextStyle(fontSize: 14)),
      ),
    );
  }

  Widget _buildRegisteredRestaurantTable() {
    return Table(
      border: TableBorder(
          horizontalInside: BorderSide(width: 0.5, color: Colors.grey[300]!)),
      columnWidths: {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(3),
        2: FlexColumnWidth(3),
        3: FlexColumnWidth(4),
        4: FlexColumnWidth(2),
        5: FlexColumnWidth(2),
        6: FlexColumnWidth(2),
        7: FlexColumnWidth(3),
      },
      children: [
        _buildRegisteredTableHeader(),
        _buildRegisteredTableRow(1, "Marriott Hotel Islamabad", "+92 305 5533 069",
            "MarriottHotel@gmail.com", "5", "Islamabad"),
        _buildRegisteredTableRow(2, "Marriott Hotel Islamabad", "+92 305 5533 069",
            "MarriottHotel@gmail.com", "4.9", "Islamabad"),
        _buildRegisteredTableRow(3, "Marriott Hotel Islamabad", "+92 305 5533 069",
            "MarriottHotel@gmail.com", "4.8", "Islamabad"),
      ],
    );
  }

  Widget _buildRestaurantRequestTable() {
    return Table(
      border: TableBorder(
          horizontalInside: BorderSide(width: 0.5, color: Colors.grey[300]!)),
      columnWidths: {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(3),
        2: FlexColumnWidth(3),
        3: FlexColumnWidth(2),
        4: FlexColumnWidth(3),
        5: FlexColumnWidth(3),
      },
      children: [
        _buildRequestTableHeader(),
        _buildRequestTableRow(1, "Marriott Hotel Islamabad", "17/10/2024",
            "11:30 am"),
        _buildRequestTableRow(2, "Marriott Hotel Islamabad", "17/10/2024",
            "11:30 am"),
        _buildRequestTableRow(3, "Marriott Hotel Islamabad", "17/10/2024",
            "11:30 am"),
      ],
    );
  }

  TableRow _buildRegisteredTableHeader() {
    return TableRow(
      decoration: BoxDecoration(color: Colors.grey[200]),
      children: [
        _buildTableCell("S. No", isHeader: true),
        _buildTableCell("Restaurant Name", isHeader: true),
        _buildTableCell("Number", isHeader: true),
        _buildTableCell("Email", isHeader: true),
        _buildTableCell("Rating", isHeader: true),
        _buildTableCell("City", isHeader: true),
        _buildTableCell("", isHeader: true),
        _buildTableCell("Action Perform", isHeader: true),
      ],
    );
  }

  TableRow _buildRegisteredTableRow(
      int id, String name, String number, String email, String rating, String city) {
    return TableRow(
      children: [
        _buildTableCell(id.toString()),
        _buildTableCell(name),
        _buildTableCell(number),
        _buildTableCell(email),
        _buildTableCell(rating),
        _buildTableCell(city),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: GestureDetector(
            onTap: () {
              Get.to(() => RestaurantDetailScreen());
            },
            child: Text(
              "View More Info",
              style: TextStyle(
                color: Colors.orange,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: ElevatedButton(
            onPressed: () {
              // Handle Remove Logic
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Text("Remove"),
          ),
        ),
      ],
    );
  }

  TableRow _buildRequestTableHeader() {
    return TableRow(
      decoration: BoxDecoration(color: Colors.grey[200]),
      children: [
        _buildTableCell("S. No", isHeader: true),
        _buildTableCell("Restaurant Name", isHeader: true),
        _buildTableCell("Date", isHeader: true),
        _buildTableCell("Time", isHeader: true),
        _buildTableCell("", isHeader: true),
        _buildTableCell("Action Perform", isHeader: true),
      ],
    );
  }

  TableRow _buildRequestTableRow(
      int id, String name, String date, String time) {
    return TableRow(
      children: [
        _buildTableCell(id.toString()),
        _buildTableCell(name),
        _buildTableCell(date),
        _buildTableCell(time),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: GestureDetector(
            onTap: () {
              Get.to(() => RestaurantDetailScreen());
            },
            child: Text(
              "View More Info",
              style: TextStyle(
                color: Colors.orange,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Show Email Confirmation Screen
                    setState(() {
                      showEmailConfirmation = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 3, 165, 84),
                    foregroundColor: Colors.white,
                    fixedSize: Size(102, 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text("Approve"),
                ),
                SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () {
                    // Reject Logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 245, 78, 49),
                    foregroundColor: Colors.white,
                    fixedSize: Size(102, 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text("Reject"),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

Widget _buildEmailConfirmationScreen(String restaurantName) {
  bool isHovered = false; // Track hover state

  return StatefulBuilder(
    builder: (context, setState) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text("From:"),
          SizedBox(height: 5),
          _buildInputField("DineDeal@gmail.com", isReadOnly: true),
          SizedBox(height: 15),
          Text("To:"),
          SizedBox(height: 5),
          _buildInputField("${restaurantName}@gmail.com", isReadOnly: true),
          SizedBox(height: 15),
          Text("Subject:"),
          SizedBox(height: 5),
          _buildInputField("Your Registration is Successful – Welcome to Dine-Deal!"),
          SizedBox(height: 15),
          Text("Email:"),
          SizedBox(height: 5),
          _buildEmailBody(),
          SizedBox(height: 20),
          Row(
            children: [
              MouseRegion(
                onEnter: (_) {
                  setState(() {
                    isHovered = true;
                  });
                },
                onExit: (_) {
                  setState(() {
                    isHovered = false;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  decoration: BoxDecoration(
                    color: isHovered ? Colors.white : const Color.fromARGB(255, 201, 74, 1),
                    border: Border.all(
                      color: const Color.fromARGB(255, 201, 74, 1),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Send Email",
                    style: TextStyle(
                      fontSize: 16,
                      color: isHovered ? const Color.fromARGB(255, 201, 74, 1) : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}



  Widget _buildInputField(String text, {bool isReadOnly = false}) {
    return TextField(
      readOnly: isReadOnly,
      decoration: InputDecoration(
        hintText: text,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildEmailBody() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        "Hello Marriott,\n\nWe’re excited to inform you that your registration with Dine-Deal has been successfully completed! 🎉\n\nYou can now enjoy all the great features our app has to offer, including exploring the best restaurant deals, placing orders, and more. Start using the Dine-Deal app today to experience amazing offers and discounts!\n\nThank you for choosing Dine-Deal – we look forward to serving you!\n\nBest regards,\nThe Dine-Deal Team",
        style: TextStyle(fontSize: 14, color: Colors.black87),
      ),
    );
  }

  Widget _buildTableCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          color: Colors.black,
        ),
      ),
    );
  }
}