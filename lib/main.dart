import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_screen.dart'; // Import the login screen

void main() {
  runApp(const CeLoeApp());
}

class CeLoeApp extends StatelessWidget {
  const CeLoeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CeLoe - Learning Management System',
      theme: ThemeData(useMaterial3: true),
      home: const LoginScreen(), // Changed to LoginScreen
      debugShowCheckedModeBanner: false,
    );
  }
}
