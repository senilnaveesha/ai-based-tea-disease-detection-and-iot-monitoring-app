import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';

class AnalysisScreen extends StatefulWidget {
  final File image;

  const AnalysisScreen({
    super.key,
    required this.image,
  });

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  bool isLoading = true;

  String diseaseName = "Analyzing...";
  String risk = "PROCESSING";
  String intro = "The AI model is analyzing the selected tea leaf image.";

  final List<String> prevention = [
    "Monitor tea leaves regularly for early symptoms.",
    "Maintain proper airflow and avoid overcrowding.",
    "Remove infected leaves when symptoms appear.",
  ];

  final List<String> treatment = [
    "Isolate the infected plant area if possible.",
    "Remove visibly damaged or infected leaves.",
    "Use suitable tea disease control methods.",
    "Consult an agricultural officer for severe infection.",
  ];

  static const Color primaryGreen = Color(0xFF173809);

  @override
  void initState() {
    super.initState();
    _runModel();
  }

  Future<void> _runModel() async {
    try {
      final interpreter =
          await Interpreter.fromAsset('assets/model/tea_model.tflite');

      final labelsData =
          await rootBundle.loadString('assets/model/labels.txt');

      final labels = labelsData
          .split('\n')
          .where((label) => label.trim().isNotEmpty)
          .toList();

      final imageBytes = await widget.image.readAsBytes();
      final decodedImage = img.decodeImage(imageBytes);

      if (decodedImage == null) {
        setState(() {
          diseaseName = "IMAGE ERROR";
          risk = "FAILED";
          intro = "The selected image could not be processed.";
          isLoading = false;
        });
        return;
      }

      final resizedImage = img.copyResize(
        decodedImage,
        width: 224,
        height: 224,
      );

      final input = List.generate(
        1,
        (_) => List.generate(
          224,
          (y) => List.generate(
            224,
            (x) {
              final pixel = resizedImage.getPixel(x, y);
              return [
                pixel.r / 127.5 - 1.0,
                pixel.g / 127.5 - 1.0,
                pixel.b / 127.5 - 1.0,
              ];
            },
          ),
        ),
      );

      final output = List.generate(
        1,
        (_) => List.filled(labels.length, 0.0),
      );

      interpreter.run(input, output);

      final scores = output[0];
      int maxIndex = 0;

      for (int i = 1; i < scores.length; i++) {
        if (scores[i] > scores[maxIndex]) {
          maxIndex = i;
        }
      }

      final predictedLabel = labels[maxIndex];
      final confidence = scores[maxIndex];

      setState(() {
        final confidencePercent = (confidence * 100).toStringAsFixed(1);

        if (confidence < 0.35) {
          diseaseName = "UNKNOWN IMAGE";
          risk = "LOW CONFIDENCE";
          intro =
              "The image does not confidently match a known tea leaf disease. Please upload a clear tea leaf image.";
        } else {
          diseaseName = predictedLabel.replaceAll('_', ' ').toUpperCase();

          if (confidence >= 0.60) {
            risk = "HIGH CONFIDENCE";
          } else {
            risk = "POSSIBLE MATCH";
          }

          intro =
              "The AI model detected $diseaseName with $confidencePercent% confidence.";

          _updateDiseaseAdvice(predictedLabel);
        }

        isLoading = false;
      });

      interpreter.close();
    } catch (e) {
      setState(() {
        diseaseName = "MODEL ERROR";
        risk = "FAILED";
        intro =
            "AI model could not run. Check model file, labels file, and pubspec.yaml assets.";
        isLoading = false;
      });
    }
  }

  void _updateDiseaseAdvice(String label) {
    final key = label.toLowerCase().trim();

    final advice = {
      "anthracnose": {
        "prevention": [
          "Avoid overhead watering and keep leaves dry.",
          "Improve airflow by pruning crowded branches.",
          "Remove fallen infected leaves from the field.",
        ],
        "treatment": [
          "Remove infected leaves immediately.",
          "Apply recommended fungicide treatment.",
          "Avoid harvesting heavily infected shoots.",
          "Monitor nearby plants for spreading symptoms.",
        ],
      },
      "algal_leaf": {
        "prevention": [
          "Improve drainage in wet areas.",
          "Avoid excessive shade and humidity.",
          "Maintain good plant nutrition.",
        ],
        "treatment": [
          "Remove severely affected leaves.",
          "Apply copper-based spray if infection spreads.",
          "Improve sunlight exposure around the bush.",
          "Reduce water stagnation near the plant.",
        ],
      },
      "bird_eye_spot": {
        "prevention": [
          "Keep tea bushes healthy with balanced fertilizer.",
          "Avoid dense overcrowding.",
          "Inspect leaves regularly during wet seasons.",
        ],
        "treatment": [
          "Remove badly infected leaves.",
          "Apply suitable fungicide if symptoms increase.",
          "Improve ventilation around the plant.",
          "Monitor young leaves for new spots.",
        ],
      },
      "brown_blight": {
        "prevention": [
          "Avoid water stress and nutrient deficiency.",
          "Maintain proper pruning and field sanitation.",
          "Reduce humidity around tea bushes.",
        ],
        "treatment": [
          "Remove infected plant debris.",
          "Apply recommended fungicide treatment.",
          "Improve drainage and airflow.",
          "Continue monitoring for spreading lesions.",
        ],
      },
      "gray_light": {
        "prevention": [
          "Avoid excessive moisture on leaves.",
          "Improve airflow between tea bushes.",
          "Use clean pruning tools.",
        ],
        "treatment": [
          "Cut and remove infected leaves.",
          "Apply copper-based fungicide when needed.",
          "Avoid working in wet fields.",
          "Sanitise tools after handling infected plants.",
        ],
      },
      "healthy": {
        "prevention": [
          "Continue regular field monitoring.",
          "Maintain balanced fertilization.",
          "Ensure good drainage and sunlight.",
        ],
        "treatment": [
          "No disease treatment is required.",
          "Continue proper irrigation and pruning.",
          "Monitor leaves weekly for early symptoms.",
          "Keep the field clean and well maintained.",
        ],
      },
      "red_leaf_spot": {
        "prevention": [
          "Avoid nutrient deficiency and weak plant growth.",
          "Improve drainage and reduce excess moisture.",
          "Remove old infected leaves from the field.",
        ],
        "treatment": [
          "Remove infected leaves carefully.",
          "Apply suitable fungicide if disease spreads.",
          "Improve soil nutrition and plant strength.",
          "Monitor nearby bushes for similar symptoms.",
        ],
      },
      "white_spot": {
        "prevention": [
          "Avoid overcrowded tea bushes.",
          "Maintain airflow and reduce leaf wetness.",
          "Inspect young leaves regularly.",
        ],
        "treatment": [
          "Remove affected leaves from the plant.",
          "Apply recommended fungal control treatment.",
          "Improve pruning and sunlight exposure.",
          "Check surrounding bushes for infection.",
        ],
      },
      "white_spots": {
        "prevention": [
          "Avoid overcrowded tea bushes.",
          "Maintain airflow and reduce leaf wetness.",
          "Inspect young leaves regularly.",
        ],
        "treatment": [
          "Remove affected leaves from the plant.",
          "Apply recommended fungal control treatment.",
          "Improve pruning and sunlight exposure.",
          "Check surrounding bushes for infection.",
        ],
      },
    };

    final selected = advice[key];

    if (selected != null) {
      prevention
        ..clear()
        ..addAll(List<String>.from(selected["prevention"]!));

      treatment
        ..clear()
        ..addAll(List<String>.from(selected["treatment"]!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back),
                        ),
                        const Text(
                          "Analysis Result",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: primaryGreen,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: Stack(
                        children: [
                          Image.file(
                            widget.image,
                            height: 320,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            height: 320,
                            color: Colors.black.withOpacity(0.30),
                          ),
                          Positioned(
                            left: 20,
                            bottom: 25,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Disease Name",
                                  style: TextStyle(color: Colors.white70),
                                ),
                                const SizedBox(height: 6),
                                SizedBox(
                                  width: 220,
                                  child: Text(
                                    diseaseName,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 20,
                            bottom: 28,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: risk == "HIGH CONFIDENCE"
                                    ? Colors.green
                                    : Colors.orange,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                risk,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 22),

                    _sectionCard(
                      title: "Introduction",
                      child: Text(
                        intro,
                        style: const TextStyle(
                          fontSize: 17,
                          height: 1.7,
                          color: Colors.black87,
                        ),
                      ),
                    ),

                    const SizedBox(height: 22),

                    _sectionCard(
                      title: "How to Avoid (Prevention)",
                      child: Column(
                        children: List.generate(
                          prevention.length,
                          (index) => _iconRow(
                            Icons.check_circle_outline,
                            prevention[index],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 22),

                    _sectionCard(
                      title: "Practical Activity",
                      child: Column(
                        children: [
                          ...List.generate(
                            treatment.length,
                            (index) => _stepCard(
                              index + 1,
                              treatment[index],
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryGreen,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 18,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "MARK AS COMPLETED",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _sectionCard({
    required String title,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: primaryGreen,
            ),
          ),
          const SizedBox(height: 18),
          child,
        ],
      ),
    );
  }

  Widget _iconRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.green.shade50,
            child: Icon(
              icon,
              color: primaryGreen,
              size: 20,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _stepCard(int no, String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Text(
            no.toString().padLeft(2, '0'),
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade400,
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 17,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}