import 'package:flutter/material.dart';
import 'class_progress_screen.dart'; // Import the class progress screen
import 'profile_screen.dart'; // Import the profile screen
import 'my_classes_screen.dart'; // Import the my classes screen
import 'notifications_screen.dart'; // Import the notifications screen

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // --- HEADER & BODY ---
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Custom Header
            Container(
              padding: const EdgeInsets.only(
                top: 50,
                left: 20,
                right: 20,
                bottom: 20,
              ),
              color: const Color(0xFFB91C1C),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hallo,",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        "DANDY CANDRA PRATAMA",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Text(
                          "MAHASISWA",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.account_circle, color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // 2. Tugas Yang Akan Datang
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Tugas Yang Akan Datang",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFB91C1C),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                children: [
                  Text(
                    "DESAIN ANTARMUKA & PENGALAMAN PENGGUNA",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Tugas 01 - UID Android Mobile Game",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Waktu Pengumpulan",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Jumat 26 Februari, 23:59 WIB",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),

            // 3. Pengumuman Terakhir
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Pengumuman Terakhir",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Lihat Semua",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 150,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://via.placeholder.com/400x150',
                  ), // Ganti dengan gambar maintenance
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // 4. Progres Kelas
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Progres Kelas",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            _buildClassProgress(
              "UI/UX",
              "2021/2 DESAIN ANTARMUKA & PENGALAMAN PENGGUNA",
              "89 %",
              0.89,
              Colors.orange,
            ),
            _buildClassProgress(
              "KWN",
              "2021/2 KEWARGANEGARAAN",
              "86 %",
              0.86,
              Colors.red,
            ),
            _buildClassProgress(
              "SO",
              "2021/2 SISTEM OPERASI",
              "90 %",
              0.90,
              Colors.grey,
            ),
            _buildClassProgress(
              "PPM",
              "2021/2 PEMROGRAMAN PERANGKAT BERGERAK",
              "90 %",
              0.90,
              Colors.cyan,
            ),

            const SizedBox(
              height: 100,
            ), // Memberi ruang agar tidak tertutup Navbar
          ],
        ),
      ),

      // --- BOTTOM NAVIGATION BAR DENGAN LENGKUNGAN ---
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipPath(
            clipper: BottomNavClipper(),
            child: Container(
              height: 90,
              color: const Color(0xFFB91C1C),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _navItem(Icons.home, "Home"),
                  _navItem(Icons.school, "Kelas Saya"),
                  _navItem(Icons.notifications, "Notifikasi"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk List Progres Kelas
  Widget _buildClassProgress(
    String code,
    String title,
    String percentText,
    double value,
    Color iconColor,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                code,
                style: TextStyle(color: iconColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: value,
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Color(0xFFB91C1C),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "$percentText Selesai",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget Item Navbar
  Widget _navItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white, size: 28),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}

// Clipper untuk lengkungan atas Bottom Navigation Bar
class BottomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 30);
    path.quadraticBezierTo(size.width / 2, -10, size.width, 30);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
