import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor; // Parameter opsional untuk latar belakang
  final Widget? icon;
  final Widget? image;
  final double? width; // Parameter opsional untuk lebar
  final double? height; // Parameter opsional untuk tinggi
  final Color? textColor; // Parameter opsional untuk warna teks

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor, // Parameter opsional
    this.icon,
    this.image,
    this.width, // Parameter opsional
    this.height, // Parameter opsional
    this.textColor, // Parameter opsional
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width, // Mengatur lebar
      height: height, // Mengatur tinggi
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // Mengatur latar belakang jika ada
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.all(0), // Menghilangkan padding default
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (image != null) // Menampilkan gambar jika ada
              image!,
            if (icon != null) // Menampilkan ikon jika ada
              icon!,
            if (text.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  text,
                  style: TextStyle(
                    color: textColor, // Mengatur warna teks jika ada
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
