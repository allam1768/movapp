import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/models/MovieModel.dart';
import 'package:movie_app/widgets/MovieCard.dart';
import 'package:movie_app/widgets/card2.dart';
import '../controllers/Movie_controller.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF387478),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          return GridView.builder(
            itemCount: taskController.tasks.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Number of columns
              crossAxisSpacing: 8, // Horizontal space between items
              mainAxisSpacing: 0, // Smaller vertical space between rows
              childAspectRatio: 0.5, // Aspect ratio of the grid items
            ),




            itemBuilder: (context, index) {
              final movie = taskController.tasks[index];
              return GridTile(
                child: Column(
                  children: [

                    MovieCard2(
                      title: movie.title,
                      posterPath: movie.posterPath,
                      imdbRating: double.parse(movie.imdb), // Konversi jika imdb adalah String
                      onWatchPressed: (){},
                      onBookmarkPressed: (bool isBookmarked) { // Menghapus film dari favorit
                        taskController.deleteTask(movie.id!);
                        Get.snackbar("Berhasil", "Film dihapus dari favorit");
                      },
                    )
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
