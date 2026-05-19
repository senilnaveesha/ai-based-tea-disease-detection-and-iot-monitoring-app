import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'analysis_template.dart';

class PhScreen extends StatelessWidget {
  const PhScreen({super.key});

  Future<double> fetchPH() async {
    final response = await http
        .get(Uri.parse("http://192.168.4.1/data"))
        .timeout(const Duration(seconds: 5));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return double.parse(data["ph"].toString());
    } else {
      throw Exception("Failed to load pH");
    }
  }

  Map<String, String> getPHReport(double ph) {
    if (ph >= 4.5 && ph <= 5.5) {
      return {
        "status": "OPTIMAL RANGE",
        "suitability":
            "Soil pH is ideal for tea cultivation and supports proper nutrient availability.",
        "futureImpact":
            "Maintaining this range supports strong root systems, healthy shoot growth, and good tea leaf quality.",
        "solution":
            "Continue current soil management, monitor pH weekly, and maintain balanced fertilization.",
      };
    } else if (ph < 4.5) {
      return {
        "status": "TOO ACIDIC",
        "suitability":
            "Soil is more acidic than the ideal tea range and may reduce nutrient availability.",
        "futureImpact":
            "Excess acidity can damage roots, reduce nutrient uptake, weaken plant growth, and reduce yield quality.",
        "solution":
            "Apply agricultural lime carefully, improve organic matter, avoid excessive acidic fertilizer, and retest pH after treatment.",
      };
    } else if (ph > 5.5 && ph <= 6.5) {
      return {
        "status": "SLIGHTLY ALKALINE",
        "suitability":
            "Soil pH is above the preferred tea range and may begin to affect nutrient absorption.",
        "futureImpact":
            "If pH continues rising, tea plants may show nutrient deficiency, weak growth, and reduced leaf quality.",
        "solution":
            "Use organic matter, apply acidifying amendments carefully, avoid lime, and monitor pH changes regularly.",
      };
    } else {
      return {
        "status": "TOO ALKALINE",
        "suitability":
            "Soil pH is too high for tea plants and is not suitable for healthy tea cultivation.",
        "futureImpact":
            "Strong alkaline conditions can seriously limit nutrient uptake, reduce root efficiency, and lower yield.",
        "solution":
            "Use sulfur-based amendments carefully, add compost or organic matter, avoid alkaline inputs, and retest soil before applying more treatment.",
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<double>(
      future: fetchPH(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return const AnalysisTemplate(
            title: "pH Analysis",
            value: "--",
            unit: "pH",
            status: "GROUND NODE OFFLINE",
            whyMatters:
                "Soil pH determines nutrient availability and root efficiency.",
            suitability:
                "Connect to ESP8266 hotspot to view live pH data.",
            futureImpact:
                "Without pH data, nutrient management decisions cannot be made.",
            solution:
                "Connect to Tea_Ground_Node Wi-Fi and refresh.",
          );
        }

        final ph = snapshot.data!;
        final report = getPHReport(ph);

        return AnalysisTemplate(
          title: "pH Analysis",
          value: ph.toStringAsFixed(2),
          unit: "pH",
          status: report["status"]!,
          whyMatters:
              "Soil pH determines nutrient availability, root efficiency, and fertilizer effectiveness.",
          suitability: report["suitability"]!,
          futureImpact: report["futureImpact"]!,
          solution: report["solution"]!,
        );
      },
    );
  }
}