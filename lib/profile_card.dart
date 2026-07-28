import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  // Parameters for name and bio
  final String name;
  final String bio;

  const ProfileCard({
    super.key,
    required this.name,
    required this.bio,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlue.shade50, // Bonus: Background color
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            // Bonus: Rounded Image Placeholder
            const CircleAvatar(
              radius: 25,
              child: Icon(Icons.person),
            ),
            const SizedBox(width: 15),
            // Text values display
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18, 
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(bio),
              ],
            ),
          ],
        ),
      ),
    );
  }
}