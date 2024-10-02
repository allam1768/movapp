import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/Bottom_nav.dart';
import 'package:movie_app/screens/Login.dart';
import 'package:movie_app/screens/Splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => Splash_screen()),
        GetPage(name: '/login', page: () => Login_screens()),
        GetPage(name: '/home', page: () => BottomNav()), // Sesuaikan dengan halaman utama
      ],
    );
  }
}