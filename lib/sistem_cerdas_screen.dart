import 'package:flutter/material.dart';

class SistemCerdasScreen extends StatefulWidget {
  const SistemCerdasScreen({super.key});

  @override
  State<SistemCerdasScreen> createState() => _SistemCerdasScreenState();
}

class _SistemCerdasScreenState extends State<SistemCerdasScreen> {
  late TextEditingController _promptController;

  @override
  void initState() {
    super.initState();
    _promptController = TextEditingController();
  }

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B0000), // Dark red
        foregroundColor: Colors.white,
        title: const Text(
          'Sistem Cerdas',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey[100]!.withValues(
          alpha: 1.0,
        ), // Light grey background
        child: Column(
          children: [
            // Course Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFF8B0000), // Dark red
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Course Title
                  Text(
                    'Sistem Cerdas',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Course Info
                  Row(
                    children: [
                      Expanded(
                        child: _buildCourseInfoCard('SKS', '3', Colors.white),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildCourseInfoCard(
                          'Semester',
                          '7',
                          Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildCourseInfoCard(
                          'Dosen',
                          'Dr. AI',
                          Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Course Content Tabs
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TabBar(
                labelColor: const Color(0xFF8B0000), // Dark red
                unselectedLabelColor: Colors.grey,
                indicator: BoxDecoration(
                  color: const Color(0xFF8B0000), // Dark red
                  borderRadius: BorderRadius.circular(12),
                ),
                tabs: const [
                  Tab(text: 'Materi'),
                  Tab(text: 'Tugas'),
                  Tab(text: 'Diskusi'),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Content Area - Fixed to prevent overflow
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TabBarView(
                  children: [
                    // Materi Tab - Wrapped in SingleChildScrollView
                    SingleChildScrollView(child: _buildMateriTab()),
                    // Tugas Tab - Wrapped in SingleChildScrollView
                    SingleChildScrollView(child: _buildTugasTab()),
                    // Diskusi Tab - Wrapped in SingleChildScrollView
                    SingleChildScrollView(child: _buildDiskusiTab()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _enhancePrompt() {
    String prompt = _promptController.text.trim();
    if (prompt.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a prompt to enhance.')),
      );
      return;
    }
    // Simple enhancement: rephrase and add context
    String enhanced =
        'Enhanced Prompt: Please provide a detailed explanation of $prompt, including examples and potential applications in artificial intelligence.';
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Enhanced Prompt'),
        content: Text(enhanced),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseInfoCard(String title, String value, Color textColor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMateriTab() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Materi Minggu Ini',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800]!.withValues(alpha: 1.0),
            ),
          ),
          const SizedBox(height: 10),
          // Changed from Expanded to regular ListView to prevent overflow
          SizedBox(
            height: 300, // Fixed height to prevent overflow
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFF8B0000), // Dark red
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Icon(
                            Icons.book,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Materi ${index + 1}: Artificial Intelligence',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Submateri: ${index + 1} item',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600]!.withValues(
                                    alpha: 1.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green[100]!.withValues(alpha: 1.0),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '100%',
                            style: TextStyle(
                              color: Colors.green[700]!.withValues(alpha: 1.0),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTugasTab() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Daftar Tugas',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800]!.withValues(alpha: 1.0),
            ),
          ),
          const SizedBox(height: 10),
          // Changed from Expanded to regular ListView to prevent overflow
          SizedBox(
            height: 300, // Fixed height to prevent overflow
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFF8B0000), // Dark red
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Icon(
                            Icons.assignment,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tugas ${index + 1}: Proyek AI',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Batas pengumpulan: 15 Jan 2025',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600]!.withValues(
                                    alpha: 1.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: index == 0
                                ? Colors.green[100]!.withValues(alpha: 1.0)
                                : Colors.orange[100]!.withValues(alpha: 1.0),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            index == 0 ? 'Selesai' : 'Belum',
                            style: TextStyle(
                              color: index == 0
                                  ? Colors.green[700]!.withValues(alpha: 1.0)
                                  : Colors.orange[700]!.withValues(alpha: 1.0),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiskusiTab() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Forum Diskusi',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800]!.withValues(alpha: 1.0),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _promptController,
            decoration: const InputDecoration(
              hintText: 'Type your prompt here',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: _enhancePrompt,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8B0000),
              foregroundColor: Colors.white,
            ),
            child: const Text('Enhance Prompt'),
          ),
          const SizedBox(height: 10),
          // Changed from Expanded to regular ListView to prevent overflow
          SizedBox(
            height: 200, // Reduced height to accommodate new elements
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.grey[300]!.withValues(alpha: 1.0),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.person,
                                size: 16,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Mahasiswa ${index + 1}',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '${index + 1}h',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey[600]!.withValues(alpha: 1.0),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Pertanyaan tentang ${index + 1} algoritma AI...',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[800]!.withValues(alpha: 1.0),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.comment,
                              size: 16,
                              color: Colors.grey[600]!.withValues(alpha: 1.0),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${index + 5}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600]!.withValues(alpha: 1.0),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Icon(
                              Icons.thumb_up,
                              size: 16,
                              color: Colors.grey[600]!.withValues(alpha: 1.0),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${index + 3}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600]!.withValues(alpha: 1.0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
