import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';
import '../utils/app_strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 80), 
            
            Container(
              decoration: BoxDecoration(
                color: Colors.pink.shade50,
                shape: BoxShape.circle,
              ),
              height: 100,
              width: 100,
              child: Icon(Icons.fastfood, size: 50, color: Colors.red),
            ),
            SizedBox(height: 20),
            
            Text(
              AppStrings.greet,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.red.shade900,
              ),
            ),
            SizedBox(height: 40),
            
            // Email Field
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: AppStrings.email,
                hintText: AppStrings.emailHint, 
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
                labelText: AppStrings.password,
                hintText: AppStrings.passwordHint,
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
                onPressed: (){
                  Get.toNamed(
                    AppRoutes.signup,
                  );
                },
                child: Text(AppStrings.signup, style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
            SizedBox(height: 30),
            
            // Social Icons
            Text(AppStrings.orlogin, style: TextStyle(color: Colors.grey)),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.facebook, color: Colors.blue, size: 30),
                SizedBox(width: 20),
                Icon(Icons.phone, color: Colors.green, size: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}