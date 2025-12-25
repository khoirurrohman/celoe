import 'package:flutter/material.dart';
import 'login_screen.dart';

void main() {
  runApp(const CeLoeApp());
}

class CeLoeApp extends StatelessWidget {
  const CeLoeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CeLoe - Learning Management System',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFC2272D),
        ), // Telkom University red
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Splash Screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to login screen after 3 seconds to allow for better visual experience
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFC2272D,
      ), // Telkom University red background
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFC2272D), // Telkom University red
              const Color(0xFFA52A2D), // Slightly darker red
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Main Logo with enhanced styling - using the actual logo image
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.3),
                    width: 3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(75),
                  child: Image.asset(
                    'assets/images/celoe_logo.png',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      // Fallback to default icon if image fails to load
                      return const Icon(
                        Icons.school,
                        size: 80,
                        color: Colors.white,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // App name with enhanced styling using Feremost font
              Text(
                'ceLoe',
                style: TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: 2,
                  shadows: [
                    Shadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      offset: const Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              // Subtitle with enhanced styling
              Text(
                'Learning Management System',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withValues(alpha: 0.9),
                  letterSpacing: 1,
                  shadows: [
                    Shadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      offset: const Offset(1, 1),
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              // Loading indicator
              Container(
                width: 60,
                height: 60,
                padding: const EdgeInsets.all(8),
                child: CircularProgressIndicator(
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 3,
                ),
              ),
              const SizedBox(height: 20),
              // University branding
              Text(
                'Universitas Indonesia Maritim',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.white.withValues(alpha: 0.7),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
