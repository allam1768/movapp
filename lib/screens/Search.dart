import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // Data dummy film
  final List<Map<String, String>> movies = [
    { "image": "assets/images/satu.png"},
    { "image": "assets/images/dua.png"},
    { "image": "assets/images/tiga.png"},
    { "image": "assets/images/empat.png"},
    { "image": "assets/images/lima.png"},
    { "image": "assets/images/enam.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(

      backgroundColor: const Color(0xFF001733),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              // Search bar dengan Cupertino style
              CupertinoSearchTextField(
                placeholder: "Search for movies...",
                backgroundColor: Colors.white.withOpacity(0.2),
                placeholderStyle: const TextStyle(color: Colors.white70),
                style: const TextStyle(color: Colors.white),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.white70,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.clear_thick_circled,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 20),

              // GridView untuk menampilkan film
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: movies.length, // Jumlah item berdasarkan data
                  itemBuilder: (context, index) {
                    final movie = movies[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(movie["image"]!), // Mengambil gambar dari data
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
