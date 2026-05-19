import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import '../main.dart';
import 'account_screen.dart';
import 'analysis_screen.dart';

class IdentifyScreen extends StatefulWidget {
  const IdentifyScreen({super.key});

  @override
  State<IdentifyScreen> createState() => _IdentifyScreenState();
}

class _IdentifyScreenState extends State<IdentifyScreen> {

  CameraController? _controller;
  File? _image;
  final ImagePicker _picker = ImagePicker();

  static const Color primaryGreen = Color(0xFF173809);

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    _controller = CameraController(
      cameras[0],
      ResolutionPreset.high,
    );

    await _controller!.initialize();

    if (!mounted) return;
    setState(() {});
  }

  // 📸 CAPTURE
  Future<void> _captureImage() async {
    if (!_controller!.value.isInitialized) return;

    final image = await _controller!.takePicture();

    setState(() {
      _image = File(image.path);
    });
  }

  // 📂 UPLOAD
  Future<void> _pickFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // 🔥 REMOVE SCAFFOLD → return directly
    if (_controller == null || !_controller!.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Stack(
      children: [

        //  LIVE CAMERA
        SizedBox.expand(
          child: CameraPreview(_controller!),
        ),

        // 🌫 OVERLAY
        Container(
          color: Colors.black.withOpacity(0.2),
        ),

        //  TOP
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                //  ORIGINAL SIMPLE BUTTON (NOW WORKS)
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),

                const Text(
                  "Ceylon Tea Smart",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // ACCOUNT
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const AccountScreen()),
                    );
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.white24,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),

        //  TEXT
        Positioned(
          top: 120,
          left: 0,
          right: 0,
          child: Column(
            children: const [
              Text(
                "Center the Leaf",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Ensure leaf edges are visible for precise analysis",
                style: TextStyle(color: Colors.white70),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),

        //  FRAME
        Center(
          child: Container(
            width: 220,
            height: 220,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white70, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),

        // CONTROLS
        Positioned(
          bottom: 30,
          left: 20,
          right: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.white24),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                //  UPLOAD
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.upload, color: Colors.white),
                      onPressed: _pickFromGallery,
                    ),
                    const Text(
                      "UPLOAD",
                      style: TextStyle(color: Colors.white70, fontSize: 10),
                    )
                  ],
                ),

                //  CAPTURE
                GestureDetector(
                  onTap: _captureImage,
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryGreen,
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                    child: const Icon(Icons.camera_alt, color: Colors.white, size: 30),
                  ),
                ),

                Column(
  children: [
    IconButton(
      icon: const Icon(Icons.arrow_forward, color: Colors.white),
      onPressed: () {
        if (_image == null) return;

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AnalysisScreen(image: _image!),
          ),
        );
      },
    ),
    const SizedBox(height: 5),
    const Text(
      "NEXT",
      style: TextStyle(color: Colors.white70, fontSize: 10),
    )
  ],
),
              ],
            ),
          ),
        ),
      ],
    );
  }
}