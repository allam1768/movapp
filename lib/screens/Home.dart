import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/widgets/MovieCard.dart';

import '../controllers/Movie_controller.dart';
import '../models/MovieModel.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MovieController movieController = Get.put(MovieController());

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
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            MovieCard(
              title: 'Film Satu',
              image: 'assets/images/satu.png',
              imdbRating: '7.7',
              onWatchPressed: () {
                // Logika nonton film
              },
              onBookmarkPressed: () {
                Moviemodel task = Moviemodel(judul: 'Film Satu', posterPath: 'assets/images/satu.png', imdb: '7.7');
                movieController.addTask(task).then((_) {
                  Get.snackbar("Berhasil", "Film ditambahkan ke favorit");
                });
              },
            ),
            MovieCard(
              title: 'Film Dua',
              image: 'assets/images/dua.png',
              imdbRating: '8.1',
              onWatchPressed: () {
                // Logika nonton film
              },
              onBookmarkPressed: () {
                Moviemodel task = Moviemodel(judul: 'Film Dua', posterPath: 'assets/images/dua.png', imdb: '8.1');
                movieController.addTask(task).then((_) {
                  Get.snackbar("Berhasil", "Film ditambahkan ke favorit");
                });
              },
            ),
            // Tambahkan movie card lainnya jika diperlukan
          ],
        ),
      ),
    );
  }
}
