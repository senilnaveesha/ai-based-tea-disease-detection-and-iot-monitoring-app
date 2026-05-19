import 'package:flutter/material.dart';

class TeaRegionsScreen extends StatelessWidget {
  const TeaRegionsScreen({super.key});

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

              _regionCard(
                image: "assets/images/p2.png",
                tag: "HIGH-GROWN",
                title: "Nuwara Eliya",
                badge: "Champagne of Teas",
                leftLabel: "FLAVOR PROFILE",
                leftValue: "Floral and delicate",
                rightLabel: "CLIMATE",
                rightValue: "Cool & misty climate",
                description:
                    "Perched at the highest altitudes, this region produces tea with a delicate clarity. The unique combination of elevation and cool winds creates a refined vintage celebrated globally for its golden liquor and exquisite aroma.",
              ),

              _regionCard(
                image: "assets/images/p3.png",
                tag: "MID-TO-HIGH GROWN",
                title: "Uva",
                leftLabel: "FLAVOR PROFILE",
                leftValue: "Exotic & Pungent",
                rightLabel: "CLIMATE",
                rightValue: "Dry seasonal winds",
                description:
                    "Exposed to both monsoon seasons, Uva teas are world-renowned for their unique character. The dry winds during the quality season impart an unmistakable mellow pungency and exotic floral notes.",
              ),

              _regionCard(
                image: "assets/images/p4.png",
                tag: "HIGH-GROWN",
                title: "Dimbula",
                leftLabel: "FLAVOR PROFILE",
                leftValue: "Jasmine & Refreshing",
                rightLabel: "BODY",
                rightValue: "Full-bodied",
                description:
                    "Historically one of the first areas planted in the 1870s, Dimbula covers the western slopes of the highlands. The monsoon rains result in a tea that is wonderfully full-bodied yet remarkably refreshing.",
              ),

              _regionCard(
                image: "assets/images/p5.png",
                tag: "MID-GROWN",
                title: "Kandy",
                leftLabel: "FLAVOR PROFILE",
                leftValue: "Strong & Malty",
                rightLabel: "LIQUOR COLOR",
                rightValue: "Deep Copper",
                description:
                    "The birthplace of Ceylon tea, where James Taylor first planted tea at Loolecondera. These mid-grown teas are prized for being strong and full-bodied, producing a robust liquor that satisfies the palate.",
              ),

              _regionCard(
                image: "assets/images/p6.png",
                tag: "LOW-GROWN",
                title: "Ruhuna",
                leftLabel: "FLAVOR PROFILE",
                leftValue: "Malty & Sweet",
                rightLabel: "CHARACTER",
                rightValue: "Unique Blackness",
                description:
                    "Nurtured by the rich soil and high humidity of the southern plains, Ruhuna teas develop a distinctive deep black leaf. The result is a cup of exceptional strength and natural sweetness that is highly sought after.",
              ),

              _regionCard(
                image: "assets/images/p7.png",
                tag: "LOW-GROWN",
                title: "Sabaragamuwa",
                leftLabel: "FLAVOR PROFILE",
                leftValue: "Smooth & Mellow",
                rightLabel: "GROWTH",
                rightValue: "Fast-growing leaves",
                description:
                    "Sri Lanka’s largest tea-growing district, Sabaragamuwa produces a fast-growing, long leaf. The resulting tea is exceptionally smooth, full-bodied, and carries a hint of caramel that lingers on the palate.",
              ),
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
                  fontSize: 16,
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 22),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Image.asset(
              "assets/images/p1.png",
              height: 340,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              height: 340,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.05),
                    Colors.black.withOpacity(0.65),
                  ],
                ),
              ),
            ),
            const Positioned(
              left: 20,
              bottom: 28,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "The Seven Terroirs",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Exploring Sri Lanka’s Geographical Heritage",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _regionCard({
    required String image,
    required String tag,
    required String title,
    String? badge,
    required String leftLabel,
    required String leftValue,
    required String rightLabel,
    required String rightValue,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 22),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(14),
                  ),
                  child: Image.asset(
                    image,
                    height: 190,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 12,
                  top: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: primaryGreen.withOpacity(0.85),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      tag,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: primaryGreen,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  if (badge != null) ...[
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFDFF3D8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        badge,
                        style: const TextStyle(
                          color: primaryGreen,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: _infoPair(leftLabel, leftValue),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: _infoPair(rightLabel, rightValue),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  Container(
                    padding: const EdgeInsets.only(left: 12),
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Color(0xFFB7E4C7),
                          width: 3,
                        ),
                      ),
                    ),
                    child: Text(
                      description,
                      style: const TextStyle(
                        fontSize: 13,
                        height: 1.7,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoPair(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 9,
            letterSpacing: 1.2,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}