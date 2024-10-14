import 'package:flutter/material.dart';

class MovieCard extends StatefulWidget {
  final String title;
  final String posterPath;
  final double imdbRating;
  final VoidCallback onWatchPressed; // Callback untuk aksi tombol tonton
  final Function(bool) onBookmarkPressed; // Callback untuk bookmark toggle

  MovieCard({
    required this.title,
    required this.posterPath,
    required this.imdbRating,
    required this.onWatchPressed,
    required this.onBookmarkPressed,
  });

  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  bool isBookmarked = false;

  void _toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
      widget.onBookmarkPressed(isBookmarked); // Panggil callback saat status berubah
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 160, // Lebar container tetap 160
        height: 280, // Tinggi container tetap 280
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 1,
              child: Container(
                width: 160, // Lebar container tetap 160
                height: 279, // Tinggi container tetap 279
                decoration: ShapeDecoration(
                  color: Color(0xFF243642),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6), // Sedikit lebih besar
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10, // Posisikan tombol di bawah container dengan jarak 20 dari bawah
              left: 10, // Posisi kiri agar tombol di tengah
              child: GestureDetector(
                onTap: widget.onWatchPressed, // Aksi ketika tombol tonton ditekan
                child: Container(
                  width: 80, // Ukuran tombol tetap 80
                  height: 30, // Ukuran tombol tetap 30
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
                        fontSize: 16, // Font size diperbesar menjadi 16
                        fontFamily: 'Karla',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 160, // Ukuran poster tetap 160
                height: 205, // Ukuran poster tetap 205
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
              top: 212, // Sesuaikan posisi rating di atas poster
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 18, // Ukuran ikon star
                  ),
                  SizedBox(width: 4),
                  Text(
                    widget.imdbRating.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16, // Ukuran font rating
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Karla',
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 4.66,
              top: 185, // Menempatkan judul di atas rating
              child: Container(
                width: 150, // Lebar container untuk judul
                child: Text(
                  widget.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16, // Ukuran font judul
                    fontFamily: 'Karla',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 230, // Posisi ikon bookmark
              right: 5, // Posisi kanan untuk ikon bookmark
              child: IconButton(
                icon: Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: Colors.white,
                ),
                onPressed: _toggleBookmark, // Panggil fungsi toggle
              ),
            ),
          ],
        ),
      ),
    );
  }
}
