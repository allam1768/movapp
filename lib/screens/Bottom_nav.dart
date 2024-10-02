import 'package:flutter/material.dart';
import 'package:light_bottom_navigation_bar/light_bottom_navigation_bar.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Light Bottom Navigation Bar'),
      ),
      body: Center(
        child: Text("Tab yang dipilih: $_currentIndex"),
      ),
      bottomNavigationBar: LightBottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          LightBottomNavigationBarItem(
            unSelectedIcon: Icons.home_outlined,
            selectedIcon: Icons.home,
            splashColor: Colors.blue,
            borderBottomColor: Colors.blue,
            selectedIconColor: Colors.blue,
            unSelectedIconColor: Colors.grey,
          ),
          LightBottomNavigationBarItem(
            unSelectedIcon: Icons.search_outlined,
            selectedIcon: Icons.search,
            splashColor: Colors.orange,
            borderBottomColor: Colors.orange,
            selectedIconColor: Colors.orange,
            unSelectedIconColor: Colors.grey,
          ),
          LightBottomNavigationBarItem(
            unSelectedIcon: Icons.notifications_outlined,
            selectedIcon: Icons.notifications,
            splashColor: Colors.red,
            borderBottomColor: Colors.red,
            selectedIconColor: Colors.red,
            unSelectedIconColor: Colors.grey,
          ),
        ],
        onSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
