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
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const Reservation(),
    const Favorite(),
    const UserProfile(),
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
        height: 60,
        items: <Widget>[
          _buildNavItem(
            imageURL: 'assets/home-Filled.png',
            label: "Home",
            isSelected: _selectedIndex == 0,
          ),
          _buildNavItem(
            imageURL: 'assets/document-text.png',
            label: "Reservation",
            isSelected: _selectedIndex == 1,
          ),
          _buildNavItem(
            imageURL: 'assets/heart.png',
            label: "Favorite",
            isSelected: _selectedIndex == 2,
          ),
          _buildNavItem(
            imageURL: 'assets/frame.png',
            label: "Account",
            isSelected: _selectedIndex == 3,
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildNavItem({
    String? imageURL,
    required String label,
    required bool isSelected,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (imageURL != null)
          Image(
            image: AssetImage(imageURL),
            height: 25,
            width: 25,
            color: isSelected ? AppColors.orange : Colors.grey,
          ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isSelected ? AppColors.orange : Colors.grey,
          ),
        ),
      ],
    );
  }
}
