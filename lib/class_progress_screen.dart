import 'package:flutter/material.dart';

class ClassProgressScreen extends StatefulWidget {
  const ClassProgressScreen({super.key});

  @override
  State<ClassProgressScreen> createState() => _ClassProgressScreenState();
}

class _ClassProgressScreenState extends State<ClassProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B0000), // Dark red
        foregroundColor: Colors.white,
        title: const Text(
          'Progres Kelas',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey[100], // Light grey background
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: 4, // Show 4 example classes
          itemBuilder: (context, index) {
            // Sample class data
            String academicYear = index % 2 == 0 ? '2021/2' : '2022/1';
            String className = index % 2 == 0
                ? 'SISTEM OPERASI D4SM-44-02 [DDS]'
                : 'DESAIN ANTARMUKA D4SM-45-01 [DAP]';
            int progress = index % 2 == 0 ? 90 : 75;

            return Card(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left column: Class thumbnail
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFF8B0000), // Dark red
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.book,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 16),

                    // Right column: Class information
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Academic year
                          Text(
                            academicYear,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),

                          // Class name
                          Text(
                            className,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              letterSpacing: 0.5,
                            ),
                          ),

                          const SizedBox(height: 8),

                          // Progress bar
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: LinearProgressIndicator(
                              value: progress / 100,
                              backgroundColor: Colors.grey[300],
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xFF8B0000), // Dark red
                              ),
                              minHeight: 6,
                            ),
                          ),

                          const SizedBox(height: 4),

                          // Progress percentage
                          Text(
                            '$progress% Selesai',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
