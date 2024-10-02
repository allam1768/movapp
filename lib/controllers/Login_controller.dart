import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final String _correctUsername = 'allam';
  final String _correctPassword = 'allam';

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username == _correctUsername && password == _correctPassword) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      Get.offNamed('/home');
    } else {
      Get.snackbar(
        'Login Gagal',
        'Username atau password salah',
        backgroundColor: Color(0xFFFF204E),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}
