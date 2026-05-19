import 'package:flutter/material.dart';

class TempKnowledgePage extends StatelessWidget {
  final String title;

  const TempKnowledgePage({
    super.key,
    required this.title,
  });

  static const Color primaryGreen = Color(0xFF173809);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: primaryGreen),
                  ),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: primaryGreen,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Center(
                child: Text(
                  "$title Screen",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: primaryGreen,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}