import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/presentation/pages/favourite.dart';
import 'package:dine_deal/features/user_side/presentation/pages/home_screen.dart';
import 'package:dine_deal/features/user_side/presentation/pages/reservation.dart';
import 'package:dine_deal/features/user_side/presentation/pages/user_profile.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<BottomBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const Reservation(),
    const Favorite(),
    const UserProfile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        items: <Widget>[
          _buildNavItem(
              imageURL: 'assets/basic-needs.png',
              label: _selectedIndex == 0 ? "Home" : ""),
          _buildNavItem(
              imageURL: 'assets/basic-needs.png',
              label: _selectedIndex == 1 ? "About" : ""),
          _buildNavItem(
              imageURL: 'assets/basic-needs.png',
              label: _selectedIndex == 2 ? "Favorite" : ""),
          _buildNavItem(
              imageURL: 'assets/basic-needs.png',
              label: _selectedIndex == 3 ? "Profile" : ""),
        ],
        color: AppColors.orange,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        index: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildNavItem(
      {String? imageURL, required String label, IconData? icon}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (imageURL != null)
          Image(
            image: AssetImage(imageURL),
            height: 30,
            width: 30,
          )
        else if (icon != null)
          Icon(icon, size: 30, color: Colors.white),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
