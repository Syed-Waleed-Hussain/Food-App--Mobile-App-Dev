import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Centralized design typography, dimensions, and sophisticated elevation styles
/// built with double layered box-shadows and clean border radii.
class AppStyles {
  AppStyles._();

  // Border Radii
  static const double radiusSmall = 10.0;
  static const double radiusMedium = 16.0;
  static const double radiusLarge = 24.0;
  static const double radiusExtraLarge = 32.0;

  static final BorderRadius roundedSmall = BorderRadius.circular(radiusSmall);
  static final BorderRadius roundedMedium = BorderRadius.circular(radiusMedium);
  static final BorderRadius roundedLarge = BorderRadius.circular(radiusLarge);
  static final BorderRadius roundedExtraLarge = BorderRadius.circular(radiusExtraLarge);
  static const BorderRadius roundedTopLarge = BorderRadius.only(
    topLeft: Radius.circular(radiusExtraLarge),
    topRight: Radius.circular(radiusExtraLarge),
  );

  // Sophisticated Layered Box Shadows (Neumorphic / Modern Soft Elevations)
  static const List<BoxShadow> softCardShadow = [
    BoxShadow(
      color: Color(0x0A000000),
      offset: Offset(0, 4),
      blurRadius: 16,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x06000000),
      offset: Offset(0, 1),
      blurRadius: 4,
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> primaryButtonShadow = [
    BoxShadow(
      color: Color(0x3D990000),
      offset: Offset(0, 8),
      blurRadius: 20,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1F990000),
      offset: Offset(0, 2),
      blurRadius: 6,
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> glowShadow = [
    BoxShadow(
      color: Color(0x1AB71C1C),
      offset: Offset(0, 8),
      blurRadius: 24,
      spreadRadius: 2,
    ),
  ];

  // Reusable Container BoxDecorations
  static BoxDecoration cardDecoration = BoxDecoration(
    color: AppColors.surface,
    borderRadius: roundedMedium,
    boxShadow: softCardShadow,
    border: Border.all(color: AppColors.borderSubtle, width: 1),
  );

  static BoxDecoration warmCardDecoration = BoxDecoration(
    color: AppColors.surfaceWarm,
    borderRadius: roundedMedium,
    border: Border.all(color: AppColors.primaryLight.withValues(alpha: 0.15), width: 1),
  );

  // High-End Typography (Strictly using native standard Flutter TextStyle)
  static const TextStyle heading1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
    letterSpacing: -0.5,
    height: 1.2,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    letterSpacing: -0.3,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    letterSpacing: -0.2,
  );

  static const TextStyle subheader = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.textSecondary,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textTertiary,
  );

  static const TextStyle priceText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: AppColors.primary,
    letterSpacing: -0.5,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.textOnPrimary,
    letterSpacing: 0.2,
  );
}
