import 'package:flutter/material.dart';

class TeaMadeScreen extends StatelessWidget {
  const TeaMadeScreen({super.key});

  static const Color primaryGreen = Color(0xFF173809);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _topBar(context),
              _hero(),

              const Padding(
                padding: EdgeInsets.fromLTRB(28, 28, 28, 18),
                child: Row(
                  children: [
                    Text(
                      "01",
                      style: TextStyle(
                        color: Colors.black12,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      "The Art of Production",
                      style: TextStyle(
                        color: primaryGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              _timeline(),

              const SizedBox(height: 30),

              Container(
                color: const Color(0xFFF0F3EF),
                padding: const EdgeInsets.fromLTRB(24, 36, 24, 36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          "02",
                          style: TextStyle(
                            color: Colors.black12,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(
                          "Holistic Benefits",
                          style: TextStyle(
                            color: primaryGreen,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 22),

                    GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: 0.9,
                      children: const [
                        _BenefitCard(
                          icon: Icons.shield_outlined,
                          title: "Rich in Antioxidants",
                          text:
                              "Protects the body from damage caused by harmful free radicals.",
                        ),
                        _BenefitCard(
                          icon: Icons.bolt,
                          title: "Boosts Energy",
                          text:
                              "Naturally contains caffeine for focus, alertness, and energy.",
                        ),
                        _BenefitCard(
                          icon: Icons.favorite_border,
                          title: "Supports Heart Health",
                          text:
                              "Helps maintain healthy blood circulation and cardiovascular health.",
                        ),
                        _BenefitCard(
                          icon: Icons.spa_outlined,
                          title: "Reduces Stress",
                          text:
                              "Calming compounds that help relaxation and mental calm.",
                        ),
                        _BenefitCard(
                          icon: Icons.local_drink_outlined,
                          title: "Supports Digestion",
                          text:
                              "Helps improve digestion and reduces stomach discomfort.",
                        ),
                        _BenefitCard(
                          icon: Icons.security,
                          title: "Strengthens Immunity",
                          text:
                              "Natural compounds that may support the immune system.",
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              _ctaCard(),
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
                  letterSpacing: 1.6,
                  fontSize: 13,
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
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Image.asset(
              "assets/images/sb1.png",
              height: 310,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 310,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.05),
                  primaryGreen.withOpacity(0.72),
                ],
              ),
            ),
          ),
          const Positioned(
            left: 22,
            bottom: 35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "From Soil to\nCup",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    height: 1.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                SizedBox(
                  width: 260,
                  child: Text(
                    "The intricate journey of the Camellia sinensis leaf, from the mountain peaks to your morning ritual.",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      height: 1.45,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _timeline() {
    final steps = [
      {
        "title": "Plucking",
        "image": "assets/images/sb2.png",
        "text":
            "Fresh tea leaves are carefully hand-plucked. Usually, only the top two leaves and the bud are selected to maintain high quality.",
      },
      {
        "title": "Withering",
        "image": "assets/images/sb3.png",
        "text":
            "The freshly plucked leaves are spread out to reduce moisture content and prepare them for rolling.",
      },
      {
        "title": "Rolling",
        "image": "assets/images/sb4.png",
        "text":
            "Tea leaves are rolled to break the leaf structure and release natural enzymes that help develop flavor and aroma.",
      },
      {
        "title": "Oxidation / Fermentation",
        "image": "assets/images/sb5.png",
        "text":
            "The leaves are exposed to air, causing oxidation that changes the color and flavor of the tea.",
      },
      {
        "title": "Drying",
        "image": "assets/images/sb6.png",
        "text":
            "Tea leaves are dried using heated air to stop oxidation and preserve flavor.",
      },
      {
        "title": "Sorting & Grading",
        "image": "assets/images/sb7.png",
        "text":
            "Processed tea leaves are sorted into different grades based on size and appearance.",
      },
      {
        "title": "Packaging & Export",
        "image": "assets/images/sb8.png",
        "text":
            "The final tea products are packed and prepared for local use and international export markets.",
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: List.generate(steps.length, (index) {
          final step = steps[index];
          final isLast = index == steps.length - 1;

          return IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: 14,
                      height: 14,
                      decoration: const BoxDecoration(
                        color: primaryGreen,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Container(
                          width: 5,
                          height: 5,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    if (!isLast)
                      Expanded(
                        child: Container(
                          width: 2,
                          color: const Color(0xFFDCE5DA),
                        ),
                      ),
                  ],
                ),

                const SizedBox(width: 24),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 26),
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F4F1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              step["image"]!,
                              height: 145,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            step["title"]!,
                            style: const TextStyle(
                              color: primaryGreen,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 7),
                          Text(
                            step["text"]!,
                            style: const TextStyle(
                              color: Colors.black87,
                              height: 1.55,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _ctaCard() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(42, 38, 42, 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: primaryGreen,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Cultivating Excellence",
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Every leaf at Verdant Estate is a testament to our commitment to pure, sustainable tea production.",
              style: TextStyle(
                color: Colors.white70,
                height: 1.5,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFDFF3D8),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Text(
                "DOWNLOAD GUIDE",
                style: TextStyle(
                  color: primaryGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BenefitCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;

  const _BenefitCard({
    required this.icon,
    required this.title,
    required this.text,
  });

  static const Color primaryGreen = Color(0xFF173809);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: primaryGreen, size: 20),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              color: primaryGreen,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(
              color: Colors.black87,
              height: 1.45,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}