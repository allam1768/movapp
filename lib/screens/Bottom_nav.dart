import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:movie_app/screens/Home.dart';
import 'package:movie_app/screens/Favorite.dart';
import 'package:movie_app/screens/Profile.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0; // State untuk halaman saat ini

  final List<Widget> _screens = [
    HomeScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      // Menampilkan halaman sesuai index saat ini
      bottomNavigationBar:
      MotionTabBar(
        initialSelectedTab: "Movie",
        useSafeArea: true,
        labels: const ["Movie", "Favorite", "Profile"],
        icons: const [Icons.movie, Icons.bookmark, Icons.person],
        tabSize: 50,
        tabBarHeight: 55,
        textStyle: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold),
        tabIconColor: Colors.blueGrey,
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: Color(0xFF629584),
        tabIconSelectedColor: Colors.white,
        onTabItemSelected: (index) {
          setState(() {
            _currentIndex = index; // Update halaman saat ini
          });
        },
      ),
    );
  }
}
