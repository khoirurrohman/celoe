import 'package:flutter/material.dart';

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
      body: Column(
        children: [
          // Header Section with image and logo
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                // Campus image with diagonal bottom edge
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
                          'https://images.unsplash.com/photo-1562774053-701939b10b0e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80',
                        ), // Telkom University style campus image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // Centered circular logo overlay
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Icon(Icons.school, size: 50, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          // Main Content Section
          Expanded(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.all(30.0),
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Login title
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Email input field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'Email 365',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color(0xFF8B0000), // Dark red accent
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey[300]!,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Password input field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _passwordController,
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color(0xFF8B0000), // Dark red accent
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey[300]!,
                              width: 1.0,
                            ),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey[500],
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),

                  // Login button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle login
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8B0000), // Dark red
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Help link
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Bantuan?',
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color(0xFF8B0000), // Dark red
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Footer Section with wavy shape
          Container(
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xFF8B0000), // Dark red
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: ClipPath(
              clipper: WavyClipper(),
              child: Container(
                color: const Color(0xFF8B0000), // Dark red
                height: 40,
              ),
            ),
          ),
        ],
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

// Custom clipper for wavy bottom edge
class WavyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height); // Start from top left to bottom

    final waveHeight = 10.0;
    final controlY1 = size.height - waveHeight;
    final controlY2 = size.height + waveHeight;

    for (double i = 0; i <= size.width; i += 40) {
      path.cubicTo(i + 10, controlY1, i + 20, controlY2, i + 30, size.height);
    }

    path.lineTo(size.width, 0); // Go to top right
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
