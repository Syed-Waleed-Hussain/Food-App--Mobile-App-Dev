import 'package:flutter/material.dart';
// Dono banayi hui files import ki hain
import 'profile_card.dart';
import 'counter_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Day 1 Practice'),
        ),
        // Task 3: Combine in single Column inside Scaffold
        body: Column(
          children: const [
            // Task 1: Custom ProfileCard Widget
            ProfileCard(
              name: 'Waleed Hussain',
              bio: 'Flutter Learner',
            ),
            
            SizedBox(height: 20),
            
            // Task 2: Custom Counter Widget
            CounterWidget(),
          ],
        ),
      ),
    );
  }
}