import 'package:flutter/material.dart';
import '../../bindings/app_bindings.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_styles.dart';
import '../widgets/custom_app_bar.dart';

/// Settings & Preferences screen with interactive toggle switches.
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _orderNotifications = true;
  bool _promoAlerts = true;
  bool _soundEffects = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: const CustomAppBar(
        title: AppStrings.settings,
        showBackButton: true,
        showCartButton: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("App Preferences", style: AppStyles.heading3),
              const SizedBox(height: 10),

              // Preferences Container
              Container(
                decoration: AppStyles.cardDecoration,
                child: Column(
                  children: [
                    ListenableBuilder(
                      listenable: AppBindings.authController,
                      builder: (context, child) {
                        return SwitchListTile(
                          activeTrackColor: AppColors.primaryLight,
                          activeThumbColor: AppColors.primary,
                          title: const Text(
                            AppStrings.darkMode,
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          subtitle: const Text("Switch between light & dark aesthetics", style: AppStyles.bodySmall),
                          secondary: const Icon(Icons.dark_mode_outlined, color: AppColors.primary),
                          value: AppBindings.authController.isDarkMode,
                          onChanged: (val) {
                            AppBindings.authController.toggleDarkMode();
                          },
                        );
                      },
                    ),
                    const Divider(height: 1),
                    SwitchListTile(
                      activeTrackColor: AppColors.primaryLight,
                      activeThumbColor: AppColors.primary,
                      title: const Text(
                        "Push Notifications",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      subtitle: const Text("Receive live delivery tracking alerts", style: AppStyles.bodySmall),
                      secondary: const Icon(Icons.notifications_active_outlined, color: AppColors.primary),
                      value: _orderNotifications,
                      onChanged: (val) {
                        setState(() {
                          _orderNotifications = val;
                        });
                      },
                    ),
                    const Divider(height: 1),
                    SwitchListTile(
                      activeTrackColor: AppColors.primaryLight,
                      activeThumbColor: AppColors.primary,
                      title: const Text(
                        "Promotional Offers",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      subtitle: const Text("Get discounts and weekend chef specials", style: AppStyles.bodySmall),
                      secondary: const Icon(Icons.discount_outlined, color: AppColors.primary),
                      value: _promoAlerts,
                      onChanged: (val) {
                        setState(() {
                          _promoAlerts = val;
                        });
                      },
                    ),
                    const Divider(height: 1),
                    SwitchListTile(
                      activeTrackColor: AppColors.primaryLight,
                      activeThumbColor: AppColors.primary,
                      title: const Text(
                        "Sound Effects",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      subtitle: const Text("App interaction feedback audio", style: AppStyles.bodySmall),
                      secondary: const Icon(Icons.volume_up_outlined, color: AppColors.primary),
                      value: _soundEffects,
                      onChanged: (val) {
                        setState(() {
                          _soundEffects = val;
                        });
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              const Text("About Application", style: AppStyles.heading3),
              const SizedBox(height: 10),

              // About App Container
              Container(
                decoration: AppStyles.cardDecoration,
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.info_outline, color: AppColors.primary),
                      title: const Text("App Version", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                      trailing: const Text("v1.0.0 (Elite Edition)", style: AppStyles.bodySmall),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.code_rounded, color: AppColors.primary),
                      title: const Text("Architecture", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                      trailing: const Text("Clean Pure Flutter", style: AppStyles.bodySmall),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.privacy_tip_outlined, color: AppColors.primary),
                      title: const Text("Privacy Policy", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.textTertiary),
                      onTap: () {},
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
}
