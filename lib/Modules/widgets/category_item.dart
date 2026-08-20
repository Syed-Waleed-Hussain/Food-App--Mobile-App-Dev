import 'package:flutter/material.dart';
import '../../models/category_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

/// Category pill card supporting active state highlights and crisp asset images.
class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.surface,
          borderRadius: BorderRadius.circular(30),
          boxShadow: isSelected ? AppStyles.primaryButtonShadow : AppStyles.softCardShadow,
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.borderLight,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 36,
              width: 36,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white.withValues(alpha: 0.2) : AppColors.surfaceWarm,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                category.assetImage,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Icon(
                  category.icon,
                  size: 18,
                  color: isSelected ? Colors.white : AppColors.primary,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              category.name,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                color: isSelected ? AppColors.textOnPrimary : AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
