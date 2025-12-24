import 'package:flutter/material.dart';

class TelkomLoginScreen extends StatefulWidget {
  const TelkomLoginScreen({super.key});

  @override
  State<TelkomLoginScreen> createState() => _TelkomLoginScreenState();
}

class _TelkomLoginScreenState extends State<TelkomLoginScreen> {
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
            // Header Section with Telkom University campus image
            Container(
              height:
                  MediaQuery.of(context).size.height *
                  0.35, // 35% of screen height
              child: Stack(
                children: [
                  // Telkom University campus image
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFC2272D), // Telkom red
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Telkom_University_Icon.svg/1200px-Telkom_University_Icon.png',
                        ), // Placeholder for Telkom University campus image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Centered circular logo with 'U' overlay
                  Positioned(
                    bottom: -40, // Position it to overlap the content area
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFFC2272D), // Telkom red
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            'U',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Main Content Section (with padding to account for overlapping logo)
            SizedBox(height: 50), // Space for overlapping logo
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Login title
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Email input field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email 365',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey[600],
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
                            hintText: '',
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
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey[600],
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
                            hintText: '',
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
                        // Handle login
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC2272D), // Telkom red
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30), // Pill shape
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Help link
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Bantuan ?',
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color(0xFFC2272D), // Telkom red
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Footer Section with wave design
            Container(
              height: 60,
              decoration: const BoxDecoration(
                color: Color(0xFFC2272D), // Telkom red
              ),
              child: ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  color: const Color(0xFFC2272D), // Telkom red
                  height: 60,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Wave clipper for the footer
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
