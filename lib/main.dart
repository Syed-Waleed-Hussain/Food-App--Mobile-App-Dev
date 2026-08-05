import 'package:flutter/material.dart';
import 'routes/route_management.dart';
import 'routes/app_routes.dart';
import 'utils/app_strings.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF3A5BFF),
        scaffoldBackgroundColor: const Color(0xFFF7F8FC),
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black87,
          centerTitle: false,
        ),
      ),
      
      initialRoute: AppRoutes.productDetail,
      getPages: AppPages.pages,
    );
  }
}