import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'analysis_template.dart';

class TemperatureScreen extends StatelessWidget {
  const TemperatureScreen({super.key});

  Future<double> fetchTemperature() async {
    final response = await http
        .get(Uri.parse("http://192.168.4.1/data"))
        .timeout(const Duration(seconds: 5));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return double.parse(data["temperature"].toString());
    } else {
      throw Exception("Failed to load temperature");
    }
  }

  Map<String, String> getTemperatureReport(double temperature) {
    if (temperature < 18) {
      return {
        "status": "LOW TEMPERATURE",
        "suitability":
            "The soil temperature is lower than the suitable range for healthy tea root activity.",
        "futureImpact":
            "Low temperature can slow root growth, reduce nutrient uptake, and delay new shoot development.",
        "solution":
            "Improve sunlight exposure, avoid excessive shade, reduce waterlogging, and monitor the soil during cold periods.",
      };
    } else if (temperature >= 18 && temperature <= 30) {
      return {
        "status": "OPTIMAL RANGE",
        "suitability":
            "The current soil temperature is suitable for tea cultivation and supports stable root activity.",
        "futureImpact":
            "Maintaining this range supports healthy nutrient absorption, steady growth, and better leaf quality.",
        "solution":
            "Continue regular monitoring, maintain balanced shade, and keep soil moisture at a stable level.",
      };
    } else {
      return {
        "status": "HIGH TEMPERATURE",
        "suitability":
            "The soil temperature is higher than the ideal range and may create heat stress around tea roots.",
        "futureImpact":
            "High temperature can increase moisture loss, weaken roots, and reduce tea leaf quality over time.",
        "solution":
            "Increase controlled irrigation, improve mulching, provide shade management, and avoid exposing soil directly to strong sunlight.",
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<double>(
      future: fetchTemperature(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return const AnalysisTemplate(
            title: "Temperature Analysis",
            value: "--",
            unit: "°C",
            status: "GROUND NODE OFFLINE",
            whyMatters:
                "Soil temperature controls root activity, nutrient uptake, and healthy tea growth.",
            suitability:
                "Connect the phone to the ESP8266 hotspot to view live soil temperature.",
            futureImpact:
                "Without live readings, the app cannot analyse the current soil condition.",
            solution:
                "Connect to Tea_Ground_Node Wi-Fi and refresh this screen.",
          );
        }

        final temperature = snapshot.data!;
        final report = getTemperatureReport(temperature);

        return AnalysisTemplate(
          title: "Temperature Analysis",
          value: temperature.toStringAsFixed(1),
          unit: "°C",
          status: report["status"]!,
          whyMatters:
              "Soil temperature controls root activity, nutrient uptake, and healthy tea growth.",
          suitability: report["suitability"]!,
          futureImpact: report["futureImpact"]!,
          solution: report["solution"]!,
        );
      },
    );
  }
}