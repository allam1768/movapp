import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/screens/Bottom_nav.dart';
import 'package:movie_app/screens/Home.dart';
import 'package:movie_app/screens/Login.dart';
import 'package:movie_app/screens/Profile.dart';
import 'package:movie_app/screens/Favorite.dart';
import 'package:movie_app/screens/Splash.dart';
import 'package:movie_app/bindings/splash_binding.dart';

import 'bindings/login_binding.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => SplashScreen(),
          binding: SplashBinding(),
        ),
        GetPage(
          name: '/login',
          page: () => Login_screens(), // Pastikan nama kelas sesuai
          binding: LoginBinding(),
        ),
        GetPage(name: '/home', page: () => BottomNav()),
      ],
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
