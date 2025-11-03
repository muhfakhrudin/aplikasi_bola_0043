import 'package:aplikasi_bola/login_page.dart';
import 'package:aplikasi_bola/tambah_player.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String email;
  const HomePage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.deepOrange,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'images/Logo_Persibo.png',
                    width: 40,
                    height: 40,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.sports_soccer,
                        size: 40,
                        color: Colors.white,
                      );
                    },
                  ),
                  const Text(
                    'Persibo Bola Mania',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.logout, color: Colors.white),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                        (route) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Jadwal Pertandingan Persebo',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Text(
                                'Persibo',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'vs',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Persela',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Tanggal: 20 Juni 2024, Pukul: 19.00 WIB',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Lokasi: Stadion Letjen H. Soedirman Bojonegoro',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Menu',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TambahPlayerPage(),
                              ),
                            );
                          },
                          child: _buildMenuIcon(Icons.person, 'Player'),
                        ),
                        _buildMenuIcon(Icons.access_time, 'Jadwal'),
                        _buildMenuIcon(Icons.bar_chart, 'Klasemen'),
                        _buildMenuIcon(Icons.shopping_bag, 'Merchandise'),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Berita Terbaru Persebo',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildNewsCard(
                            'Persiapan Liga 3 Nusantara',
                            'Persibo Bojonegoro sedang menyusun ulang program persiapan mereka. Ini dilakukan menjelang dimulainya Liga 3 Nusantara yang akan digelar pada 1 Desember 2025.',
                          ),
                          const SizedBox(width: 16),
                          _buildNewsCard(
                            'Persiapan Liga 3 Nusantara',
                            'Persibo Bojonegoro sedang menyusun ulang program persiapan mereka. Ini dilakukan menjelang dimulainya Liga 3 Nusantara yang akan digelar pada 1 Desember 2025.',
                          ),
                          const SizedBox(width: 16),
                          _buildNewsCard(
                            'Persiapan Liga 3 Nusantara',
                            'Persibo Bojonegoro sedang menyusun ulang program persiapan mereka. Ini dilakukan menjelang dimulainya Liga 3 Nusantara yang akan digelar pada 1 Desember 2025.',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(child: Icon(icon, size: 35, color: Colors.lightBlue)),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildNewsCard(String title, String description) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.justify,
            style: const TextStyle(fontSize: 14),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
