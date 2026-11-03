// Class untuk menyimpan data hewan
class Hewan {
  // Variabel untuk menyimpan informasi hewan
  final String nama;
  final String jenis;
  final String deskripsi;
  final String gambar;
  final List<String> galeri;

  // Constructor untuk mengisi data hewan
  Hewan({
    required this.nama,
    required this.jenis,
    required this.deskripsi,
    required this.gambar,
    required this.galeri,
  });
}