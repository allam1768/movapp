import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart'; // Sesuaikan path dengan project kamu

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  // Inisialisasi controller
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
        backgroundColor: const Color.fromRGBO(0, 23, 51, 1), // Warna latar belakang AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Profile Screen',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40), // Jarak antara teks dan tombol logout
            ElevatedButton(
              onPressed: profileController.logout, // Menghubungkan tombol dengan controller
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(0, 23, 51, 1), // Warna tombol
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Ukuran tombol
              ),
              child: const Text(
                'Logout',
                style: TextStyle(fontSize: 18, color: Colors.white), // Gaya teks tombol
              ),
            ),
          ],
        ),
      ),
    );
  }
}
