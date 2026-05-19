import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'screens/loading_screen.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const TeaApp());
}

class TeaApp extends StatelessWidget {
  const TeaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}