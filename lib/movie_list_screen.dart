import 'package:flutter/material.dart';
import 'package:movieslist/profile_screen.dart';
import 'package:movieslist/settings_screen.dart';
import 'movie_detail_screen.dart';

class Movie {
  final String title;
  final String imageUrl;
  final String description;

  Movie({required this.title, required this.imageUrl, required this.description});
}

// Liste de séries TV (Exemple)
final List<Movie> movies = [
  Movie(
    title: "Breaking Bad",
    imageUrl: "https://www.hop-blog.fr/wp-content/uploads/2015/01/breaking-bad-saison-4.jpg",
    description: "Un professeur de chimie atteint d'un cancer devient fabricant de méthamphétamine.",
  ),
  Movie(
    title: "Stranger Things",
    imageUrl: "https://news24online.com/wp-content/uploads/2025/02/WhatsApp-Image-2025-02-21-at-2.14.54-PM.jpeg",
    description: "Un groupe d'enfants découvre un monde parallèle et des créatures étranges.",
  ),
  Movie(
    title: "Game of Thrones",
    imageUrl: "https://static1.colliderimages.com/wordpress/wp-content/uploads/2024/08/house-of-the-dragon-game-of-thrones-emma-darcy-emilia-clarke.jpg",
    description: "Une lutte épique pour le trône de fer dans un monde fantastique.",
  ),
];

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular TV Series"),
        backgroundColor: Colors.pinkAccent,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.pinkAccent),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage("https://i.pravatar.cc/150"),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "John Doe",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const Text(
                    "johndoe@example.com",
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.movie),
              title: const Text("Movies"),
              onTap: () {
                Navigator.pop(context); // Fermer le Drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsScreen()),
                );
              },
            ),
          ],
        ),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MovieDetailScreen(movie: movie)),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        movie.imageUrl,
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        movie.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
