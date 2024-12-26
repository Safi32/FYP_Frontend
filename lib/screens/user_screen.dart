import 'dart:convert';
import 'package:dine/widgets/sidebar_menu.dart';
import 'package:dine/widgets/top_navbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late Future<List<dynamic>> _users;

  @override
  void initState() {
    super.initState();
    _users = fetchUsers();
  }

  Future<List<dynamic>> fetchUsers() async {
    final url = Uri.parse('http://localhost:3000/users'); // Replace with your API URL
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: Row(
        children: [
          // Sidebar
          SidebarMenu(activeItem: 'Users'),

          // Main Content
          Expanded(
            child: Column(
              children: [
                // Top Navbar
                TopNavbar(avatarPath: 'assets/admin_avatar.png'),

                // User Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header
                        Text(
                          "Registered Users",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),

                        // User Table
                        FutureBuilder<List<dynamic>>(
                          future: _users,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(child: Text("Error: ${snapshot.error}"));
                            } else if (snapshot.hasData) {
                              return _buildUserTable(snapshot.data!);
                            } else {
                              return Center(child: Text("No users found"));
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserTable(List<dynamic> users) {
    return Table(
      border: TableBorder(
        horizontalInside: BorderSide(width: 0.5, color: Colors.grey[300]!),
      ),
      columnWidths: {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(3),
        2: FlexColumnWidth(3),
        3: FlexColumnWidth(4),
        4: FlexColumnWidth(2),
        5: FlexColumnWidth(3),
        6: FlexColumnWidth(2), // Added for Action
      },
      children: [
        _buildTableHeader(),
        ...users.asMap().entries.map((entry) {
          int index = entry.key;
          dynamic user = entry.value;
          return _buildTableRow(
            index + 1,
            user['username'] ?? 'N/A',
            user['phone'] ?? 'N/A',
            user['email'] ?? 'N/A',
            user['reservations'].toString(),
            user['registrationDate'] ?? 'N/A',
          );
        }).toList(),
      ],
    );
  }

  TableRow _buildTableHeader() {
    return TableRow(
      decoration: BoxDecoration(color: Colors.grey[200]),
      children: [
        _buildTableCell("S. No", isHeader: true),
        _buildTableCell("User Name", isHeader: true),
        _buildTableCell("Number", isHeader: true),
        _buildTableCell("Email", isHeader: true),
        _buildTableCell("Reservations", isHeader: true),
        _buildTableCell("Date of Registration", isHeader: true),
        _buildTableCell("Action", isHeader: true), // Added Action Header
      ],
    );
  }

  TableRow _buildTableRow(int id, String name, String number, String email, String reservations, String registrationDate) {
    return TableRow(
      children: [
        _buildTableCell(id.toString()),
        _buildUserCell(name),
        _buildTableCell(number),
        _buildTableCell(email),
        _buildTableCell(reservations),
        _buildTableCell(registrationDate),
        Padding( // Added Action Button
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: ElevatedButton(
            onPressed: () {
              // Handle Block Action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Text("Block"),
          ),
        ),
      ],
    );
  }

  Widget _buildUserCell(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/user_avatar.png"),
            radius: 15,
          ),
          SizedBox(width: 10),
          Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildTableCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          color: Colors.black,
        ),
      ),
    );
  }
}
