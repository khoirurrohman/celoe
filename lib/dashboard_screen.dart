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
                bottom: 30,
              ),
              color: const Color(0xFFB91C1C),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          // Add menu functionality if needed
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          // Navigate to notifications screen
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const NotificationsScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/celoe_logo.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Selamat Datang!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Di CeLoe - Learning Management System',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),

            // 2. Quick Actions
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildQuickAction(Icons.school, 'Kelas Saya', () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MyClassesScreen(),
                      ),
                    );
                  }),
                  _buildQuickAction(Icons.notifications, 'Notifikasi', () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const NotificationsScreen(),
                      ),
                    );
                  }),
                  _buildQuickAction(Icons.person, 'Profil', () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    );
                  }),
                ],
              ),
            ),

            // 3. Dashboard Grid
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildDashboardCard(
                    'Tugas Yang Akan Datang',
                    Icons.assignment,
                    Colors.blue,
                    () {
                      // Navigate to assignments
                    },
                  ),
                  _buildDashboardCard(
                    'Pengumuman',
                    Icons.announcement,
                    Colors.green,
                    () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const NotificationsScreen(),
                        ),
                      );
                    },
                  ),
                  _buildDashboardCard(
                    'Progres Kelas',
                    Icons.school,
                    Colors.orange,
                    () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MyClassesScreen(),
                        ),
                      );
                    },
                  ),
                  _buildDashboardCard(
                    'Jadwal',
                    Icons.calendar_today,
                    Colors.purple,
                    () {
                      // Navigate to schedule
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 80), // Space for bottom navigation
          ],
        ),
      ),

      // Bottom Navigation Bar with Wave Shape
      bottomNavigationBar: ClipPath(
        clipper: WaveClipper(),
        child: Container(
          height: 80,
          decoration: const BoxDecoration(
            color: Color(0xFF8B0000), // Dark red
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildBottomNavItem(Icons.home, 'Home', true), // Active
              GestureDetector(
                onTap: () {
                  // Navigate to my classes screen
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MyClassesScreen(),
                    ),
                  );
                },
                child: _buildBottomNavItem(Icons.school, 'Kelas Saya', false),
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to notifications screen
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const NotificationsScreen(),
                    ),
                  );
                },
                child: _buildBottomNavItem(
                  Icons.notifications,
                  'Notifikasi',
                  false,
                ),
              ),
            ],
          ),
        ),
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
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(milliseconds: 1200),
        curve: Curves.easeIn,
        builder: (context, opacity, child) =>
            Opacity(opacity: opacity, child: child),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: iconColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(icon, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      code,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600]!.withValues(alpha: 1.0),
                      ),
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800]!.withValues(alpha: 1.0),
                      ),
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0, end: value),
                        duration: const Duration(seconds: 2),
                        curve: Curves.easeInOut,
                        builder: (context, animatedValue, child) {
                          return LinearProgressIndicator(
                            value: animatedValue,
                            backgroundColor: Colors.grey[300]!.withValues(
                              alpha: 1.0,
                            ),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xFF8B0000), // Dark red
                            ),
                            minHeight: 4,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "$percentText Selesai",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey[600]!.withValues(alpha: 1.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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

  Widget _buildBottomNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isActive
              ? Colors.white
              : Colors.white.withValues(alpha: 0.7), // Active state
          size: isActive ? 28 : 24, // Active state
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isActive
                ? Colors.white
                : Colors.white.withValues(alpha: 0.7), // Active state
            fontSize: 12,
            fontWeight: isActive
                ? FontWeight.bold
                : FontWeight.w500, // Active state
          ),
        ),
      ],
    );
  }

  Widget _buildQuickAction(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: const Color(0xFFB91C1C), size: 32),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              child: Icon(icon, color: Colors.white, size: 30),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// Wave clipper for the bottom navigation bar
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 20); // Start from top left

    // Create wave pattern for the top of the bottom bar
    final waveHeight = 20.0;
    final waveLength = 60.0;

    for (double i = 0; i <= size.width; i += waveLength) {
      if (i <= size.width / 2) {
        // Left side of the wave (concave down)
        path.quadraticBezierTo(
          i + waveLength / 2,
          size.height - 20 + waveHeight,
          i + waveLength,
          size.height - 20,
        );
      } else {
        // Right side of the wave (concave down)
        path.quadraticBezierTo(
          i + waveLength / 2,
          size.height - 20 + waveHeight,
          i + waveLength,
          size.height - 20,
        );
      }
    }

    path.lineTo(size.width, 0); // Go to top right
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
