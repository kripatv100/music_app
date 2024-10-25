import 'package:flutter/material.dart';
import 'package:music_app/screens/screen_app.dart';
import 'package:music_app/screens/screen_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ScreenApp(),
    );
  }
}
