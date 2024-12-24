import 'package:dine_deal/features/admin_side/presentation/pages/manage_restaurant/add_deal.dart';
import 'package:dine_deal/features/admin_side/presentation/pages/manage_restaurant/admin_favourite.dart';
import 'package:dine_deal/features/admin_side/presentation/pages/manage_restaurant/admin_home_screen.dart';
import 'package:dine_deal/features/admin_side/presentation/pages/manage_restaurant/admin_reservation.dart';
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
    AdminHomeScreen(),
    AddDealScreen(),
    const AdminReservation(),
    const AdminFavourite(),
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
      // bottomNavigationBar: CurvedNavigationBar(
      //   items: <Widget>[
      //     _buildNavItem(
      //         imageURL: 'assets/basic-needs.png',
      //         label: _selectedIndex == 0 ? "Home" : ""),
      //     _buildNavItem(
      //         imageURL: 'assets/basic-needs.png',
      //         label: _selectedIndex == 1 ? "Add Menu" : ""),
      //     _buildNavItem(
      //         imageURL: 'assets/basic-needs.png',
      //         label: _selectedIndex == 2 ? "Reservation" : ""),
      //     _buildNavItem(
      //         imageURL: 'assets/basic-needs.png',
      //         label: _selectedIndex == 3 ? "Favorite" : ""),
      //   ],
      //   color: AppColors.orange,
      //   buttonBackgroundColor: Colors.white,
      //   backgroundColor: Colors.white,
      //   animationCurve: Curves.easeInOut,
      //   animationDuration: const Duration(milliseconds: 300),
      //   index: _selectedIndex,
      //   onTap: _onItemTapped,
      // ),
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
