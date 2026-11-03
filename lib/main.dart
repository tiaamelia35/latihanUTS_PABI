// Menghubungkan library Flutter
import 'package:flutter/material.dart';
import 'package:latihanuts_pab/screens/detail_screen.dart';

// Menghubungkan halaman galeri
import 'package:latihanuts_pab/screens/galeri_screen.dart';

import 'data/hewan_data.dart';

// Fungsi utama untuk menjalankan aplikasi
void main() {
  runApp(const MyApp());
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

      // Menampilkan halaman utama
      // home: const GaleriScreen(),
      home: DetailScreen(hewan: daftarHewan[1]),
    );
  }
}