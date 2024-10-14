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
                      onWatchPressed: () {},
                      onBookmarkPressed: (bool isBookmarked) {
                        // Tampilkan dialog konfirmasi sebelum menghapus
                        Get.defaultDialog(
                          title: "Hapus dari favorit",
                          titleStyle: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          content: Column(
                            children: [
                              // Icon(
                              //   Icons.warning_amber_rounded,
                              //   size: 50,
                              //   color: Colors.yellow,
                              // ),
                              SizedBox(height: 16),
                              Text(
                                "Apakah Anda yakin ingin menghapus film ini dari favorit?",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          backgroundColor: Color(0xFF003B4C),
                          radius: 15,
                          actions: [
                            TextButton(
                              onPressed: () {
                                taskController.deleteTask(movie.id!);
                                Get.snackbar("Berhasil", "Film dihapus dari favorit");
                                Get.close(0); // Tutup dialog setelah menghapus
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.red,
                                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                "Ya, Hapus",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            TextButton(
                              onPressed: () {
                                Get.back(); // Tutup dialog jika user membatalkan
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                side: BorderSide(color: Colors.blue),
                              ),
                              child: Text(
                                "Batal",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        );
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
