import 'package:flutter/material.dart';
import '../../bindings/app_bindings.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_notification.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_styles.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

/// Clean, beautifully styled Login Screen using pure Flutter form validation
/// and standard Navigator.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: "syedwaleedhussain11@gmail.com");
  final _passwordController = TextEditingController(text: "gourmet123");
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      final success = AppBindings.authController.login(
        _emailController.text,
        _passwordController.text,
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
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App Icon Container with double ring shadow
                  Container(
                    height: 84,
                    width: 84,
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      shape: BoxShape.circle,
                      boxShadow: AppStyles.primaryButtonShadow,
                    ),
                    child: const Center(
                      child: Icon(Icons.lunch_dining, size: 42, color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Heading
                  const Text(
                    AppStrings.greet,
                    style: AppStyles.heading1,
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    AppStrings.loginSubtitle,
                    textAlign: TextAlign.center,
                    style: AppStyles.bodyMedium,
                  ),

                  const SizedBox(height: 32),

                  // Login Form Card
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: AppStyles.cardDecoration,
                    child: Column(
                      children: [
                        // Email Field
                        CustomTextField(
                          controller: _emailController,
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

                        const SizedBox(height: 18),

                        // Password Field
                        CustomTextField(
                          controller: _passwordController,
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
                              return "Please enter your password";
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
                          text: AppStrings.login,
                          icon: Icons.login_rounded,
                          onPressed: _handleLogin,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Don't have an account
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.signup);
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: AppStyles.bodyMedium,
                        children: const [
                          TextSpan(
                            text: "Sign Up",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Alternative Login Options (Pure Material Icons)
                  const Text(AppStrings.orlogin, style: AppStyles.bodySmall),

                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialIconButton(
                        icon: Icons.phone_android_rounded,
                        color: Colors.green.shade700,
                        onTap: () {},
                      ),
                      const SizedBox(width: 16),
                      _buildSocialIconButton(
                        icon: Icons.mail_outline_rounded,
                        color: Colors.blue.shade700,
                        onTap: () {},
                      ),
                      const SizedBox(width: 16),
                      _buildSocialIconButton(
                        icon: Icons.fingerprint_rounded,
                        color: AppColors.primary,
                        onTap: _handleLogin,
                      ),
                    ],
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

  Widget _buildSocialIconButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        shape: BoxShape.circle,
        boxShadow: AppStyles.softCardShadow,
        border: Border.all(color: AppColors.borderLight),
      ),
      child: IconButton(
        icon: Icon(icon, color: color, size: 22),
        onPressed: onTap,
      ),
    );
  }
}
