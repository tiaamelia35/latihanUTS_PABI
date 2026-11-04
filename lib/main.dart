// Menghubungkan library Flutter
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:latihanuts_pab/providers/favorite_providers.dart';
import 'package:latihanuts_pab/screens/galeri_screen.dart';

// Fungsi utama untuk menjalankan aplikasi
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoriteProvider(),
      child: const MyApp(),
    ),
  );
}

// Membuat widget utama aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Menghilangkan tulisan DEBUG
      debugShowCheckedModeBanner: false,

      // Judul aplikasi
      title: 'Galeri Hewan',

      // Mengatur tema aplikasi
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
        ),
        useMaterial3: true,
      ),

      // Menampilkan halaman utama galeri
      home: const GaleriScreen(),
    );
  }
}