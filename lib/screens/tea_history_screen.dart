import 'package:flutter/material.dart';

class TeaHistoryScreen extends StatelessWidget {
  const TeaHistoryScreen({super.key});

  static const Color primaryGreen = Color(0xFF173809);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _topBar(context),
              _hero(),
              _introCard(),

              _timelineSection(
                "Coffee Era",
                "assets/images/ti2.png",
                "Before tea took center stage, coffee was the dominant export of Ceylon. However, the 1860s brought a devastating blow with the arrival of Hemileia vastatrix, commonly known as coffee rust. This fungal disease decimated plantations across the island, forcing planters to seek an alternative that could survive the tropical climate.",
              ),

              _timelineSection(
                "Birth of Ceylon Tea",
                "assets/images/ti3.png",
                "The turning point came in 1867 when the first commercial tea plantation was established. Farmers realized that tea and altitude of the central highlands were perfect for Camellia sinensis. This pivotal year marked the transformation of the landscape from dying coffee estates to vibrant, resilient tea fields.",
              ),

              _jamesTaylorSection(),

              _timelineSection(
                "First Tea Factory",
                "assets/images/ti5.png",
                "The first tea processing factory was established on Taylor’s verandah, where the tea leaves were hand-rolled and fired on clay ovens. By 1872, he had built a fully functioning factory, significantly increasing production and allowing the first official shipment of 23lbs to London in 1873.",
              ),

              _timelineSection(
                "Expansion of Tea Industry",
                "assets/images/ti6.png",
                "The success at Loolecondera sparked a rapid expansion across the central hills. Infrastructure followed the tea; the railway was extended into the mountains specifically to transport tea to the Colombo port. Regions like Nuwara Eliya, Uva, and Dimbula became legendary for their distinct regional flavors.",
              ),

              _timelineSection(
                "Global Recognition",
                "assets/images/ti7.png",
                "The ‘Lion Logo’ became a worldwide symbol of purity and excellence. It guarantees that the tea is 100% pure Ceylon tea, packed in Sri Lanka, and meets the highest quality standards dictated by the Sri Lanka Tea Board.",
              ),

              _timelineSection(
                "Modern Tea Industry",
                "assets/images/ti8.png",
                "Today, the industry embraces the future. From precision agriculture using drones to monitor soil health to scientific research into drought-resistant clones, the legacy of James Taylor continues through modern innovation. Sri Lanka remains a world leader in sustainable and ethical tea production.",
              ),

              const SizedBox(height: 30),
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
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const Expanded(
            child: Center(
              child: Text(
                "Ceylon Tea Smart",
                style: TextStyle(
                  color: primaryGreen,
                  fontWeight: FontWeight.bold,
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
          "assets/images/ti1.png",
          height: 210,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          height: 210,
          color: Colors.black.withOpacity(0.35),
        ),
        const Positioned(
          left: 20,
          bottom: 26,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tea Industry History",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6),
              Text(
                "The journey of Ceylon Tea through\ntime",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  height: 1.3,
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
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 25),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: const Border(
            left: BorderSide(color: primaryGreen, width: 4),
          ),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.eco, color: primaryGreen),
            SizedBox(height: 12),
            Text(
              "Sri Lanka is globally famous for producing high-quality Ceylon Tea. The tea industry has become one of the country’s most important economic sectors and a symbol of national identity.",
              style: TextStyle(
                height: 1.6,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _timelineSection(String title, String image, String description) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 34),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(title),
          const SizedBox(height: 16),
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
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              height: 1.7,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _jamesTaylorSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 34),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle("James Taylor"),
          const SizedBox(height: 16),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/images/ti4.png",
                  width: 106,
                  height: 106,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 14),

              const Expanded(
                child: Text(
                  "Known as the ‘Father of Ceylon Tea’, James Taylor arrived in 1852. He began experimenting with tea seeds at Loolecondera Estate in Deltota. His tireless work in perfecting planting and processing methods laid the foundation for the entire industry’s future success.",
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.7,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: primaryGreen,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            height: 1,
            color: const Color(0xFFD9A48F),
          ),
        ),
      ],
    );
  }
}