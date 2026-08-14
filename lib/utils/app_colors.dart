import 'package:flutter/material.dart';

/// Centralized application color palette designed for high aesthetic contrast,
/// visual warmth, and modern glassmorphic/neumorphic elegance.
class AppColors {
  AppColors._();

  // Primary & Accent Brand Colors
  static const Color primary = Color(0xFFB71C1C); // Deep rich crimson
  static const Color primaryDark = Color(0xFF7F0000); // Luxury burgundy
  static const Color primaryLight = Color(0xFFFF5252); // Energetic scarlet coral
  static const Color primaryGradientStart = Color(0xFFC62828);
  static const Color primaryGradientEnd = Color(0xFF8E0000);

  // Secondary & Accents
  static const Color accent = Color(0xFFFFB300); // Warm appetizing golden amber
  static const Color accentLight = Color(0xFFFFF8E1); // Soft amber tint
  static const Color success = Color(0xFF2E7D32); // Fresh mint green
  static const Color star = Color(0xFFFFB800); // Rating star yellow

  // Background & Surface Tokens
  static const Color scaffoldBackground = Color(0xFFF9F9FB); // Clean modern canvas
  static const Color surface = Color(0xFFFFFFFF); // Pure white card surface
  static const Color surfaceVariant = Color(0xFFF3F4F6); // Soft cool grey
  static const Color surfaceWarm = Color(0xFFFFF5F5); // Soft crimson tint for cards

  // Text Colors
  static const Color textPrimary = Color(0xFF1A1A1A); // High contrast dark charcoal
  static const Color textSecondary = Color(0xFF6B7280); // Subdued metadata grey
  static const Color textTertiary = Color(0xFF9CA3AF); // Light placeholder grey
  static const Color textOnPrimary = Color(0xFFFFFFFF); // White text on crimson

  // Borders & Dividers
  static const Color borderLight = Color(0xFFE5E7EB);
  static const Color borderSubtle = Color(0xFFF0F0F0);

  // Shadows
  static const Color shadow = Color(0x0C000000);
  static const Color shadowStrong = Color(0x1F8E0000);

  // Common App Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryGradientStart, primaryGradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient luxuryCardGradient = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFFFBFBFC)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient bannerGradient = LinearGradient(
    colors: [Color(0xFFD32F2F), Color(0xFF8B0000)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
