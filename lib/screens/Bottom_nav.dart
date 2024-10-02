import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dot_curved_bottom_nav/dot_curved_bottom_nav.dart';
import 'package:movie_app/screens/Home.dart';
import 'package:movie_app/screens/Profile.dart';
import 'package:movie_app/screens/Search.dart'; // Pastikan ini tersedia

class bottom_nav extends StatefulWidget {
  @override
  _bottom_navState createState() => _bottom_navState();
}

class _bottom_navState extends State<bottom_nav> {
  int _currentPage = 0; // State untuk halaman saat ini

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF001733), // Latar belakang Scaffold
      body: _getPage(_currentPage),
      bottomNavigationBar: DotCurvedBottomNav(
        scrollController: ScrollController(),
        hideOnScroll: true,
        indicatorColor: _getIndicatorColor(_currentPage),
        backgroundColor: Colors.black,
        animationDuration: const Duration(milliseconds: 1000),
        animationCurve: Curves.ease,
        selectedIndex: _currentPage,
        indicatorSize: 5,
        borderRadius: 30,
        height: 75,
        onTap: (index) {
          setState(() {
            _currentPage = index; // Update halaman saat ini
          });
        },
        items: [
          Icon(
            Icons.movie,
            color: _currentPage == 0 ? Colors.blue : Colors.white,
          ),
          Icon(
            Icons.music_note,
            color: _currentPage == 1 ? Colors.red : Colors.white,
          ),
          Icon(
            Icons.person,
            color: _currentPage == 2 ? Colors.green : Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _getPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return Home_screen();
      case 1:
        return Search_screen();
      case 2:
        return Profile_screen();
      default:
        return Home_screen();
    }
  }

  Color _getIndicatorColor(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return Colors.blue;
      case 1:
        return Colors.red;
      case 2:
        return Colors.green;
      default:
        return Colors.blue;
    }
  }
}
