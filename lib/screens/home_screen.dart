import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'account_screen.dart';

class HomeScreen extends StatefulWidget {
  final Function(int) onNavigate;

  const HomeScreen({
    super.key,
    required this.onNavigate,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const Color primaryGreen = Color(0xFF173809);

  double? humidity;
  double? ph;
  String liveStatus = "CONNECTING...";
  Timer? timer;

  // ✅ NEW: dynamic user name
  String userName = "User";

  @override
  void initState() {
    super.initState();

    _loadUserName(); // ✅ load logged user

    fetchGroundNodeData();

    timer = Timer.periodic(
      const Duration(seconds: 3),
      (_) => fetchGroundNodeData(),
    );
  }

  // ✅ LOAD USER NAME FROM STORAGE
  Future<void> _loadUserName() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      userName = prefs.getString("registeredName") ?? "User";
    });
  }

  Future<void> fetchGroundNodeData() async {
    try {
      final response = await http
          .get(Uri.parse("http://192.168.4.1/data"))
          .timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          humidity = double.tryParse(data["humidity"].toString());
          ph = double.tryParse(data["ph"].toString());
          liveStatus = "LIVE UPDATES";
        });
      }
    } catch (e) {
      setState(() {
        liveStatus = "OFFLINE";
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F5F5),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // TOP BAR
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(
                      builder: (context) {
                        return IconButton(
                          icon: const Icon(Icons.menu, color: Colors.black),
                          onPressed: () {
                            Scaffold.maybeOf(context)?.openDrawer();
                          },
                        );
                      },
                    ),

                    const Text(
                      "Ceylon Tea Smart",
                      style: TextStyle(
                        color: primaryGreen,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AccountScreen(),
                          ),
                        );
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),

              Image.asset(
                "assets/images/1.jpg",
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              const SizedBox(height: 10),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "ESTATE 04 - HIGH ALTITUDE",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),

              // ✅ UPDATED GREETING
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Hi, ${userName.split(' ').first}",
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: primaryGreen,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // ESTATE PULSE
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Estate Pulse",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: liveStatus == "LIVE UPDATES"
                                  ? const Color(0xFFB7E4C7)
                                  : Colors.red.shade100,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              liveStatus,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: primaryGreen,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      Row(
                        children: [
                          Expanded(
                            child: _InfoBox(
                              title: "HUMIDITY",
                              value: humidity == null
                                  ? "--%"
                                  : "${humidity!.toStringAsFixed(1)}%",
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: _InfoBox(
                              title: "AVG PH",
                              value: ph == null
                                  ? "--"
                                  : ph!.toStringAsFixed(2),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Live soil data from ESP8266 ground node",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              _imageCard(context, "assets/images/2.jpg",
                  "Tea Disease Identification", "Real-time scan via neural vision", 1),

              _imageCard(context, "assets/images/3.jpg",
                  "Soil Condition Checker", "Analyze moisture, humidity & pH", 2),

              _imageCard(context, "assets/images/4.jpg",
                  "Industry Evaluation", "Colombo auction trends & pricing", 3),

              _imageCard(context, "assets/images/5.jpg",
                  "Tea Disease Database", "Curated botanical records", 4),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imageCard(
    BuildContext context,
    String image,
    String title,
    String subtitle,
    int tabIndex,
  ) {
    return GestureDetector(
      onTap: () {
        widget.onNavigate(tabIndex);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Image.asset(
                image,
                height: 170,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                height: 170,
                color: Colors.black.withOpacity(0.3),
              ),
              Positioned(
                left: 16,
                bottom: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(color: Colors.white70),
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
}

class _InfoBox extends StatelessWidget {
  final String title;
  final String value;

  const _InfoBox({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(title, style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}