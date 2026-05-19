import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'account_screen.dart';
import 'temperature_screen.dart';
import 'humidity_screen.dart';
import 'moisture_screen.dart';
import 'ph_screen.dart';

class SoilScreen extends StatefulWidget {
  const SoilScreen({super.key});

  @override
  State<SoilScreen> createState() => _SoilScreenState();
}

class _SoilScreenState extends State<SoilScreen> {
  static const Color primaryGreen = Color(0xFF173809);

  double? temperature;
  double? humidity;
  double? ph;
  String? moisture;
  bool isLoading = true;
  bool isOffline = false;

  @override
  void initState() {
    super.initState();
    fetchSoilData();
  }

  Future<void> fetchSoilData() async {
    try {
      final response = await http
          .get(Uri.parse("http://192.168.4.1/data"))
          .timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          temperature = double.tryParse(data["temperature"].toString());
          humidity = double.tryParse(data["humidity"].toString());
          ph = double.tryParse(data["ph"].toString());
          moisture = data["soil_moisture"].toString();
          isLoading = false;
          isOffline = false;
        });
      } else {
        _setOffline();
      }
    } catch (e) {
      _setOffline();
    }
  }

  void _setOffline() {
    setState(() {
      isLoading = false;
      isOffline = true;
    });
  }

  String _phStatus() {
    if (ph == null) return "Unavailable";
    if (ph! >= 4.5 && ph! <= 5.5) return "Optimal";
    if (ph! < 4.5) return "Too Acidic";
    return "Too Alkaline";
  }

  String _humidityStatus() {
    if (humidity == null) return "Unavailable";
    if (humidity! >= 70 && humidity! <= 90) return "Suitable";
    if (humidity! < 70) return "Low";
    return "High";
  }

  String _temperatureStatus() {
    if (temperature == null) return "Unavailable";
    if (temperature! >= 18 && temperature! <= 30) return "Suitable";
    if (temperature! < 18) return "Low";
    return "High";
  }

  String _moistureStatus() {
    if (moisture == null) return "Unavailable";
    if (moisture!.toLowerCase() == "wet") return "Good Moisture";
    return "Low Moisture";
  }

  String _trendInsight() {
    if (isOffline) {
      return "Ground node is offline. Live soil condition cannot be analysed.";
    }

    if (_phStatus() == "Optimal" &&
        _humidityStatus() == "Suitable" &&
        _temperatureStatus() == "Suitable" &&
        _moistureStatus() == "Good Moisture") {
      return "Soil condition is stable and suitable for tea cultivation.";
    }

    return "Some soil parameters are outside the ideal range and may affect tea growth.";
  }

  String _expertAdvice() {
    if (isOffline) {
      return "Connect to Tea_Ground_Node Wi-Fi and refresh the soil checker.";
    }

    if (_phStatus() == "Too Acidic") {
      return "Apply lime carefully and monitor pH until it returns to the ideal tea range.";
    }

    if (_phStatus() == "Too Alkaline") {
      return "Use soil acidifying methods and avoid alkaline amendments.";
    }

    if (_moistureStatus() == "Low Moisture") {
      return "Increase controlled irrigation and monitor dry soil areas.";
    }

    if (_humidityStatus() == "High") {
      return "Improve airflow around tea bushes to reduce fungal disease risk.";
    }

    if (_temperatureStatus() == "High") {
      return "Use shade management and irrigation to reduce heat stress.";
    }

    return "Maintain current irrigation, drainage, pruning, and regular monitoring.";
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
              Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(
                      builder: (context) {
                        return IconButton(
                          icon: const Icon(Icons.menu, color: Colors.black),
                          onPressed: () {
                            final scaffold = Scaffold.maybeOf(context);
                            scaffold?.openDrawer();
                          },
                        );
                      },
                    ),
                    const Text(
                      "Soil Checker",
                      style: TextStyle(
                        color: primaryGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
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
                "assets/images/6.jpg",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              const SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Soil Check Guide",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: primaryGreen,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Effective tea cultivation begins with precision monitoring. Tracking soil metrics ensures optimal growth and healthy yield.",
                      ),
                    ],
                  ),
                ),
              ),

              _imageCard(
                context,
                "assets/images/7.jpg",
                "Soil Temperature",
                const TemperatureScreen(),
              ),
              _imageCard(
                context,
                "assets/images/8.jpg",
                "Soil Humidity",
                const HumidityScreen(),
              ),
              _imageCard(
                context,
                "assets/images/9.jpg",
                "Soil Moisture",
                const MoistureScreen(),
              ),
              _imageCard(
                context,
                "assets/images/10.jpg",
                "pH Analysis",
                const PhScreen(),
              ),

              const SizedBox(height: 20),

              _soilSummaryCard(),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _soilSummaryCard() {
    if (isLoading) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Soil Summary",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryGreen,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              isOffline
                  ? "Ground Node: Offline"
                  : "Current pH: ${ph?.toStringAsFixed(2) ?? "--"} (${_phStatus()})",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              "Humidity: ${humidity?.toStringAsFixed(1) ?? "--"}% (${_humidityStatus()})",
            ),
            Text(
              "Temperature: ${temperature?.toStringAsFixed(1) ?? "--"}°C (${_temperatureStatus()})",
            ),
            Text(
              "Moisture: ${moisture ?? "--"} (${_moistureStatus()})",
            ),

            const SizedBox(height: 15),

            Text(
              "Trend Insight:\n${_trendInsight()}",
            ),

            const SizedBox(height: 15),

            Text(
              "Expert Advice:\n${_expertAdvice()}",
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryGreen,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: fetchSoilData,
                child: const Text(
                  "REFRESH SOIL DATA",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imageCard(
    BuildContext context,
    String image,
    String title,
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Image.asset(
                image,
                height: 140,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                height: 140,
                color: Colors.black.withOpacity(0.3),
              ),
              Positioned(
                left: 16,
                bottom: 20,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}