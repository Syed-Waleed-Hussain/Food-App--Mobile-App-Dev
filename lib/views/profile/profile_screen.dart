import 'package:flutter/material.dart';
import '../../bindings/app_bindings.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_styles.dart';
import '../widgets/custom_app_bar.dart';

/// Sophisticated User Profile Screen featuring loyalty VIP card,
/// interactive settings toggles, and seamless logout.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: const CustomAppBar(
        title: AppStrings.profile,
        showBackButton: true,
        showCartButton: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Column(
            children: [
              // User Avatar & Name Header Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: AppStyles.cardDecoration,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.primary, width: 2.5),
                            boxShadow: AppStyles.softCardShadow,
                          ),
                          child: const ClipOval(
                            child: Image(
                              image: AssetImage('assets/images/Profile.jpeg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.verified, size: 18, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Text(
                      AppBindings.authController.userName,
                      style: AppStyles.heading2,
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      AppStrings.userTitle,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      AppBindings.authController.email,
                      style: AppStyles.bodySmall,
                    ),
                    Text(
                      AppBindings.authController.phone,
                      style: AppStyles.bodySmall,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // VIP Rewards Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: AppStyles.roundedLarge,
                  boxShadow: AppStyles.primaryButtonShadow,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.workspace_premium_rounded, color: AppColors.accent, size: 24),
                            SizedBox(width: 8),
                            Text(
                              "VIP Gourmet Club",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        ListenableBuilder(
                          listenable: AppBindings.authController,
                          builder: (context, child) {
                            return Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                "${AppBindings.authController.rewardPoints} Pts",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 13,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Earn 50 bonus points on every order. Redeem for free desserts & appetizers!",
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // Settings & Options List
              Container(
                decoration: AppStyles.cardDecoration,
                child: Column(
                  children: [
                    _buildOptionTile(
                      icon: Icons.person_outline_rounded,
                      title: AppStrings.profileDetails,
                      onTap: () {},
                    ),
                    const Divider(height: 1, indent: 56, endIndent: 16),
                    _buildOptionTile(
                      icon: Icons.receipt_long_rounded,
                      title: AppStrings.orderHistory,
                      onTap: () {},
                    ),
                    const Divider(height: 1, indent: 56, endIndent: 16),
                    _buildOptionTile(
                      icon: Icons.location_on_outlined,
                      title: AppStrings.deliveryAddresses,
                      onTap: () {},
                    ),
                    const Divider(height: 1, indent: 56, endIndent: 16),
                    _buildOptionTile(
                      icon: Icons.credit_card_rounded,
                      title: AppStrings.paymentMethods,
                      onTap: () {},
                    ),
                    const Divider(height: 1, indent: 56, endIndent: 16),
                    _buildOptionTile(
                      icon: Icons.settings_outlined,
                      title: AppStrings.settings,
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutes.settings);
                      },
                    ),
                    const Divider(height: 1, indent: 56, endIndent: 16),
                    _buildOptionTile(
                      icon: Icons.logout_rounded,
                      title: AppStrings.logout,
                      iconColor: AppColors.primary,
                      textColor: AppColors.primary,
                      onTap: () {
                        AppBindings.authController.logout();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRoutes.login,
                          (route) => false,
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? iconColor,
    Color? textColor,
  }) {
    return ListTile(
      leading: Container(
        height: 38,
        width: 38,
        decoration: BoxDecoration(
          color: (iconColor ?? AppColors.primary).withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: iconColor ?? AppColors.primary, size: 20),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: textColor ?? AppColors.textPrimary,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.textTertiary),
      onTap: onTap,
    );
  }
}
