import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/models/MovieModel.dart';

import '../controllers/Movie_controller.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final MovieController movieController = Get.put(MovieController());

  @override
  void initState() {
    super.initState();
    movieController.loadFavoriteTasks(); // Memuat film favorit dari database
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF387478),
      appBar: AppBar(
        title: const Text('Favorite Movies'),
        backgroundColor: const Color(0xFF00224D),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (movieController.favoriteTasks.isEmpty) {
            return const Center(
              child: Text(
                'No favorite movies yet!',
                style: TextStyle(color: Colors.white),
              ),
            );
          } else {
            return Expanded(
              child: ListView.builder(
                itemCount: movieController.favoriteTasks.length,
                itemBuilder: (context, index) {
                  final movie = movieController.favoriteTasks[index];
                  return ListTile(
                    leading: Image.asset(movie.posterPath), // Gambar poster film
                    title: Text(movie.judul),
                    subtitle: Text('IMDb: ${movie.imdb}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        // Hapus film dari favorit
                        movieController.deleteTask(movie.id!);
                        Get.snackbar("Berhasil", "Film dihapus dari favorit");
                      },
                    ),
                    onLongPress: () {
                      // Bisa digunakan untuk logika tambahan
                    },
                  );
                },
              ),
            );
          }
        }),
      ),
    );
  }
}
