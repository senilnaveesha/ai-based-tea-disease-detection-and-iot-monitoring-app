import 'package:flutter/material.dart';

class TeaGradesScreen extends StatelessWidget {
  const TeaGradesScreen({super.key});

  static const Color primaryGreen = Color(0xFF173809);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _topBar(context),
              _hero(),
              _introCard(),

              _gradeCard(
                grade: "OP",
                title: "Orange Pekoe",
                description:
                    "Long, wiry leaves without tips. Produces a light, delicate liquor with floral notes.",
                tags: ["LARGE LEAF", "5-7 MIN BREW"],
                strength: 1,
                bottomColor: const Color(0xFFB7F0A8),
              ),

              _gradeCard(
                grade: "BOP",
                title: "Broken Orange\nPekoe",
                description:
                    "Smaller broken leaves. Offers a much stronger flavor and darker infusion than OP.",
                tags: ["BROKEN LEAF", "3-4 MIN BREW"],
                strength: 2,
                bottomColor: primaryGreen,
              ),

              _gradeCard(
                grade: "BOPF",
                title: "BOP Fannings",
                description:
                    "Very small particles. Quick brewing with robust color. Ideal for high-quality tea bags.",
                tags: ["FANNINGS", "2-3 MIN BREW"],
                strength: 3,
                bottomColor: primaryGreen,
              ),

              _gradeCard(
                grade: "DUST 1",
                title: "Dust No. 1",
                description:
                    "The finest tea particles. Maximum strength and color intensity instantly.",
                tags: ["FINE DUST", "1-2 MIN BREW"],
                strength: 4,
                bottomColor: Colors.red,
              ),

              const Padding(
                padding: EdgeInsets.fromLTRB(24, 28, 24, 16),
                child: Row(
                  children: [
                    Icon(Icons.analytics_outlined, color: primaryGreen),
                    SizedBox(width: 8),
                    Text(
                      "Efficiency Matrix",
                      style: TextStyle(
                        color: primaryGreen,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              _matrix(),

              _quoteCard(),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topBar(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: primaryGreen),
            onPressed: () => Navigator.pop(context),
          ),
          const Expanded(
            child: Center(
              child: Text(
                "Ceylon Tea Smart",
                style: TextStyle(
                  color: primaryGreen,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _hero() {
    return Stack(
      children: [
        Image.asset(
          "assets/images/g1.png",
          height: 280,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          height: 280,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.05),
                primaryGreen.withOpacity(0.75),
              ],
            ),
          ),
        ),
        const Positioned(
          left: 26,
          bottom: 35,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "SMART KNOWLEDGE HUB",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  letterSpacing: 1.4,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Understanding Tea\nGrades",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  height: 1.15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _introCard() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 36, 24, 28),
      child: Container(
        padding: const EdgeInsets.all(26),
        decoration: BoxDecoration(
          color: const Color(0xFFF1F4F1),
          borderRadius: BorderRadius.circular(22),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "The Grading Standard",
              style: TextStyle(
                color: primaryGreen,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 18),
            Text(
              "Tea grading is a systematic method of evaluating tea leaves based primarily on their size and physical style. While often confused with flavor profile, grading primarily dictates how the leaf interacts with water — determining infusion speed and color intensity.",
              style: TextStyle(
                fontSize: 20,
                height: 1.65,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gradeCard({
    required String grade,
    required String title,
    required String description,
    required List<String> tags,
    required int strength,
    required Color bottomColor,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 22),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border(
            bottom: BorderSide(color: bottomColor, width: 5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 68,
              height: 68,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: primaryGreen,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                grade,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(width: 18),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            color: primaryGreen,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        ),
                      ),
                      _strengthDots(strength),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.45,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 14),

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: tags.map((tag) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 11,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: primaryGreen,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Text(
                          tag,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _strengthDots(int strength) {
    final isDust = strength == 4;

    return Row(
      children: List.generate(4, (index) {
        final active = index < strength;
        return Container(
          margin: const EdgeInsets.only(left: 4),
          width: 9,
          height: 9,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: active
                ? (isDust ? Colors.red : primaryGreen)
                : Colors.grey.shade300,
          ),
        );
      }),
    );
  }

  Widget _matrix() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Column(
          children: [
            Container(
              color: primaryGreen,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              child: const Row(
                children: [
                  Expanded(child: Text("GRADE", style: _headerStyle)),
                  Expanded(child: Text("LEAF SIZE", style: _headerStyle)),
                  Expanded(child: Text("STRENGTH", style: _headerStyle)),
                ],
              ),
            ),
            Container(
              color: const Color(0xFFE9ECE8),
              child: Column(
                children: [
                  _matrixRow("OP", "Large", 1, false),
                  _matrixRow("BOP", "Medium", 2, false),
                  _matrixRow("BOPF", "Fine", 3, false),
                  _matrixRow("Dust", "Fine Dust", 3, true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _matrixRow(String grade, String leaf, int dots, bool red) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      child: Row(
        children: [
          Expanded(
            child: Text(
              grade,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            child: Text(
              leaf,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
          Expanded(
            child: Row(
              children: List.generate(3, (index) {
                final active = index < dots;
                return Container(
                  margin: const EdgeInsets.only(right: 6),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: active
                        ? (red ? Colors.red : primaryGreen)
                        : Colors.grey.shade300,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _quoteCard() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 30, 24, 0),
      child: Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: const Color(0xFFEAF7E7),
          borderRadius: BorderRadius.circular(14),
          border: const Border(
            left: BorderSide(color: primaryGreen, width: 4),
          ),
        ),
        child: const Text(
          "Smaller tea particles release tannins and color faster, resulting in a stronger, darker brew. High-altitude estates often prioritize OP for quality-focused loose leaf tea.",
          style: TextStyle(
            color: primaryGreen,
            fontSize: 16,
            height: 1.6,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

const TextStyle _headerStyle = TextStyle(
  color: Colors.white,
  fontSize: 13,
  letterSpacing: 1.6,
  fontWeight: FontWeight.bold,
);