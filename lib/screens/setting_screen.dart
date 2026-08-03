import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Text(
              "Settings",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Container(
                  width: 15,
                  height: 15,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 20),
                const SizedBox(
                  width: 150,
                  child: Text("Account", style: TextStyle(fontSize: 16)),
                ),
                const Text(">", style: TextStyle(fontSize: 20, color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Container(
                  width: 15,
                  height: 15,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 20),
                const SizedBox(
                  width: 150,
                  child: Text("Notifications", style: TextStyle(fontSize: 16)),
                ),
                const Text(">", style: TextStyle(fontSize: 20, color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Container(
                  width: 15,
                  height: 15,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 20),
                const SizedBox(
                  width: 150,
                  child: Text("Privacy", style: TextStyle(fontSize: 16)),
                ),
                const Text(">", style: TextStyle(fontSize: 20, color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Container(
                  width: 15,
                  height: 15,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 20),
                const SizedBox(
                  width: 150,
                  child: Text("Help and support", style: TextStyle(fontSize: 16)),
                ),
                const Text(">", style: TextStyle(fontSize: 20, color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}