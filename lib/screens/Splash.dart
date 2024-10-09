import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/Splash_controller.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengambil controller
    final SplashController controller = Get.find();

    // Memanggil fungsi untuk memeriksa status login
    controller.checkLoginStatus();

    return Scaffold(
      backgroundColor: Color(0xFF387478),
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
