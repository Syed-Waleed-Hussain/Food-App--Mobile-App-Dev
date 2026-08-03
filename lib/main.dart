import 'package:flutter/material.dart';
import 'profile.dart';
import 'setting_screen.dart';
import 'home_screen.dart';
import 'manu_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: manu_screen(), 
    );
  }
}