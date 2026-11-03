// Menghubungkan halaman dengan data hewan
import 'package:flutter/material.dart';
import 'package:latihanuts_pab/data/hewan_data.dart';
import 'package:latihanuts_pab/screens/detail_screen.dart';

// Membuat halaman utama galeri hewan
class GaleriScreen extends StatelessWidget {
  const GaleriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar atau bagian judul aplikasi
      appBar: AppBar(
        title: const Text('Galeri Hewan'),
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
                  // Menampilkan gambar hewan dari internet
                  Expanded(
                    child: Image.network(
                      hewan.gambar,
                      fit: BoxFit.cover,
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}