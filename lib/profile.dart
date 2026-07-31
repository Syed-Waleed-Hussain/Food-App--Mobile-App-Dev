import 'package:flutter/material.dart';

class profilescreen extends StatelessWidget {
  const profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            color: Colors.deepPurpleAccent,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250),
            child: Column(
              children: [
                Text(
                  "Syed Waleed",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ), 
                SizedBox(height: 20), 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, color: Colors.grey, size: 16),
                    Text(
                      "Karachi, Pakistan",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: _detailedbox("120", "Posts"),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: _detailedbox("10k", "Followers"),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: _detailedbox("500", "Following"),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20), 
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ), 
          
          Positioned(
            top: 130,
            left: MediaQuery.of(context).size.width / 2 - 50,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.teal,
                shape: BoxShape.circle,
              ), 
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _detailedbox(String number, String label) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.purple.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column( 
        children: [
          Text(number, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.deepPurple)),
          Text(label, style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}