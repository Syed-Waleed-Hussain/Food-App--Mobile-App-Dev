import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 30),
              Row(
                children: [
                  Icon(Icons.arrow_back, color: Colors.white),
                  SizedBox(width: 100),
                  Text("Profile", style: TextStyle(color: Colors.white, fontSize: 22)),
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
                    Text("Syed Waleed Hussain", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text("+92 315 2593961"),
                    Text("syedwaleedhussain11@gmail.com"),
                    SizedBox(height: 30),
                    Container(height: 1, color: Colors.black),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.dark_mode),
                        SizedBox(width: 20),
                        Text("Dark mode"),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.person_outline),
                        SizedBox(width: 20),
                        Text("Profile Details"),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.settings),
                        SizedBox(width: 20),
                        Text("Settings"),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.logout),
                        SizedBox(width: 20),
                        Text("Logout"),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}