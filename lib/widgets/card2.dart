import 'package:flutter/material.dart';

class MovieCard2 extends StatefulWidget {
  final String title;
  final String posterPath;
  final double imdbRating;
  final VoidCallback onWatchPressed; // Callback untuk aksi tombol tonton
  final Function(bool) onBookmarkPressed; // Callback untuk bookmark toggle

  MovieCard2({
    required this.title,
    required this.posterPath,
    required this.imdbRating,
    required this.onWatchPressed,
    required this.onBookmarkPressed,
  });

  @override
  _MovieCard2State createState() => _MovieCard2State();
}

class _MovieCard2State extends State<MovieCard2> {
  bool isBookmarked = false;

  void _toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
      widget.onBookmarkPressed(isBookmarked); // Panggil callback saat status berubah
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140, // Diperbesar dari 124 menjadi 140
      height: 240, // Diperbesar dari 218 menjadi 240
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 1,
            child: Container(
              width: 140, // Diperbesar dari 124 menjadi 140
              height: 239, // Diperbesar dari 217 menjadi 239
              decoration: ShapeDecoration(
                color: Color(0xFF243642),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6), // Sedikit lebih besar
                ),
              ),
            ),
          ),
          Positioned(
            left: 4.67,
            top: 210, // Sesuaikan top-nya agar tombol berada di posisi yang benar
            child: GestureDetector(
              onTap: widget.onWatchPressed, // Aksi ketika tombol tonton ditekan
              child: Container(
                width: 70, // Diperbesar dari 63.47 menjadi 70
                height: 25, // Diperbesar dari 20.53 menjadi 25
                decoration: ShapeDecoration(
                  color: Color(0xFF629584),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4), // Sedikit lebih besar
                  ),
                ),
                child: Center(
                  child: Text(
                    "Watch",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14, // Font size sedikit diperbesar
                      fontFamily: 'Karla',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 140, // Diperbesar dari 124 menjadi 140
              height: 185, // Diperbesar dari 165 menjadi 185
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.posterPath),
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6.53),
                    topRight: Radius.circular(6.53),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 4.66,
            top: 192, // Diperbesar posisinya agar sesuai dengan ukuran baru
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 16, // Diperbesar dari 14 menjadi 16
                ),
                SizedBox(width: 4),
                Text(
                  widget.imdbRating.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14, // Font size sedikit diperbesar
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Karla',
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 4.66,
            top: 165, // Sesuaikan top untuk menempatkan judul
            child: Container(
              width: 130, // Lebar container juga diperbesar
              child: Text(
                widget.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14, // Font size sedikit diperbesar
                  fontFamily: 'Karla',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
            top: 195,
            right: 0,
            child: IconButton(
              icon: Icon(
                isBookmarked ? Icons.delete : Icons.delete_outline,
                color: Colors.red,
              ),
              onPressed: _toggleBookmark, // Panggil fungsi toggle
            ),
          ),
        ],
      ),
    );
  }
}
