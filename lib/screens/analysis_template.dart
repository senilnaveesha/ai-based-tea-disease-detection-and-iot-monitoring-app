import 'package:flutter/material.dart';

class AnalysisTemplate extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final String status;
  final String whyMatters;
  final String suitability;
  final String futureImpact;
  final String solution;

  const AnalysisTemplate({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    required this.status,
    required this.whyMatters,
    required this.suitability,
    required this.futureImpact,
    required this.solution,
  });

  static const Color primaryGreen = Color(0xFF173809);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F2),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 🔙 HEADER
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back,
                        color: primaryGreen),
                  ),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: primaryGreen,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // 📊 TOP VALUE CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Column(
                  children: [

                    Text(
                      "CURRENT LEVEL",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                        letterSpacing: 2,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [

                        Text(
                          value,
                          style: const TextStyle(
                            fontSize: 58,
                            height: 1,
                            fontWeight: FontWeight.bold,
                            color: primaryGreen,
                          ),
                        ),

                        const SizedBox(width: 8),

                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            unit,
                            style: const TextStyle(
                              fontSize: 28,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD7F0D0),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.check_circle,
                              size: 16,
                              color: primaryGreen),
                          SizedBox(width: 6),
                          Text(
                            "OPTIMAL RANGE",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: primaryGreen,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // WHY IT MATTERS
              _title("Why This Matters"),
              _normalCard(
                icon: Icons.info_outline,
                text: whyMatters,
              ),

              const SizedBox(height: 22),

              // SUITABILITY
              _title("Suitability Assessment"),
              _greenCard(
                heading: "AI INSIGHT",
                titleText: suitability,
              ),

              const SizedBox(height: 22),

              // FUTURE IMPACT
              _title("Future Impacts"),
              Row(
                children: [
                  Expanded(
                    child: _miniAlertCard(
                      icon: Icons.warning_amber,
                      title: "Leaf Stress",
                      text: futureImpact,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _miniAlertCard(
                      icon: Icons.trending_down,
                      title: "Yield Risk",
                      text:
                          "Long-term imbalance may reduce crop quality and harvest weight.",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 22),

              // SOLUTION GUIDE
              _title("Improvement Guide"),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    _solutionTile(
                      Icons.science,
                      "Balanced Fertilization",
                      solution,
                    ),
                    const SizedBox(height: 12),
                    _solutionTile(
                      Icons.water_drop,
                      "Controlled Irrigation",
                      "Avoid over-watering and maintain balanced soil moisture.",
                    ),
                    const SizedBox(height: 12),
                    _solutionTile(
                      Icons.eco,
                      "Organic Matter Addition",
                      "Use compost or mulch to improve soil structure.",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 35),

              // FOOTER
              const Center(
                child: Text(
                  "Ceylon Tea Smart",
                  style: TextStyle(
                    letterSpacing: 4,
                    fontWeight: FontWeight.bold,
                    color: primaryGreen,
                  ),
                ),
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  // SECTION TITLE
  Widget _title(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: primaryGreen,
        ),
      ),
    );
  }

  // WHITE CARD
  Widget _normalCard({
    required IconData icon,
    required String text,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: primaryGreen),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(height: 1.6),
            ),
          ),
        ],
      ),
    );
  }

  // GREEN CARD
  Widget _greenCard({
    required String heading,
    required String titleText,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.green.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              const Icon(Icons.auto_awesome,
                  size: 18,
                  color: primaryGreen),
              const SizedBox(width: 8),
              Text(
                heading,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: primaryGreen,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Text(
            titleText,
            style: const TextStyle(
              fontSize: 20,
              height: 1.4,
              fontWeight: FontWeight.bold,
              color: primaryGreen,
            ),
          ),
        ],
      ),
    );
  }

  // ALERT CARD
  Widget _miniAlertCard({
    required IconData icon,
    required String title,
    required String text,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.red),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  // SOLUTION TILE
  Widget _solutionTile(
    IconData icon,
    String title,
    String text,
  ) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: primaryGreen,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon,
                color: Colors.white,
                size: 20),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: primaryGreen,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}