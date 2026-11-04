import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:latihanuts_pab/providers/auth_provider.dart';
import 'package:latihanuts_pab/providers/favorite_providers.dart';
import 'package:latihanuts_pab/screens/signin_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _showEditNameDialog(BuildContext context, String currentNama) {
    final controller = TextEditingController(text: currentNama);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Ubah Nama'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Masukkan nama baru',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                context.read<AuthProvider>().updateNama(controller.text);
                Navigator.pop(context);
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = context.watch<FavoriteProvider>();
    final authProvider = context.watch<AuthProvider>();
    final isLoggedIn = authProvider.isLoggedIn;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner Ungu dan Foto Profil Lingkaran Overlap
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  // Banner background warna ungu di bagian atas
                  Container(
                    height: 150,
                    width: double.infinity,
                    color: Colors.deepPurple,
                  ),

                  // Avatar foto profil di tengah bertumpuk di batas banner
                  Positioned(
                    top: 90,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 45,
                              backgroundColor: Colors.grey.shade300,
                              child: Icon(
                                Icons.person,
                                size: 60,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            // Ikon Kamera Kecil di kanan bawah foto profil
                            Positioned(
                              bottom: 2,
                              right: 2,
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 16,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Informasi Pengguna (Pengguna, Nama, Favorit)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // Baris Pengguna
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        const Icon(Icons.lock, color: Colors.amber),
                        const SizedBox(width: 16),
                        const Text(
                          'Pengguna',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          isLoggedIn ? ': ${authProvider.username}' : ':',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                  const Divider(height: 1),

                  // Baris Nama (dilengkapi tombol edit jika sudah login)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        const Icon(Icons.person, color: Colors.blue),
                        const SizedBox(width: 16),
                        const Text(
                          'Nama',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          isLoggedIn ? ': ${authProvider.nama}' : ':',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (isLoggedIn)
                          IconButton(
                            icon: const Icon(Icons.edit, size: 20),
                            onPressed: () => _showEditNameDialog(context, authProvider.nama),
                          )
                        else
                          const SizedBox(width: 8),
                      ],
                    ),
                  ),
                  const Divider(height: 1),

                  // Baris Favorit
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        const Icon(Icons.favorite, color: Colors.red),
                        const SizedBox(width: 16),
                        const Text(
                          'Favorit',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          isLoggedIn ? ': ${favoriteProvider.count}' : ':',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Tombol Sign In / Sign Out
            TextButton(
              onPressed: () {
                if (isLoggedIn) {
                  context.read<AuthProvider>().logout();
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ),
                  );
                }
              },
              child: Text(
                isLoggedIn ? 'Sign Out' : 'Sign In',
                style: TextStyle(
                  fontSize: 16,
                  color: isLoggedIn ? Colors.grey.shade700 : Colors.deepPurple,
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
