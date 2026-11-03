// Menghubungkan file data dengan model Hewan
import 'package:latihanuts_pab/models/hewan.dart';

// Daftar data hewan yang akan ditampilkan di aplikasi
final List<Hewan> daftarHewan = [
  Hewan(
    nama: 'Kucing',
    jenis: 'Mamalia',
    deskripsi: 'Kucing merupakan hewan peliharaan yang lucu dan suka bermain.',
    gambar: 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba',
    galeri: [
      'https://images.unsplash.com/photo-1573865526739-10659fec78a5',
      'https://images.unsplash.com/photo-1495360010541-f48722b34f7d',
    ],
  ),

  Hewan(
    nama: 'Anjing',
    jenis: 'Mamalia',
    deskripsi: 'Anjing dikenal sebagai hewan yang setia dan bersahabat.',
    gambar: 'https://images.unsplash.com/photo-1552053831-71594a27632d',
    galeri: [
      'https://images.unsplash.com/photo-1543466835-00a7907e9de1',
      'https://images.unsplash.com/photo-1517849845537-4d257902454a',
    ],
  ),

  Hewan(
    nama: 'Kelinci',
    jenis: 'Mamalia',
    deskripsi: 'Kelinci memiliki telinga panjang dan suka memakan sayuran.',
    gambar: 'https://images.unsplash.com/photo-1585110396000-c9ffd4e4b308',
    galeri: [
      'https://images.unsplash.com/photo-1535241749838-299277b6305f',
      'https://images.unsplash.com/photo-1583301286816-f4f05e1e8b25',
    ],
  ),

  Hewan(
    nama: 'Rubah',
    jenis: 'Mamalia',
    deskripsi: 'Rubah merupakan hewan liar yang dikenal dengan ekornya yang lebat.',
    gambar: 'https://images.unsplash.com/photo-1474511320723-9a56873867b5',
    galeri: [
      'https://images.unsplash.com/photo-1516934024742-b461fba47600',
      'https://images.unsplash.com/photo-1509391366360-2e959784a276',
    ],
  ),
];