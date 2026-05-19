import 'package:flutter/material.dart';

class TypesOfTeaScreen extends StatelessWidget {
  const TypesOfTeaScreen({super.key});

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

              const Padding(
                padding: EdgeInsets.fromLTRB(24, 22, 24, 0),
                child: Text(
                  "THE DIGITAL AGRONOMIST",
                  style: TextStyle(
                    letterSpacing: 4,
                    fontSize: 12,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.fromLTRB(24, 12, 24, 0),
                child: Text(
                  "Types of Tea",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: primaryGreen,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(24, 8, 0, 25),
                child: Container(
                  width: 45,
                  height: 3,
                  color: primaryGreen,
                ),
              ),

              _teaCard(
                image: "assets/images/tt1.png",
                tag: "OXIDIZED",
                title: "Black Tea",
                flavor: "Malty & Rich",
                description:
                    "Bold, fully oxidized, and robust. These leaves undergo complete fermentation, resulting in a dark liquor with deep, complex tannins and energizing strength.",
                profile: "PROFILE: MALTY, COCOA, SMOKE",
                tagColor: primaryGreen,
              ),

              _teaCard(
                image: "assets/images/tt2.png",
                tag: "MINIMAL",
                title: "Green Tea",
                flavor: "Fresh & Grassy",
                description:
                    "Fresh, grassy, and minimally processed. By pan-firing or steaming leaves immediately after harvest, oxidation is halted to preserve natural antioxidants and vibrant color.",
                profile: "PROFILE: VEGETAL, NUTTY, SWEET",
                tagColor: primaryGreen,
              ),

              _teaCard(
                image: "assets/images/tt3.png",
                tag: "YOUNG BUDS",
                title: "White Tea",
                flavor: "Delicate & Subtle",
                description:
                    "The least processed of all teas, made from young buds and leaves. It offers a light, silken texture and a subtle, naturally sweet complexity.",
                profile: "PROFILE: HONEY, FLORAL, MELON",
                tagColor: Colors.blueGrey,
              ),

              _teaCard(
                image: "assets/images/tt4.png",
                tag: "COMPLEX",
                title: "Oolong Tea",
                flavor: "Floral & Layered",
                description:
                    "Partially oxidized, striking a perfect balance between green and black tea. These leaves are often bruised and rolled to develop multi-layered, evolving aromas.",
                profile: "PROFILE: ORCHID, CREAM, TOASTED",
                tagColor: const Color(0xFFD9A48F),
              ),

              _teaCard(
                image: "assets/images/tt5.png",
                tag: "TISANE",
                title: "Herbal Tea",
                flavor: "Soothing & Fruit",
                description:
                    "Caffeine-free infusions of herbs, fruits, and spices. These \"tisanes\" offer a vast spectrum of therapeutic benefits and purely natural, refreshing flavor profiles.",
                profile: "PROFILE: MINT, BERRY, EARTHY",
                tagColor: primaryGreen,
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
                "CEYLON TEA SMART",
                style: TextStyle(
                  color: primaryGreen,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
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

  Widget _teaCard({
    required String image,
    required String tag,
    required String title,
    required String flavor,
    required String description,
    required String profile,
    required Color tagColor,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 34),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  image,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                left: 12,
                top: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: tagColor.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    tag,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: primaryGreen,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                flavor,
                style: const TextStyle(
                  color: Color(0xFF8A5A4B),
                  fontSize: 14,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Text(
            description,
            style: const TextStyle(
              color: Colors.black87,
              height: 1.6,
              fontSize: 15,
            ),
          ),

          const SizedBox(height: 18),

          Row(
            children: [
              Container(
                width: 28,
                height: 1,
                color: Colors.black26,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  profile,
                  style: const TextStyle(
                    letterSpacing: 2,
                    fontSize: 13,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}