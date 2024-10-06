import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/Button.dart';
import '../widgets/MovieCard.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Inisialisasi HomeController


    return Scaffold(
      backgroundColor: const Color(0xFF001733), // Warna latar belakang
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SafeArea(
                      child: Container(
                        height: 625,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/images/insideout.png', // Mengambil gambar dari file
                              fit: BoxFit.cover, // Menyesuaikan gambar dengan Container
                              width: double.infinity,
                              height: double.infinity,
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: Colors.yellow[700],
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: const Text(
                                            "IMDb 7.7",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: [
                                        const Text(
                                          "Inside Out 2",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24,
                                          ),
                                        ),
                                        const Spacer(),
                                        CustomButton(
                                          text: 'Watch now',
                                          onPressed: () {
                                            // Tambahkan logika saat tombol ditekan
                                          },
                                          backgroundColor: Color(0xFFA0153E),
                                          width: 200, // Mengatur lebar tombol
                                          height: 37, // Mengatur tinggi tombol
                                          textColor: Color(0xFF29001B), // Mengatur warna teks
                                        ),
                                        const SizedBox(width: 8),
                                        CustomButton(
                                          text: '',
                                          onPressed: () {
                                            // Tambahkan logika saat tombol ditekan
                                          },
                                          backgroundColor: Color(0xFFA0153E),
                                          image: Image.asset(
                                            'assets/images/fav.png',
                                            width: 37,
                                            height: 37,
                                            fit: BoxFit.cover,
                                          ),
                                          width: 37, // Mengatur lebar tombol
                                          height: 37, // Mengatur tinggi tombol
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10), // Jarak antara gambar dan teks
                    const Text(
                      "For you",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    // Daftar film dalam grid
                    GridView.count(
                      crossAxisCount: 3, // Membuat 3 kolom
                      shrinkWrap: true, // Menghindari masalah layout
                      mainAxisSpacing: 10, // Jarak vertikal antara elemen
                      crossAxisSpacing: 0, // Jarak horizontal antara elemen
                      physics: const ScrollPhysics(), // Mengaktifkan scroll
                      children: [
                        MovieCard(
                          image: 'assets/images/satu.png',
                          imdbRating: '7.7',
                        ),
                        MovieCard(
                          image: 'assets/images/dua.png',
                          imdbRating: '8.1',
                        ),
                        MovieCard(
                          image: 'assets/images/tiga.png',
                          imdbRating: '8.3',
                        ),
                        MovieCard(
                          image: 'assets/images/empat.png',
                          imdbRating: '7.5',
                        ),
                        MovieCard(
                          image: 'assets/images/lima.png',
                          imdbRating: '7.9',
                        ),
                        MovieCard(
                          image: 'assets/images/enam.png',
                          imdbRating: '8.0',
                        ),
                        MovieCard(
                          image: 'assets/images/tujuh.png',
                          imdbRating: '7.8',
                        ),
                        MovieCard(
                          image: 'assets/images/lapan.png',
                          imdbRating: '8.2',
                        ),
                        MovieCard(
                          image: 'assets/images/sembilan.png',
                          imdbRating: '8.4',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
