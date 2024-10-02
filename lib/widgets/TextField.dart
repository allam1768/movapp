import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isPassword;
  final Color backgroundColor; // Tambahkan properti untuk warna latar belakang

  CustomTextField({
    required this.controller,
    required this.labelText,
    this.isPassword = false,
    this.backgroundColor = Colors.grey, // Set default color jika tidak diberikan
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
          labelStyle: TextStyle(color: Colors.white),
          fillColor: backgroundColor, // Tambahkan warna latar belakang
          filled: true, // Aktifkan pengisian latar belakang
          enabledBorder: OutlineInputBorder(

          ),
          focusedBorder: OutlineInputBorder(

          ),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
