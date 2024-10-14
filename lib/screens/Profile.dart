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
      backgroundColor: const Color(0xFF387478),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40), // Jarak antara teks dan tombol logout
            ElevatedButton.icon(
              onPressed: profileController.logout, // Menghubungkan tombol dengan controller
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF243642), // Warna tombol
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Ukuran tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Membuat tombol lebih bulat
                ),
              ),
              icon: const Icon(Icons.exit_to_app, color: Colors.white), // Ikon logout
              label: const Text(
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
