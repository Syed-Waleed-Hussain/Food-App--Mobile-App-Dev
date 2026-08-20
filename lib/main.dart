import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'bindings/app_bindings.dart';
import 'routes/app_routes.dart';
import 'routes/route_generator.dart';
import 'utils/app_colors.dart';
import 'utils/app_strings.dart';
import 'utils/app_styles.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Set system UI overlay style for seamless edge-to-edge status bar
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const FoodApp());
}

/// Root Application Widget configured with Material 3, custom themes,
/// and standard onGenerateRoute without external dependencies.
class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppBindings.authController,
      builder: (context, child) {
        final isDark = AppBindings.authController.isDarkMode;

        return GetMaterialApp(
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
            scaffoldBackgroundColor: AppColors.scaffoldBackground,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primary,
              primary: AppColors.primary,
              secondary: AppColors.accent,
              surface: AppColors.surface,
              brightness: Brightness.light,
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              scrolledUnderElevation: 0,
              iconTheme: IconThemeData(color: AppColors.textPrimary),
              titleTextStyle: AppStyles.heading3,
            ),
            cardTheme: CardThemeData(
              color: AppColors.surface,
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: AppStyles.roundedMedium),
            ),
            dividerTheme: const DividerThemeData(
              color: AppColors.borderLight,
              thickness: 1,
            ),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            scaffoldBackgroundColor: const Color(0xFF121212),
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primary,
              primary: AppColors.primaryLight,
              secondary: AppColors.accent,
              surface: const Color(0xFF1E1E1E),
              brightness: Brightness.dark,
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              scrolledUnderElevation: 0,
              iconTheme: IconThemeData(color: Colors.white),
              titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
            ),
            cardTheme: CardThemeData(
              color: const Color(0xFF1E1E1E),
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: AppStyles.roundedMedium),
            ),
            dividerTheme: const DividerThemeData(
              color: Color(0xFF2C2C2C),
              thickness: 1,
            ),
          ),
          initialRoute: AppRoutes.home,
          onGenerateRoute: RouteGenerator.generateRoute,
        );
      },
    );
  }
}