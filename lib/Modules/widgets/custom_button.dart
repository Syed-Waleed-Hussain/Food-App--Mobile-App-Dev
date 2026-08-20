import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

/// Premium custom button supporting gradients, shadows, icons, and outlined styles
/// using pure core Flutter widgets.
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isOutlined;
  final bool isFullWidth;
  final double height;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsetsGeometry padding;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.isOutlined = false,
    this.isFullWidth = true,
    this.height = 54.0,
    this.backgroundColor,
    this.textColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  });

  @override
  Widget build(BuildContext context) {
    if (isOutlined) {
      return SizedBox(
        width: isFullWidth ? double.infinity : null,
        height: height,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: textColor ?? AppColors.primary,
            side: BorderSide(color: backgroundColor ?? AppColors.primary, width: 1.5),
            shape: RoundedRectangleBorder(borderRadius: AppStyles.roundedMedium),
            padding: padding,
          ),
          onPressed: onPressed,
          child: _buildChildContent(),
        ),
      );
    }

    return Container(
      width: isFullWidth ? double.infinity : null,
      height: height,
      decoration: BoxDecoration(
        gradient: backgroundColor == null ? AppColors.primaryGradient : null,
        color: backgroundColor,
        borderRadius: AppStyles.roundedMedium,
        boxShadow: onPressed != null ? AppStyles.primaryButtonShadow : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: AppStyles.roundedMedium,
          onTap: onPressed,
          child: Padding(
            padding: padding,
            child: Center(child: _buildChildContent()),
          ),
        ),
      ),
    );
  }

  Widget _buildChildContent() {
    if (icon == null) {
      return Text(
        text,
        style: AppStyles.buttonText.copyWith(
          color: isOutlined ? (textColor ?? AppColors.primary) : (textColor ?? AppColors.textOnPrimary),
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 20,
          color: isOutlined ? (textColor ?? AppColors.primary) : (textColor ?? AppColors.textOnPrimary),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: AppStyles.buttonText.copyWith(
            color: isOutlined ? (textColor ?? AppColors.primary) : (textColor ?? AppColors.textOnPrimary),
          ),
        ),
      ],
    );
  }
}
