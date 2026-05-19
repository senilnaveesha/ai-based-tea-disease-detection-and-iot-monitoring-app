import 'package:flutter/material.dart';

class ExportEconomyScreen extends StatelessWidget {
  const ExportEconomyScreen({super.key});

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
                padding: EdgeInsets.fromLTRB(24, 34, 24, 30),
                child: Text(
                  "As the backbone of our island's trade, tea supports millions of families and sustains a century-old global reputation. This vital industry remains the heartbeat of our national economy, driven by heritage and unmatched quality.",
                  style: TextStyle(
                    fontSize: 20,
                    height: 1.7,
                    color: Colors.black54,
                  ),
                ),
              ),

              _majorExportCard(),

              Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 34),
                child: Row(
                  children: [
                    Expanded(
                      child: _statCard(
                        dark: true,
                        icon: Icons.groups,
                        value: "1M+",
                        label: "LIVELIHOODS",
                        text:
                            "Supporting rural families and tea community development across the island.",
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _statCard(
                        dark: false,
                        icon: Icons.analytics_outlined,
                        value: "2%",
                        label: "OF TOTAL GDP",
                        text:
                            "A cornerstone of national export earnings and fiscal stability.",
                      ),
                    ),
                  ],
                ),
              ),

              _sectionTitle("Primary Export Hubs", Icons.travel_explore),
              _exportMapCard(),

              const SizedBox(height: 30),

              _sectionTitle("Official Certifications", Icons.verified_user),
              _certificationGrid(),

              _qualityCard(),

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
          "assets/images/e1.png",
          height: 300,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          height: 300,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.05),
                primaryGreen.withOpacity(0.78),
              ],
            ),
          ),
        ),
        Positioned(
          left: 26,
          right: 26,
          bottom: 36,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                decoration: BoxDecoration(
                  color: primaryGreen.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Text(
                  "GLOBAL TRADE",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    letterSpacing: 1.4,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Tea Export & Global\nEconomy",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  height: 1.12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _majorExportCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFFF1F3F1),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Stack(
          children: [
            Positioned(
              right: -10,
              top: -20,
              child: Icon(
                Icons.public,
                size: 120,
                color: Colors.black.withOpacity(0.04),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "MAJOR EXPORT CROP",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.4,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 22),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "#1 ",
                        style: TextStyle(
                          fontSize: 46,
                          color: primaryGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: "Value Exporter",
                        style: TextStyle(
                          fontSize: 19,
                          color: primaryGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 18),
                Text(
                  "Sri Lanka consistently ranks as a top global exporter of premium orthodox black tea.",
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.45,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _statCard({
    required bool dark,
    required IconData icon,
    required String value,
    required String label,
    required String text,
  }) {
    return Container(
      height: 165,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: dark ? primaryGreen : const Color(0xFFE8EBE7),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: dark ? Colors.white70 : primaryGreen),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              color: dark ? Colors.white : Colors.black87,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: dark ? Colors.white70 : Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: 11,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 9),
          Text(
            text,
            style: TextStyle(
              color: dark ? Colors.white70 : Colors.black45,
              fontSize: 11,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 18),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: primaryGreen,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Icon(icon, color: primaryGreen),
        ],
      ),
    );
  }

  Widget _exportMapCard() {
    final left = ["UAE", "Turkey", "Germany", "USA"];
    final right = ["Russia", "Iraq & Iran", "Japan", "UK"];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/e2.png",
                height: 210,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: _countryColumn(left)),
                Expanded(child: _countryColumn(right)),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _countryColumn(List<String> countries) {
    return Column(
      children: List.generate(countries.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            children: [
              Container(
                width: 9,
                height: 9,
                decoration: BoxDecoration(
                  color: index == 0
                      ? primaryGreen
                      : primaryGreen.withOpacity(0.15 + (0.12 * index)),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 14),
              Text(
                countries[index],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _certificationGrid() {
    final certs = [
      [Icons.emoji_events_outlined, "Ceylon Tea Lion Logo"],
      [Icons.shield_outlined, "ISO 22000"],
      [Icons.volunteer_activism_outlined, "Fairtrade Certification"],
      [Icons.eco_outlined, "Ozone Friendly Tea"],
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.8,
        children: certs.map((cert) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(cert[0] as IconData, color: primaryGreen, size: 28),
                const SizedBox(height: 12),
                Text(
                  cert[1] as String,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _qualityCard() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 42, 24, 0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(34),
        decoration: BoxDecoration(
          color: primaryGreen,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Stack(
          children: [
            Positioned(
              right: -45,
              bottom: -45,
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white.withOpacity(0.13), width: 4),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  width: 84,
                  height: 84,
                  decoration: const BoxDecoration(
                    color: Color(0xFFD7F5C6),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.verified,
                    color: primaryGreen,
                    size: 40,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  "Global Quality Standard",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "THE LION LOGO GUARANTEE",
                  style: TextStyle(
                    color: Colors.white54,
                    letterSpacing: 3,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 22),
                const Text(
                  "Ensuring 100% pure Ceylon tea packed at the source for global markets.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    height: 1.6,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}