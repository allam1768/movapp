import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String image;
  final String imdbRating;


  const MovieCard({
    Key? key,
    required this.image,
    required this.imdbRating,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          // Gambar film
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              image,
              fit: BoxFit.fitHeight, // Menggunakan BoxFit.cover untuk memenuhi area
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          // Teks di atas gambar
          Positioned(
            top: 0,
            left: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.yellow[700],
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'IMDb $imdbRating',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
