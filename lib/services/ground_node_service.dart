import 'dart:convert';
import 'package:http/http.dart' as http;

class GroundNodeData {
  final double temperature;
  final double humidity;
  final String soilMoisture;
  final double ph;

  GroundNodeData({
    required this.temperature,
    required this.humidity,
    required this.soilMoisture,
    required this.ph,
  });

  factory GroundNodeData.fromJson(Map<String, dynamic> json) {
    return GroundNodeData(
      temperature: double.parse(json['temperature'].toString()),
      humidity: double.parse(json['humidity'].toString()),
      soilMoisture: json['soil_moisture'].toString(),
      ph: double.parse(json['ph'].toString()),
    );
  }
}

class GroundNodeService {
  static Future<GroundNodeData> fetchData() async {
    final response = await http
        .get(Uri.parse("http://192.168.4.1/data"))
        .timeout(const Duration(seconds: 5));

    if (response.statusCode == 200) {
      return GroundNodeData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load ground node data");
    }
  }
}