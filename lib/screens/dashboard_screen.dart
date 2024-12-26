import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../widgets/sidebar_menu.dart';
import '../widgets/top_navbar.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar Menu
          SidebarMenu(activeItem: 'Dashboard'),

          // Main Content
          Expanded(
            child: Column(
              children: [
                // Top Navbar
                TopNavbar(avatarPath: 'assets/admin_avatar.png'),

                // Dashboard Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Dashboard Heading
                        Text(
                          "Dashboard",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),

                        // Welcome Message
                        Text(
                          "Hi, Admin Welcome back to the admin Dashboard",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        SizedBox(height: 20),

                        // Overview Cards
                        LayoutBuilder(
                          builder: (context, constraints) {
                            double cardWidth = (constraints.maxWidth - 40) / 3;
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OverviewCard(
                                  icon: Icons.notifications,
                                  title: "Restaurant Request",
                                  value: "20",
                                  change: "8.5% Up from yesterday",
                                  color: Colors.orange,
                                  width: cardWidth,
                                ),
                                OverviewCard(
                                  icon: Icons.home,
                                  title: "Registered Restaurant",
                                  value: "1,000",
                                  change: "8.5% Up from yesterday",
                                  color: Colors.orange,
                                  width: cardWidth,
                                ),
                                OverviewCard(
                                  icon: Icons.person,
                                  title: "Registered User",
                                  value: "1,000",
                                  change: "8.5% Up from yesterday",
                                  color: Colors.orange,
                                  width: cardWidth,
                                ),
                              ],
                            );
                          },
                        ),
                        SizedBox(height: 20),

                        // Registration Analytics
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title and Filter Dropdown
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Registration Analytics",
                                    style: TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  DropdownButton<String>(
                                    value: "Yearly",
                                    items: <String>["Yearly", "Monthly", "Weekly"]
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      // Handle Dropdown Change
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),

                              // Line Chart
                              Container(
                                height: 300,
                                child: LineChart(registrationAnalyticsChart()),
                              ),
                            ],
                          ),
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
      backgroundColor: Colors.white, // Set background color of the page to white
    );
  }

  // Chart Data
  LineChartData registrationAnalyticsChart() {
    return LineChartData(
      gridData: FlGridData(show: true),
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: true),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              switch (value.toInt()) {
                case 0:
                  return Text('Jan');
                case 1:
                  return Text('Feb');
                case 2:
                  return Text('Mar');
                case 3:
                  return Text('Apr');
                case 4:
                  return Text('May');
                case 5:
                  return Text('Jun');
                case 6:
                  return Text('Jul');
                case 7:
                  return Text('Aug');
                case 8:
                  return Text('Sep');
                case 9:
                  return Text('Oct');
                case 10:
                  return Text('Nov');
                case 11:
                  return Text('Dec');
                default:
                  return Text('');
              }
            },
          ),
        ),
      ),
      borderData: FlBorderData(show: true),
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 100),
            FlSpot(1, 300),
            FlSpot(2, 200),
            FlSpot(3, 400),
            FlSpot(4, 1000),
            FlSpot(5, 1500),
            FlSpot(6, 2000),
            FlSpot(7, 2500),
            FlSpot(8, 3000),
            FlSpot(9, 3500),
            FlSpot(10, 4000),
            FlSpot(11, 3000),
          ],
          isCurved: true,
          gradient: LinearGradient(colors: [Colors.orange, Colors.red]),
          barWidth: 3,
          belowBarData: BarAreaData(show: false),
        ),
        LineChartBarData(
          spots: [
            FlSpot(0, 50),
            FlSpot(1, 150),
            FlSpot(2, 100),
            FlSpot(3, 200),
            FlSpot(4, 500),
            FlSpot(5, 750),
            FlSpot(6, 1000),
            FlSpot(7, 1200),
            FlSpot(8, 1500),
            FlSpot(9, 1800),
            FlSpot(10, 2000),
            FlSpot(11, 2500),
          ],
          isCurved: true,
          gradient: LinearGradient(colors: [Colors.yellow, Colors.orange]),
          barWidth: 3,
          belowBarData: BarAreaData(show: false),
        ),
      ],
    );
  }
}

class OverviewCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String change;
  final Color color;
  final double width;

  OverviewCard({required this.icon, required this.title, required this.value, required this.change, required this.color, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white, // Card background color set to white
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 28),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.arrow_upward, size: 14, color: const Color.fromARGB(255, 201, 74, 1)),
              SizedBox(width: 5),
              Text(
                change,
                style: TextStyle(fontSize: 12, color: const Color.fromARGB(255, 201, 74, 1)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
