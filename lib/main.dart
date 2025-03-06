// Di main.dart
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tugas_android/Kamera/take_picture_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  
  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;
  
  const MyApp({Key? key, required this.camera}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kamera dengan Filter',
      theme: ThemeData.dark(),
      home: TakePictureScreen(camera: camera),
      debugShowCheckedModeBanner: false,
    );
  }
}