import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'analysis_template.dart';

class MoistureScreen extends StatelessWidget {
  const MoistureScreen({super.key});

  Future<String> fetchMoisture() async {
    final response = await http
        .get(Uri.parse("http://192.168.4.1/data"))
        .timeout(const Duration(seconds: 5));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["soil_moisture"].toString();
    } else {
      throw Exception("Failed to load moisture");
    }
  }

  Map<String, String> getMoistureReport(String moisture) {
    final value = moisture.toLowerCase().trim();

    if (value == "wet") {
      return {
        "status": "GOOD MOISTURE",
        "suitability":
            "The soil has sufficient moisture to support tea root activity and nutrient movement.",
        "futureImpact":
            "Balanced moisture helps reduce drought stress and supports steady tea leaf growth.",
        "solution":
            "Continue current irrigation practices, monitor rainfall changes, and avoid over-watering.",
      };
    } else if (value == "dry") {
      return {
        "status": "LOW MOISTURE",
        "suitability":
            "The soil is dry and may not provide enough water for healthy tea plant growth.",
        "futureImpact":
            "Low moisture can cause leaf stress, weak root activity, poor nutrient uptake, and reduced yield.",
        "solution":
            "Apply controlled irrigation, add mulch to retain soil water, and monitor dry areas regularly.",
      };
    } else {
      return {
        "status": "MOISTURE WARNING",
        "suitability":
            "The moisture condition is not clearly identified by the ground node.",
        "futureImpact":
            "Unclear moisture readings may lead to inaccurate irrigation decisions.",
        "solution":
            "Check the soil moisture sensor connection, clean the sensor probe, and refresh the reading.",
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: fetchMoisture(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return const AnalysisTemplate(
            title: "Moisture Analysis",
            value: "--",
            unit: "",
            status: "GROUND NODE OFFLINE",
            whyMatters:
                "Soil moisture is essential for nutrient transport and root health.",
            suitability:
                "Connect to ESP8266 hotspot to view live moisture condition.",
            futureImpact:
                "Without live data, irrigation decisions may be inaccurate.",
            solution:
                "Connect to Tea_Ground_Node Wi-Fi and refresh.",
          );
        }

        final moisture = snapshot.data!;
        final report = getMoistureReport(moisture);

        return AnalysisTemplate(
          title: "Moisture Analysis",
          value: moisture,
          unit: "",
          status: report["status"]!,
          whyMatters:
              "Soil moisture is essential for nutrient transport, root health, and tea plant growth.",
          suitability: report["suitability"]!,
          futureImpact: report["futureImpact"]!,
          solution: report["solution"]!,
        );
      },
    );
  }
}