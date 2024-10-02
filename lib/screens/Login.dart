import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/Login_controller.dart';
import '../widgets/Button.dart';
import '../widgets/TextField.dart';

class Login_screens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find(); // Mengambil controller

    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 23, 51, 1),
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Color.fromRGBO(0, 23, 51, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Posisikan di tengah
          children: [
            Spacer(), // Beri jarak untuk membawa konten ke bawah
            Align(
              alignment: Alignment.center, // Bisa diubah jadi Alignment.bottomCenter
              child: Card(
                color: Color(0xFF00224D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: 54, // Atur ukuran lebar gambar
                        height: 50, // Atur ukuran tinggi gambar
                        fit: BoxFit.cover, // Sesuaikan tampilan gambar
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 30),
                      CustomTextField(
                        controller: controller.usernameController,
                        labelText: 'Username',
                        backgroundColor: Color(0xFFA0153E),
                      ),
                      SizedBox(height: 20),
                      CustomTextField(
                        controller: controller.passwordController,
                        labelText: 'Password',
                        isPassword: true,
                        backgroundColor: Color(0xFFA0153E),
                      ),
                      SizedBox(height: 40),
                      CustomButton(
                        text: 'Login',
                        onPressed: controller.login, // Menggunakan metode login dari controller
                        backgroundColor: Color(0xFFA0153E),
                        width: 200, // Mengatur lebar tombol
                        height: 37, // Mengatur tinggi tombol
                        textColor: Color(0xFF29001B), // Mengatur warna teks
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(), // Jarak di bagian bawah agar konten lebih ke tengah/bawah
          ],
        ),
      ),
    );
  }
}
