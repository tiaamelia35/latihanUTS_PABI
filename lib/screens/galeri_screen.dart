// Menghubungkan halaman dengan data hewan
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:latihanuts_pab/data/hewan_data.dart';
import 'package:latihanuts_pab/providers/favorite_providers.dart';
import 'package:latihanuts_pab/screens/detail_screen.dart';
import 'package:latihanuts_pab/screens/profile_screen.dart';

// Membuat halaman utama galeri hewan
class GaleriScreen extends StatelessWidget {
  const GaleriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = context.watch<FavoriteProvider>();

    return Scaffold(
      // AppBar atau bagian judul aplikasi
      appBar: AppBar(
        title: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Galeri Hewan',
              style: TextStyle(
                fontSize: 25,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            Align(
              alignment: Alignment.center, // kiri; ganti jadi centerRight untuk kanan
              child: Text(
                'Tia Amelia',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),

      // Menampilkan daftar hewan dalam bentuk grid
      body: GridView.builder(
        padding: const EdgeInsets.all(12),

        // Mengatur jumlah kolom
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.8,
        ),

        // Jumlah data hewan
        itemCount: daftarHewan.length,

        // Membuat setiap kartu hewan
        itemBuilder: (context, index) {
          final hewan = daftarHewan[index];
          final isFavorite = favoriteProvider.isFavorite(hewan.nama);

          return GestureDetector(
            // Berpindah ke halaman detail ketika kartu diklik
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(hewan: hewan),
                ),
              );
            },

            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 3,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Menampilkan gambar hewan dari internet dengan tombol Favorite
                  Expanded(
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.network(
                            hewan.gambar,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 6,
                          right: 6,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.4),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              iconSize: 20,
                              constraints: const BoxConstraints(),
                              padding: const EdgeInsets.all(6),
                              icon: Icon(
                                isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: isFavorite ? Colors.red : Colors.white,
                              ),
                              onPressed: () {
                                context.read<FavoriteProvider>().toggle(hewan.nama);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Menampilkan nama hewan
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      hewan.nama,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),

      // Tombol Floating Action Button untuk membuka Profil Pengguna
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple.shade100,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProfileScreen(),
            ),
          );
        },
        child: const Icon(Icons.person, color: Colors.deepPurple),
      ),
    );
  }
}