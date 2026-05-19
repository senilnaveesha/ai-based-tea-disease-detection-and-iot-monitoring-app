import 'package:flutter/material.dart';
import 'account_screen.dart';
import 'tea_history_screen.dart';
import 'types_of_tea_screen.dart';
import 'tea_regions_screen.dart';
import 'ceylon_famous_screen.dart';
import 'tea_grades_screen.dart';
import 'tea_made_screen.dart';
import 'tea_benefits_screen.dart';
import 'export_economy_screen.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

  static const Color primaryGreen = Color(0xFF173809);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF6F8F5),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _topBar(context),

              const Padding(
                padding: EdgeInsets.fromLTRB(24, 20, 24, 4),
                child: Text(
                  "Master the Art of Tea",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: primaryGreen,
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Deep dive into the heritage, science, and terroir of the world's finest leaves.",
                  style: TextStyle(color: Colors.black54, height: 1.5),
                ),
              ),

              const SizedBox(height: 22),

              _knowledgeCard(
                context,
                "assets/images/ev1.png",
                "Tea Industry History",
                "Tracing the roots of Ceylon tea from James Taylor to the modern day.",
                const TeaHistoryScreen(),
              ),

              _knowledgeCard(
                context,
                "assets/images/ev2.png",
                "Types of Tea",
                "From delicate White to robust Black tea varieties.",
                const TypesOfTeaScreen(),
              ),

              _knowledgeCard(
                context,
                "assets/images/ev3.png",
                "Sri Lankan Tea Growing Regions",
                "Exploring the terroir of Nuwara Eliya, Uva, and Dimbula.",
                const TeaRegionsScreen(),
              ),

              _knowledgeCard(
                context,
                "assets/images/ev4.png",
                "Why Ceylon Tea is Famous",
                "The unique quality of the Lion Logo and global standards.",
                const CeylonFamousScreen(),
              ),

              _knowledgeCard(
                context,
                "assets/images/ev5.png",
                "Tea Grades",
                "Understanding OP, BOP, and Dust levels for the perfect brew.",
                const TeaGradesScreen(),
              ),

              _knowledgeCard(
                context,
                "assets/images/ev6.png",
                "How Tea is Made",
                "A step-by-step guide to the artisanal manufacturing process.",
                const TeaMadeScreen(),
              ),

              _knowledgeCard(
                context,
                "assets/images/ev7.png",
                "Tea Health Benefits",
                "Antioxidants, focused energy, and mindful living through tea.",
                const TeaBenefitsScreen(),
              ),

              _knowledgeCard(
                context,
                "assets/images/ev8.png",
                "Export & Economy",
                "Exploring Sri Lanka’s profound global trade influence.",
                const ExportEconomyScreen(),
              ),

              const SizedBox(height: 25),

              _brandCard(),

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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.menu, color: primaryGreen),
            onPressed: () {
              final scaffold = Scaffold.maybeOf(context);
              scaffold?.openDrawer();
            },
          ),
          const SizedBox(width: 8),
          const Text(
            "Evolution",
            style: TextStyle(
              color: primaryGreen,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AccountScreen()),
              );
            },
            child: const CircleAvatar(
              radius: 17,
              backgroundColor: Color(0xFFE9EEE7),
              child: Icon(Icons.person, color: primaryGreen, size: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget _knowledgeCard(
    BuildContext context,
    String image,
    String title,
    String subtitle,
    Widget screen,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => screen),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Stack(
            children: [
              Image.asset(
                image,
                height: 185,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                height: 185,
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
                left: 18,
                right: 18,
                bottom: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _brandCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(26),
        decoration: BoxDecoration(
          color: const Color(0xFFF0F3EF),
          borderRadius: BorderRadius.circular(24),
        ),
        child: const Column(
          children: [
            Text(
              "The Ceylon Tea Smart",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: primaryGreen,
                fontSize: 17,
              ),
            ),
            SizedBox(height: 14),
            Text(
              "Verdant Tea’s flagship initiative to digitize the wisdom of the hills. We combine traditional agronomy with modern data science to preserve the heritage of Ceylon tea.",
              textAlign: TextAlign.center,
              style: TextStyle(height: 1.6, color: Colors.black54),
            ),
            SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.eco_outlined, color: Colors.green),
                SizedBox(width: 18),
                Icon(Icons.psychology_alt_outlined, color: Colors.green),
                SizedBox(width: 18),
                Icon(Icons.public, color: Colors.green),
              ],
            ),
            SizedBox(height: 24),
            Text(
              "PRECISION AGRICULTURE • GLOBAL HERITAGE",
              style: TextStyle(
                fontSize: 10,
                letterSpacing: 1.6,
                color: Colors.black38,
              ),
            ),
          ],
        ),
      ),
    );
  }
}