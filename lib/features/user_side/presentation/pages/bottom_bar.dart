import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dine_deal/core/resources/app_colors.dart';
import 'package:dine_deal/features/user_side/presentation/pages/favourite.dart';
import 'package:dine_deal/features/user_side/presentation/pages/home_screen.dart';
import 'package:dine_deal/features/user_side/presentation/pages/reservation.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomeScreen(),
      const Reservation(),
      const Favorite(),
      // const UserProfile(),
    ];
  }

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
        backgroundColor: Colors.transparent,
        color: AppColors.orange,
        animationDuration: const Duration(milliseconds: 300),
        items: [
          Icon(Icons.home,
              size: 30,
              color: _selectedIndex == 0 ? Colors.white : Colors.black),
          Icon(Icons.receipt,
              size: 30,
              color: _selectedIndex == 1 ? Colors.white : Colors.black),
          Icon(Icons.favorite,
              size: 30,
              color: _selectedIndex == 2 ? Colors.white : Colors.black),
          Icon(Icons.account_circle,
              size: 30,
              color: _selectedIndex == 3 ? Colors.white : Colors.black),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
