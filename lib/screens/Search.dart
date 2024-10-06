import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'Search Movies',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF001733),
        brightness: Brightness.dark,
      ),
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

              // Contoh grid hasil pencarian
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7, // Untuk mengatur proporsi item
                  ),
                  itemCount: 6, // Jumlah dummy item
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/dummy_movie.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 10,
                            left: 10,
                            right: 10,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Text(
                                "Movie Title",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
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
