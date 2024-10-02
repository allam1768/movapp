import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Splash_screen extends StatefulWidget {
  @override
  _Splash_screenState createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    // Setelah 3 detik, cek status login
    Future.delayed(Duration(seconds: 3), () {
      if (isLoggedIn) {
        Get.offNamed('/home'); // Jika sudah login, arahkan ke home screen
      } else {
        Get.offNamed('/login'); // Jika belum login, arahkan ke login screen
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 23, 51, 1),
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 104, // Atur ukuran lebar gambar
          height: 100, // Atur ukuran tinggi gambar
          fit: BoxFit.cover, // Sesuaikan tampilan gambar
        ),
      ),
    );
  }
}