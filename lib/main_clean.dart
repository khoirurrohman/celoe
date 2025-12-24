import 'package:flutter/material.dart';

void main() {
  runApp(const CeLoeSplashScreen());
}

class CeLoeSplashScreen extends StatelessWidget {
  const CeLoeSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CeLoe - Learning Management System',
      theme: ThemeData(useMaterial3: true),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8B0000), // Dark red background
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo text "ceLoe"
              Text(
                'ceLoe',
                style: TextStyle(
                  fontSize: 64.0,
                  fontWeight: FontWeight.w300, // Light weight for modern look
                  color: Colors.white,
                  fontFamily: 'Roboto', // Modern rounded font
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 16.0),
              // Subtitle "Learning Management System"
              Text(
                'Learning Management System',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.white70,
                  fontFamily: 'Roboto',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
