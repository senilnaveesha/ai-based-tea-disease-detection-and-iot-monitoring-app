import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'analysis_template.dart';

class HumidityScreen extends StatelessWidget {
  const HumidityScreen({super.key});

  Future<double> fetchHumidity() async {
    final response = await http
        .get(Uri.parse("http://192.168.4.1/data"))
        .timeout(const Duration(seconds: 5));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return double.parse(data["humidity"].toString());
    } else {
      throw Exception("Failed to load humidity");
    }
  }

  Map<String, String> getHumidityReport(double humidity) {
    if (humidity < 70) {
      return {
        "status": "LOW HUMIDITY",
        "suitability":
            "The humidity level is lower than the suitable range for tea cultivation.",
        "futureImpact":
            "Low humidity can increase water loss, stress tea leaves, and reduce overall plant growth.",
        "solution":
            "Increase irrigation, maintain soil moisture, and reduce excessive sunlight exposure using shade management.",
      };
    } else if (humidity >= 70 && humidity <= 90) {
      return {
        "status": "OPTIMAL RANGE",
        "suitability":
            "The humidity level is within the ideal range for healthy tea plant growth.",
        "futureImpact":
            "Maintaining this level supports proper transpiration, steady growth, and good leaf quality.",
        "solution":
            "Continue regular monitoring and maintain balanced airflow and moisture conditions.",
      };
    } else {
      return {
        "status": "HIGH HUMIDITY",
        "suitability":
            "The humidity level is higher than the ideal range and may increase disease risk.",
        "futureImpact":
            "High humidity can promote fungal diseases, leaf damage, and reduced tea quality over time.",
        "solution":
            "Improve airflow by pruning, reduce overcrowding, and avoid excess water accumulation in the field.",
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<double>(
      future: fetchHumidity(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return const AnalysisTemplate(
            title: "Humidity Analysis",
            value: "--",
            unit: "%",
            status: "GROUND NODE OFFLINE",
            whyMatters:
                "Humidity affects leaf transpiration, disease risk, and moisture balance.",
            suitability:
                "Connect to ESP8266 hotspot to view live humidity data.",
            futureImpact:
                "Without live data, humidity-based decisions cannot be made.",
            solution:
                "Connect to Tea_Ground_Node Wi-Fi and refresh.",
          );
        }

        final humidity = snapshot.data!;
        final report = getHumidityReport(humidity);

        return AnalysisTemplate(
          title: "Humidity Analysis",
          value: humidity.toStringAsFixed(1),
          unit: "%",
          status: report["status"]!,
          whyMatters:
              "Humidity affects leaf transpiration, disease risk, and moisture balance.",
          suitability: report["suitability"]!,
          futureImpact: report["futureImpact"]!,
          solution: report["solution"]!,
        );
      },
    );
  }
}