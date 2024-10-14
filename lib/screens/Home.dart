import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/widgets/MovieCard.dart';
import 'package:movie_app/widgets/card2.dart';

import '../controllers/Movie_controller.dart';
import '../models/MovieModel.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TaskController movieController = Get.put(TaskController());
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    movieController.loadTasks(); // Memuat semua movie data dari database
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF387478),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Memberikan jarak atas sebelum search bar
            SizedBox(height: 50), // Jarak atas sebelum search bar

            // Search bar di atas GridView
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  // Lakukan pencarian berdasarkan input
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search Movies...',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            // GridView untuk menampilkan MovieCard
            Expanded(
              child: Container(
                constraints: BoxConstraints(maxWidth: 500), // Membatasi lebar GridView
                child: GridView.count(
                  crossAxisCount: 2, // Menampilkan 2 item per baris
                  mainAxisSpacing: 10, // Jarak vertikal antar item
                  crossAxisSpacing: 10, // Jarak horizontal antar item
                  childAspectRatio: 0.7, // Proporsi lebar:tinggi. Sesuaikan dengan ukuran `MovieCard`
                  children: [
                    MovieCard(
                      title: 'Cars 4',
                      posterPath: 'assets/images/satu.png',
                      imdbRating: 7.7,
                      onWatchPressed: () {
                        // Aksi ketika tombol 'Watch' ditekan
                      },
                      onBookmarkPressed: (bool isBookmarked) {
                        Taskmodel task = Taskmodel(
                          title: 'Film Satu',
                          posterPath: 'assets/images/satu.png',
                          imdb: '7.7',
                        );
                        movieController.addTask(task); // Pastikan movieController sudah didefinisikan
                      },
                    ),
                    MovieCard(
                      title: 'Cars 4',
                      posterPath: 'assets/images/dua.png',
                      imdbRating: 7.7,
                      onWatchPressed: () {
                        // Aksi ketika tombol 'Watch' ditekan
                      },
                      onBookmarkPressed: (bool isBookmarked) {
                        Taskmodel task = Taskmodel(
                          title: 'Film Satu',
                          posterPath: 'assets/images/dua.png',
                          imdb: '7.7',
                        );
                        movieController.addTask(task); // Pastikan movieController sudah didefinisikan
                      },
                    ),
                    MovieCard(
                      title: 'Cars 4',
                      posterPath: 'assets/images/tiga.png',
                      imdbRating: 7.7,
                      onWatchPressed: () {
                        // Aksi ketika tombol 'Watch' ditekan
                      },
                      onBookmarkPressed: (bool isBookmarked) {
                        Taskmodel task = Taskmodel(
                          title: 'Film Satu',
                          posterPath: 'assets/images/tiga.png',
                          imdb: '7.7',
                        );
                        movieController.addTask(task); // Pastikan movieController sudah didefinisikan
                      },
                    ),
                    MovieCard(
                      title: 'Cars 4',
                      posterPath: 'assets/images/empat.png',
                      imdbRating: 7.7,
                      onWatchPressed: () {
                        // Aksi ketika tombol 'Watch' ditekan
                      },
                      onBookmarkPressed: (bool isBookmarked) {
                        Taskmodel task = Taskmodel(
                          title: 'Film Satu',
                          posterPath: 'assets/images/empat.png',
                          imdb: '7.7',
                        );
                        movieController.addTask(task); // Pastikan movieController sudah didefinisikan
                      },
                    ),
                    MovieCard(
                      title: 'Cars 4',
                      posterPath: 'assets/images/lima.png',
                      imdbRating: 7.7,
                      onWatchPressed: () {
                        // Aksi ketika tombol 'Watch' ditekan
                      },
                      onBookmarkPressed: (bool isBookmarked) {
                        Taskmodel task = Taskmodel(
                          title: 'Film Satu',
                          posterPath: 'assets/images/lima.png',
                          imdb: '7.7',
                        );
                        movieController.addTask(task); // Pastikan movieController sudah didefinisikan
                      },
                    ),
                    MovieCard(
                      title: 'Cars 4',
                      posterPath: 'assets/images/enam.png',
                      imdbRating: 7.7,
                      onWatchPressed: () {
                        // Aksi ketika tombol 'Watch' ditekan
                      },
                      onBookmarkPressed: (bool isBookmarked) {
                        Taskmodel task = Taskmodel(
                          title: 'Film Satu',
                          posterPath: 'assets/images/enam.png',
                          imdb: '7.7',
                        );
                        movieController.addTask(task); // Pastikan movieController sudah didefinisikan
                      },
                    ),
                    MovieCard(
                      title: 'Cars 4',
                      posterPath: 'assets/images/tujuh.png',
                      imdbRating: 7.7,
                      onWatchPressed: () {
                        // Aksi ketika tombol 'Watch' ditekan
                      },
                      onBookmarkPressed: (bool isBookmarked) {
                        Taskmodel task = Taskmodel(
                          title: 'Film Satu',
                          posterPath: 'assets/images/tujuh.png',
                          imdb: '7.7',
                        );
                        movieController.addTask(task); // Pastikan movieController sudah didefinisikan
                      },
                    ),
                    MovieCard(
                      title: 'Cars 4',
                      posterPath: 'assets/images/lapan.png',
                      imdbRating: 7.7,
                      onWatchPressed: () {
                        // Aksi ketika tombol 'Watch' ditekan
                      },
                      onBookmarkPressed: (bool isBookmarked) {
                        Taskmodel task = Taskmodel(
                          title: 'Film Satu',
                          posterPath: 'assets/images/lapan.png',
                          imdb: '7.7',
                        );
                        movieController.addTask(task); // Pastikan movieController sudah didefinisikan
                      },
                    ),
                    MovieCard(
                      title: 'Cars 4',
                      posterPath: 'assets/images/sembilan.png',
                      imdbRating: 7.7,
                      onWatchPressed: () {
                        // Aksi ketika tombol 'Watch' ditekan
                      },
                      onBookmarkPressed: (bool isBookmarked) {
                        Taskmodel task = Taskmodel(
                          title: 'Film Satu',
                          posterPath: 'assets/images/sembilan.png',
                          imdb: '7.7',
                        );
                        movieController.addTask(task); // Pastikan movieController sudah didefinisikan
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
