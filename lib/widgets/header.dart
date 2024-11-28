import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final bool isSticky;

  const Header({super.key, this.isSticky = false});

  @override
  Widget build(BuildContext context) {
    // Determine if the device is mobile or web/tablet based on screen width.
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      height: isSticky ? 70.0 : 100.0,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.teal, Colors.greenAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: isSticky
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ]
            : [],
      ),
      child: Row(
        children: [
          // Logo
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: isSticky ? 22 : 30,
            child: Icon(
              Icons.restaurant_menu,
              color: Colors.teal,
              size: isSticky ? 22 : 30,
            ),
          ),

          // Title
          const SizedBox(width: 16.0),
          Text(
            'Restaurant App',
            style: TextStyle(
              fontSize: isSticky ? 20.0 : 28.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          // Spacer to push items to the right
          const Spacer(),

          // Responsive Menu
          if (!isMobile) _buildDesktopMenu(context),
          if (isMobile) _buildMobileMenu(context),
        ],
      ),
    );
  }

  // Menu for larger screens
  Widget _buildDesktopMenu(BuildContext context) {
    return Row(
      children: [
        _buildNavItem(context, 'Home', Icons.home),
        _buildNavItem(context, 'Menu', Icons.menu_book),
        _buildNavItem(context, '', Icons.phone),
        _buildNavDropdown(context),
      ],
    );
  }

  // Mobile-friendly menu with a dropdown or drawer trigger
  Widget _buildMobileMenu(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.menu, color: Colors.white),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    );
  }

  Widget _buildNavItem(BuildContext context, String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton.icon(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$label clicked!')),
          );
        },
        icon: Icon(icon, color: Colors.white, size: 20),
        label: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildNavDropdown(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert, color: Colors.white),
      onSelected: (value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$value selected!')),
        );
      },
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem(
            value: 'Gallery',
            child: Text('Gallery'),
          ),
          const PopupMenuItem(
            value: 'Reservations',
            child: Text('Reservations'),
          ),
          const PopupMenuItem(
            value: 'About Us',
            child: Text('About Us'),
          ),
        ];
      },
    );
  }
}
