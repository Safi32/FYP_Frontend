import 'package:dine_deal/features/admin_side/presentation/pages/manage_restaurant/add_deal.dart';
import 'package:dine_deal/features/admin_side/presentation/pages/manage_restaurant/add_sitting.dart';
import 'package:dine_deal/features/admin_side/presentation/pages/manage_restaurant/admin_home_screen.dart';
import 'package:dine_deal/features/admin_side/presentation/pages/manage_restaurant/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class AdminBottomBar extends StatefulWidget {
  const AdminBottomBar({super.key});

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<AdminBottomBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const AdminHomeScreen(),
    AddDealScreen(),
    AddSitting(),
    // const AdminReservation(),
    // const AdminFavourite(),
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
      bottomNavigationBar: CustomBottomBar(
          selectedIndex: _selectedIndex,
          indexSelectionCallback: (value) {
            setState(() {
              _selectedIndex = value;
            });
          }),
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
