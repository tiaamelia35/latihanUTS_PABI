// Menghubungkan Flutter dan model Hewan
import 'package:flutter/material.dart';
import 'package:latihanuts_pab/models/hewan.dart';

// Membuat halaman detail hewan
class DetailScreen extends StatelessWidget {
  // Menerima data hewan dari halaman sebelumnya
  final Hewan hewan;    // halaman detail menerima satu objek Hewan yang dikirim dari halaman galeri

  const DetailScreen({
    super.key,
    required this.hewan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bagian atas halaman
      appBar: AppBar(
        title: Text(hewan.nama),
        centerTitle: true,
      ),

      // Isi halaman detail
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar utama hewan dari internet
              ClipRRect(      // ngubah border radius, kalo mau hpus aja smpe child trus mulai dari image.network
                borderRadius: BorderRadius.circular(12),
                child: Image.network(   // Menampilkan gambar dari internet
                  hewan.gambar,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 16),

              // Nama hewan
              Text(
                hewan.nama,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // kalo mau ubah tulisan Anjing jdi tengah
              // Center(
              //   child: Text(
              //     hewan.nama,
              //     textAlign: TextAlign.center,
              //     style: const TextStyle(
              //       fontSize: 24,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),

              const SizedBox(height: 8),

              // Jenis hewan
              Text(
                'Jenis: ${hewan.jenis}',
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 12),

              // Deskripsi hewan
              const Text(
                'Deskripsi',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                hewan.deskripsi,
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 20),

              // Judul galeri foto tambahan
              const Text(
                'Galeri Foto',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // Menampilkan foto tambahan secara horizontal
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,   // Menampilkan foto tambahan secara horizontal
                  itemCount: hewan.galeri.length,

                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),

                        child: Image.network(
                          hewan.galeri[index],
                          width: 150,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),


              // Ubah foto di Galeri jadi Vertikal
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: hewan.galeri.map((url) {
              //     return Padding(
              //       padding: const EdgeInsets.only(bottom: 10),
              //       child: ClipRRect(
              //         borderRadius: BorderRadius.circular(10),
              //         child: Image.network(
              //           url,
              //           width: 150,
              //           height: 120,
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              //     );
              //   }).toList(),
              // ),

            ],
          ),
        ),
      ),
    );
  }
}