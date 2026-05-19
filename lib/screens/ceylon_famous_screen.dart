import 'package:flutter/material.dart';

class CeylonFamousScreen extends StatelessWidget {
  const CeylonFamousScreen({super.key});

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

              _quoteCard(),

              _infoSection(
                image: "assets/images/wf2.png",
                title: "Perfect Growing Conditions",
                description:
                    "Sri Lanka’s tropical climate, cool mountain air, fertile soil, and regular rainfall create ideal conditions for growing high-quality tea throughout the year.",
                icon: Icons.cloud,
                showBadges: true,
              ),

              _infoSection(
                image: "assets/images/wf3.png",
                title: "High Elevation Tea",
                description:
                    "Tea grown in high-altitude regions such as Nuwara Eliya and Dimbula develops a lighter flavor, floral aroma, and superior quality that is highly valued internationally.",
                icon: Icons.terrain,
              ),

              _infoSection(
                image: "assets/images/wf4.png",
                title: "Traditional Harvesting",
                description:
                    "Many Sri Lankan tea estates continue to use hand-plucking methods to carefully select the freshest tea leaves, maintaining premium quality standards.",
                icon: Icons.eco,
              ),

              _iconSection(
                image: "assets/images/wf5.png",
                title: "Symbol of Authenticity",
                description:
                    "The famous Lion Logo guarantees that the tea is packed in Sri Lanka and meets strict quality standards established by the Sri Lanka Tea Board.",
                icon: Icons.shield_outlined,
              ),

              _infoSection(
                image: "assets/images/wf6.png",
                title: "International Recognition",
                description:
                    "Ceylon Tea is exported worldwide and appreciated for its freshness, flavor, and purity. It has built a strong global reputation over many decades.",
                icon: Icons.public,
              ),

              _iconSection(
                image: "assets/images/wf7.png",
                title: "Distinctive Taste",
                description:
                    "The unique flavor profile of Ceylon Tea varies by region and elevation, offering bright color, refreshing taste, and natural aroma.",
                icon: Icons.local_cafe_outlined,
              ),

              _infoSection(
                image: "assets/images/wf8.png",
                title: "Supports Sri Lanka",
                description:
                    "The tea industry contributes significantly to Sri Lanka’s economy and supports millions of livelihoods through cultivation, manufacturing, and export activities.",
                icon: Icons.attach_money,
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
    return Stack(
      children: [
        Image.asset(
          "assets/images/wf1.png",
          height: 420,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          height: 420,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.05),
                Colors.black.withOpacity(0.72),
              ],
            ),
          ),
        ),
        Positioned(
          left: 26,
          right: 26,
          bottom: 38,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: primaryGreen.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "HERITAGE INSIGHT",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    letterSpacing: 1.1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                "Why Ceylon Tea is\nFamous",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  height: 1.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "The world's finest tea from Sri Lanka",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _quoteCard() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 26),
      child: Transform.translate(
        offset: const Offset(0, -25),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 12,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.only(left: 16),
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: primaryGreen,
                  width: 4,
                ),
              ),
            ),
            child: const Text(
              "“Ceylon Tea is internationally recognized for its exceptional quality, rich aroma, bright color, and unique flavor. Sri Lanka’s climate, elevation, and traditional tea cultivation methods have made Ceylon Tea one of the most respected tea brands in the world.”",
              style: TextStyle(
                fontSize: 15,
                height: 1.8,
                fontStyle: FontStyle.italic,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoSection({
    required String image,
    required String title,
    required String description,
    required IconData icon,
    bool showBadges = false,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  image,
                  height: 190,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              if (showBadges)
                Positioned(
                  left: 12,
                  bottom: 10,
                  child: Row(
                    children: [
                      _smallBadge(Icons.thermostat, "22°C"),
                      const SizedBox(width: 8),
                      _smallBadge(Icons.water_drop, "85%"),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Icon(icon, color: primaryGreen, size: 20),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: primaryGreen,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              color: Colors.black87,
              height: 1.6,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconSection({
    required String image,
    required String title,
    required String description,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              height: 170,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Icon(icon, color: primaryGreen, size: 21),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: primaryGreen,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              color: Colors.black87,
              height: 1.6,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _smallBadge(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.55),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 12),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}