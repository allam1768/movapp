import 'package:flutter/material.dart';
import '../widgets/Button.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final String image;
  final String imdbRating;
  final VoidCallback onWatchPressed;
  final VoidCallback onBookmarkPressed;

  const MovieCard({
    Key? key,
    required this.title,
    required this.image,
    required this.imdbRating,
    required this.onWatchPressed,
    required this.onBookmarkPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Gambar Film
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              height: 40, // Sesuaikan tinggi gambar
              width: double.infinity,
            ),
          ),

          // Info Film dan Tombol
          Container(
            height: 150,
            decoration: const BoxDecoration(
              color: Color(0xFF2E2E2E), // Warna latar belakang
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Rating dan Judul
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 16,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      imdbRating,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8), // Jarak antara rating dan judul

                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1, // Batasi judul jadi 1 baris
                ),
                const SizedBox(height: 8), // Jarak sebelum tombol

                // Tombol
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Tombol "Watch"
                    CustomButton(
                      text: 'Watch',
                      onPressed: onWatchPressed,
                      backgroundColor: const Color(0xFF629584),
                      width: 80, // Perbesar lebar tombol agar tidak terlalu kecil
                      height: 35, // Sesuaikan tinggi tombol
                      textColor: const Color(0xFFFFFFFF),
                    ),
                    // Tombol Bookmark
                    IconButton(
                      icon: const Icon(
                        Icons.bookmark,
                        color: Color(0xFF629584),
                      ),
                      onPressed: onBookmarkPressed,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
