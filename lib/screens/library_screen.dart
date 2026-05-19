import 'package:flutter/material.dart';
import 'account_screen.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  static const Color primaryGreen = Color(0xFF173809);

  String selectedFilter = "All Diseases";

  final List<Map<String, String>> diseases = [
    {
      "name": "Blister Blight",
      "severity": "HIGH SEVERITY",
      "category": "Fungal",
      "image": "assets/images/lib2.png",
      "description":
          "Fungal disease caused by Exobasidium vexans. Characterized by small transparent spots that evolve into white blisters.",
      "symptoms": "White blister-like lesions, distorted growth",
      "prevention": "Proper pruning, improved airflow",
      "treatment":
          "Immediate fungicide application and removal of infected debris.",
    },
    {
      "name": "Grey Blight",
      "severity": "MEDIUM SEVERITY",
      "category": "Fungal",
      "image": "assets/images/lib3.png",
      "description":
          "Caused by Pestalotiopsis theae. Affects older leaves primarily, creating greyish-brown patches with concentric rings.",
      "symptoms": "Concentric ring spots, black bordered lesions",
      "prevention": "Avoid overcrowding leaves during wet seasons",
      "treatment": "Copper-based fungicides and nutrient balance.",
    },
    {
      "name": "Red Rust",
      "severity": "LOW SEVERITY",
      "category": "Algal",
      "image": "assets/images/lib4.png",
      "description":
          "An algal disease usually indicating poor bush vigor or soil nutrient deficiency.",
      "symptoms": "Orange/red velvety spots on stems/leaves",
      "prevention": "Proper soil drainage and shade control",
      "treatment": "Spray copper oxychloride or lime mixture.",
    },
    {
      "name": "Black Rot",
      "severity": "HIGH SEVERITY",
      "category": "Fungal",
      "image": "assets/images/lib5.png",
      "description":
          "Caused by Corticium theae. Leaves turn dark brown/black and hang limply before dropping.",
      "symptoms": "Black patches and leaf hanging/death",
      "prevention": "Thin out dense areas for better ventilation",
      "treatment": "Prune infected limbs early; systemic fungicides.",
    },
    {
      "name": "Bird’s Eye Spot",
      "severity": "LOW SEVERITY",
      "category": "Fungal",
      "image": "assets/images/lib6.png",
      "description":
          "Cercospora theae. Small brown spots with white centers, appearing like tiny eyes on the leaf surface.",
      "symptoms": "White-centered brown spots",
      "prevention": "Maintain plant vigor through fertilization",
      "treatment": "Usually mild; treat per need.",
    },
    {
      "name": "Stem Canker",
      "severity": "HIGH SEVERITY",
      "category": "Fungal",
      "image": "assets/images/lib7.png",
      "description":
          "Macrophoma theicola. Serious disease causing localized bark death and branch curling.",
      "symptoms": "Sunken bark cankers, cracking bark",
      "prevention": "Sterilize pruning tools and sanitation",
      "treatment": "Prune infected stems carefully with care.",
    },
    {
      "name": "Algal Leaf Spot",
      "severity": "MEDIUM SEVERITY",
      "category": "Algal",
      "image": "assets/images/lib8.png",
      "description":
          "Often confused with red rust, this algal growth thrives in humid conditions on weakened tea leaves.",
      "symptoms": "Greenish-gray fuzzy spots on leaf tops",
      "prevention": "Improve drainage and plant spacing",
      "treatment": "Copper-based spray during monsoon.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredDiseases = selectedFilter == "All Diseases"
        ? diseases
        : diseases.where((d) => d["category"] == selectedFilter).toList();

    return Container(
      color: const Color(0xFFF5F7F2),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _topBar(context),

              _heroBanner(),

              _introCard(),

              _searchBar(),

              _filters(),

              const SizedBox(height: 10),

              ...filteredDiseases.map((disease) {
                return _DiseaseCard(disease: disease);
              }),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topBar(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: primaryGreen),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          const Text(
            "Library",
            style: TextStyle(
              color: primaryGreen,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AccountScreen()),
              );
            },
            child: const CircleAvatar(
              radius: 17,
              backgroundColor: primaryGreen,
              child: Icon(Icons.person, color: Colors.white, size: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget _heroBanner() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          children: [
            Image.asset(
              "assets/images/lib1.png",
              height: 170,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              height: 170,
              color: Colors.black.withOpacity(0.25),
            ),
            const Positioned(
              left: 18,
              bottom: 24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "KNOWLEDGE HUB",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Tea Disease Library",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
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

  Widget _introCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Identify & Protect",
              style: TextStyle(
                color: primaryGreen,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Welcome to the comprehensive guide for tea plantation health. Early detection is key to maintaining high-quality yields. Use this library to identify common pathologies and implement effective management strategies.",
              style: TextStyle(height: 1.5, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: "Search disease database...",
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _filters() {
    final filters = ["All Diseases", "Fungal", "Bacterial", "Algal"];

    return SizedBox(
      height: 38,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final filter = filters[index];
          final active = selectedFilter == filter;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedFilter = filter;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: active ? primaryGreen : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                filter,
                style: TextStyle(
                  color: active ? Colors.white : Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DiseaseCard extends StatefulWidget {
  final Map<String, String> disease;

  const _DiseaseCard({required this.disease});

  @override
  State<_DiseaseCard> createState() => _DiseaseCardState();
}

class _DiseaseCardState extends State<_DiseaseCard> {
  bool expanded = true;

  static const Color primaryGreen = Color(0xFF173809);

  Color _severityColor(String severity) {
    if (severity.contains("HIGH")) return Colors.red;
    if (severity.contains("MEDIUM")) return Colors.orange;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    final d = widget.disease;
    final severityColor = _severityColor(d["severity"]!);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  expanded = !expanded;
                });
              },
              child: Row(
                children: [
                  Icon(Icons.warning_rounded, color: severityColor, size: 22),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          d["name"]!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          d["severity"]!,
                          style: TextStyle(
                            color: severityColor,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    expanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),

            if (expanded) ...[
              const SizedBox(height: 12),

              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  d["image"]!,
                  height: 170,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                d["description"]!,
                style: const TextStyle(height: 1.5, fontSize: 13),
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: _smallInfoBox("SYMPTOMS", d["symptoms"]!),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _smallInfoBox("PREVENTION", d["prevention"]!),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: severityColor.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "TREATMENT",
                      style: TextStyle(
                        color: severityColor,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      d["treatment"]!,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _smallInfoBox(String title, String text) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7F2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: primaryGreen,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: const TextStyle(fontSize: 11, height: 1.4),
          ),
        ],
      ),
    );
  }
}