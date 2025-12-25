import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  // Header with university building image
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://www.telkomuniversity.ac.id/wp-content/uploads/2020/01/kampus-international-business-school-telkom-university.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Diagonal cut at the bottom of the header
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: ClipPath(
                          clipper: DiagonalClipper(),
                          child: Container(
                            height: 60,
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                      // Red circular logo with white 'T' floating at the boundary
                      Positioned(
                        bottom: -40,
                        left: MediaQuery.of(context).size.width / 2 - 40,
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                            color: Color(
                              0xFFb91c1c,
                            ), // Red maroon color as specified
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              'T',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // White body with login form
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(
                            height: 50,
                          ), // Space for the floating logo
                          // Login title with large bold text
                          Text(
                            'Login',
                            style: GoogleFonts.inter(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 30),

                          // Email input field with underlined style
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: const Color(
                                    0xFFb91c1c,
                                  ), // Red maroon underline
                                  width: 2,
                                ),
                              ),
                            ),
                            child: TextField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                labelText: 'Email 365',
                                labelStyle: TextStyle(
                                  color: Color(0xFFb91c1c), // Red maroon label
                                  fontSize: 16,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                              ),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Password input field with underlined style
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: const Color(
                                    0xFFb91c1c,
                                  ), // Red maroon underline
                                  width: 2,
                                ),
                              ),
                            ),
                            child: TextField(
                              controller: _passwordController,
                              obscureText: !_passwordVisible,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: const TextStyle(
                                  color: Color(0xFFb91c1c), // Red maroon label
                                  fontSize: 16,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: const Color(
                                      0xFFb91c1c,
                                    ), // Red maroon eye icon
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                              ),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                          ),

                          const SizedBox(height: 40),

                          // Login button with maroon color and pill shape
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color(
                                0xFFb91c1c,
                              ), // Red maroon color
                              borderRadius: BorderRadius.circular(
                                25,
                              ), // Pill-shaped
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextButton(
                              onPressed: () {
                                // Navigate to dashboard screen
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const DashboardScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Footer with red wave shape
                  Container(
                    height: 80,
                    child: ClipPath(
                      clipper: WaveClipper(),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFFb91c1c), // Red maroon color
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height); // Start from top left to bottom
    path.lineTo(size.width, size.height - 20); // Bottom right with diagonal cut
    path.lineTo(size.width, 0); // Top right
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height); // Start from top left to bottom

    final waveHeight = 20.0; // Increased wave height for more visual impact
    final waveLength = 50.0; // Increased wave length for smoother waves
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
