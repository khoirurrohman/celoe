import 'package:flutter/material.dart';
import 'dashboard_screen.dart'; // Import the dashboard screen

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section with UIM campus image and logo
            Container(
              height:
                  MediaQuery.of(context).size.height * 0.4, // Responsive height
              child: Stack(
                children: [
                  // UIM campus image with diagonal bottom edge
                  ClipPath(
                    clipper: DiagonalClipper(),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(
                          0xFF8B0000,
                        ), // Dark red background as placeholder
                        image: const DecorationImage(
                          image: NetworkImage(
                            'https://images.unsplash.com/photo-1517457373958-b7bdd4587205?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80',
                          ), // University campus image
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // Centered circular logo overlay
                  Center(
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                      child: Icon(Icons.school, size: 60, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            // Main Content Section
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 40.0,
              ),
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Login title
                  Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Email input field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey[300]!,
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'Email 365',
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 12.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),

                  // Password input field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey[300]!,
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 12.0,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey[600],
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),

                  // Login button
                  SizedBox(
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to dashboard after login
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const DashboardScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8B0000), // Dark red
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Help button below the login button
                  SizedBox(
                    height: 55,
                    child: OutlinedButton(
                      onPressed: () {
                        _showHelpModal(context);
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: const Color(0xFF8B0000), // Dark red border
                          width: 2.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        'Bantuan',
                        style: TextStyle(
                          fontSize: 16,
                          color: const Color(0xFF8B0000), // Dark red text
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Enhanced Footer Section with prominent wave design
            Container(
              height: 60,
              decoration: const BoxDecoration(
                color: Color(0xFF8B0000), // Dark red
              ),
              child: ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  color: const Color(0xFF8B0000), // Dark red
                  height: 60,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to show the help modal
  void _showHelpModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return HelpModal();
      },
    );
  }
}

// Help Modal Component
class HelpModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        width: MediaQuery.of(context).size.width * 0.8,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Language Selection Header
              Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Indonesian Flag Button
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: const Color(0xFF8B0000), // Dark red
                                  width: 2.0,
                                ),
                              ),
                            ),
                            child: const Text(
                              '🇮🇩',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'ID',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 30),
                    // English Flag Button
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            child: const Text(
                              '🇬🇧',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'EN',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Content Text
              Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  children: [
                    // Paragraph 1
                    Text(
                      'Akses ini hanya diperuntukkan bagi Dosen dan Mahasiswa Telkom University menggunakan Akun Microsoft Office 365.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Paragraph 2 (Account Instructions)
                    Text(
                      'Username: (Akun iGracias) + @365.telkomuniversity.ac.id\nPassword: Menggunakan password iGracias',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Paragraph 3 (Troubleshooting)
                    Text(
                      'Kegagalan autentikasi biasanya disebabkan karena belum mengubah password menjadi "Strong Password" di iGracias.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              // Contact Information Footer
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    Text(
                      'Informasi lebih lanjut dapat menghubungi Layanan CeLOE Helpdesk di:',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 10),

                    // Email Contact
                    Row(
                      children: [
                        const Icon(
                          Icons.email,
                          size: 16,
                          color: Color(0xFF8B0000), // Dark red
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Mail: info.celoe@telkomuniversity.ac.id',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // WhatsApp Contact
                    Row(
                      children: [
                        const Icon(
                          Icons.phone,
                          size: 16,
                          color: Color(0xFF8B0000), // Dark red
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'WhatsApp: +62 821-1966-8868',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Close Button
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B0000), // Dark red
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Tutup'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom clipper for diagonal bottom edge
class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(
      0,
      size.height - 50,
    ); // Start from top left, leave some space at bottom
    path.lineTo(size.width, size.height); // Go to bottom right
    path.lineTo(size.width, 0); // Go to top right
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

// Enhanced wave clipper for the footer
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height); // Start from top left to bottom

    final waveHeight = 15.0;
    final waveLength = 40.0;
    double yPos = 0;

    // Create multiple wave cycles across the width
    for (double i = 0; i <= size.width; i += waveLength) {
      // Create a wave pattern with cubic Bezier curves
      path.cubicTo(
        i + waveLength / 4,
        yPos,
        i + waveLength / 4,
        yPos - waveHeight,
        i + waveLength / 2,
        yPos,
      );

      path.cubicTo(
        i + waveLength * 3 / 4,
        yPos + waveHeight,
        i + waveLength * 3 / 4,
        yPos,
        i + waveLength,
        yPos,
      );
    }

    path.lineTo(size.width, 0); // Go to top right
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
