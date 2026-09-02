import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'signup_controller.dart';
import '../../bindings/app_bindings.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_notification.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_styles.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

/// Clean and accessible Sign Up Screen with live input validation.
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final controller = Get.find<SignupController>();

  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        AppNotification.clear(context);
      }
    });
  }

  void _handleSignup() {
    if (controller.formKey.currentState?.validate() ?? false) {
      final success = AppBindings.authController.signup(
        controller.nameController.text,
        controller.emailController.text,
        controller.passwordController.text,
      );
      if (success) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.menu);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App Icon Container
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      shape: BoxShape.circle,
                      boxShadow: AppStyles.primaryButtonShadow,
                    ),
                    child: const Center(
                      child: Icon(Icons.person_add_alt_1_rounded, size: 38, color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Heading
                  const Text(
                    AppStrings.signup,
                    style: AppStyles.heading1,
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    AppStrings.signupSubtitle,
                    textAlign: TextAlign.center,
                    style: AppStyles.bodyMedium,
                  ),

                  const SizedBox(height: 28),

                  // Form Container
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: AppStyles.cardDecoration,
                    child: Column(
                      children: [
                        // Full Name
                        CustomTextField(
                          controller: controller.nameController,
                          labelText: AppStrings.fullname,
                          hintText: AppStrings.fullnameHint,
                          prefixIcon: Icons.badge_outlined,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Please enter your full name";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 16),

                        // Email Field
                        CustomTextField(
                          controller: controller.emailController,
                          labelText: AppStrings.email,
                          hintText: AppStrings.emailHint,
                          prefixIcon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Please enter your email";
                            }
                            if (!value.contains('@')) {
                              return "Please enter a valid email address";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 16),

                        // Password Field
                        CustomTextField(
                          controller: controller.passwordController,
                          labelText: AppStrings.password,
                          hintText: AppStrings.passwordHint,
                          prefixIcon: Icons.lock_outline,
                          obscureText: _obscurePassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                              color: AppColors.textSecondary,
                              size: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Please create a password";
                            }
                            if (value.trim().length < 4) {
                              return "Password must be at least 4 characters";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 24),

                        // Submit Button
                        CustomButton(
                          text: AppStrings.signup,
                          icon: Icons.check_circle_outline,
                          onPressed: _handleSignup,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Already have account
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: AppStyles.bodyMedium,
                        children: const [
                          TextSpan(
                            text: "Sign In",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
