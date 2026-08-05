import 'package:flutter/material.dart';
import 'package:foodapp/utils/app_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: 
      Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              children: [
                Icon(Icons.arrow_back, color: Colors.white),
                SizedBox(width: 100),
                Text(AppStrings.profile, style: TextStyle(color: Colors.white, fontSize: 22)),
              ],
            ),
            SizedBox(height: 40),
            Container(
              width: double.infinity,
              color: Colors.pink[100],
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/Profile.jpeg'),
                  ),
                  SizedBox(height: 10),
                  Text(AppStrings.username, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(AppStrings.number),
                  Text(AppStrings.emailAddress),
                  SizedBox(height: 30),
                  Container(height: 1, color: Colors.black),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.dark_mode),
                      SizedBox(width: 20),
                      Text(AppStrings.darkMode),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.person_outline),
                      SizedBox(width: 20),
                      Text(AppStrings.profileDetails),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(width: 20),
                      Text(AppStrings.settings),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.logout),
                      SizedBox(width: 20),
                      Text(AppStrings.logout),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}