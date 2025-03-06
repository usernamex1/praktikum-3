// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:camera/camera.dart';
import 'package:tugas_android/Kamera/take_picture_screen.dart';

// Import main.dart tidak dihapus untuk menghindari error lain
import 'package:tugas_android/main.dart';

void main() {
  testWidgets('TakePictureScreen smoke test', (WidgetTester tester) async {
    // Buat mock camera
    final mockCamera = CameraDescription(
      name: 'mock',
      lensDirection: CameraLensDirection.back,
      sensorOrientation: 0,
    );
    
    // Build widget TakePictureScreen dengan mock camera
    await tester.pumpWidget(
      MaterialApp(
        home: TakePictureScreen(camera: mockCamera),
      ),
    );

    // Verifikasi bahwa Appbar memiliki judul 'Ambil Foto'
    expect(find.text('Ambil Foto'), findsOneWidget);
    
    // Verifikasi ada tombol kamera
    expect(find.byIcon(Icons.camera_alt), findsOneWidget);
  });
}