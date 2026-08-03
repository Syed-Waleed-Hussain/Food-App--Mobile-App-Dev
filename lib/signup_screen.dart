import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 195, 169, 169),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 60),
              
              Container(
                decoration: BoxDecoration(
                  color: Colors.pink.shade50,
                  shape: BoxShape.circle,
                ),
                height: 100,
                width: 100,
                child: Icon(Icons.person_add, size: 50, color: Colors.red),
              ),
              SizedBox(height: 20),
              
              Text(
                "Create Account",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.red.shade900,
                ),
              ),
              SizedBox(height: 40),
              
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: "Full Name",
                  hintText: "Enter your name",
                  prefixIcon: Icon(Icons.person, color: Colors.red),
                ),
              ),
              SizedBox(height: 20),

             
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: "Email",
                  hintText: "Enter Email",
                  prefixIcon: Icon(Icons.email, color: Colors.red),
                ),
              ),
              SizedBox(height: 20),
              
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: "Password",
                  hintText: "Create Password",
                  prefixIcon: Icon(Icons.lock, color: Colors.red),
                ),
              ),
              SizedBox(height: 30),
              
            
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                  ),
                  onPressed: () {
                   
                  },
                  child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}