import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';
import '../utils/app_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade900,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    const SizedBox(width: 80),
                    const Text(
                      AppStrings.profile,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/Profile.jpeg'),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        AppStrings.username,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      const Text(AppStrings.number, style: TextStyle(color: Colors.grey)),
                      const Text(AppStrings.emailAddress, style: TextStyle(color: Colors.grey)),
                      const SizedBox(height: 25),
                      const Divider(color: Colors.grey),
                      const SizedBox(height: 10),
                      _buildProfileOption(
                        icon: Icons.dark_mode,
                        title: AppStrings.darkMode,
                        onTap: () {},
                      ),
                      _buildProfileOption(
                        icon: Icons.person_outline,
                        title: AppStrings.profileDetails,
                        onTap: () {},
                      ),
                      _buildProfileOption(
                        icon: Icons.settings,
                        title: AppStrings.settings,
                        onTap: () {
                          Get.toNamed(AppRoutes.settings);
                        },
                      ),
                      _buildProfileOption(
                        icon: Icons.logout,
                        title: AppStrings.logout,
                        textColor: Colors.red.shade900,
                        iconColor: Colors.red.shade900,
                        onTap: () {
                          Get.offAllNamed(AppRoutes.login);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? textColor,
    Color? iconColor,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0),
        child: Row(
          children: [
            Icon(icon, color: iconColor ?? Colors.black87),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: textColor ?? Colors.black87,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}