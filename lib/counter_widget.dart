import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  // Simple integer variable to hold value
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Displaying current value
        Text(
          '$counter',
          style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        // Plus and Minus buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  counter--; // Decrease counter
                });
              },
              child: const Text('-'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  counter++; // Increase counter
                });
              },
              child: const Text('+'),
            ),
          ],
        ),
      ],
    );
  }
}