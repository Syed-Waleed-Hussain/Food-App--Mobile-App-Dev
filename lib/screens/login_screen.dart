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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  shape: BoxShape.circle,
                ),
                height: 100,
                width: 100,
                child: Icon(Icons.fastfood, size: 50, color: Colors.red.shade900),
              ),
              const SizedBox(height: 20),
              Text(
                AppStrings.greet,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.red.shade900,
                ),
              ),
              const SizedBox(height: 40),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: AppStrings.email,
                  hintText: AppStrings.emailHint,
                  prefixIcon: const Icon(Icons.email, color: Colors.red),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: AppStrings.password,
                  hintText: AppStrings.passwordHint,
                  prefixIcon: const Icon(Icons.lock, color: Colors.red),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade900,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    Get.offNamed(AppRoutes.menu);
                  },
                  child: const Text(
                    AppStrings.login,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.signup);
                },
                child: Text(
                  AppStrings.dontHaveAccount,
                  style: TextStyle(color: Colors.red.shade900, fontSize: 15),
                ),
              ),
              const SizedBox(height: 20),
              const Text(AppStrings.orlogin, style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 15),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.facebook, color: Colors.blue, size: 36),
                  SizedBox(width: 25),
                  Icon(Icons.phone, color: Colors.green, size: 36),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}