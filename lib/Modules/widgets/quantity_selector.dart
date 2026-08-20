import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

/// Refactored, responsive Counter & Quantity Selector with haptic feedback aesthetics.
class QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final double size;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    this.size = 36.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(size / 2),
        border: Border.all(color: AppColors.borderLight, width: 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Decrement Button
          _buildActionButton(
            icon: Icons.remove,
            onTap: onDecrement,
            isDecremental: true,
          ),

          // Quantity Display
          Container(
            constraints: BoxConstraints(minWidth: size),
            alignment: Alignment.center,
            child: Text(
              '$quantity',
              style: TextStyle(
                fontSize: size * 0.42,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
              ),
            ),
          ),

          // Increment Button
          _buildActionButton(
            icon: Icons.add,
            onTap: onIncrement,
            isDecremental: false,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required VoidCallback onTap,
    required bool isDecremental,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(size / 2),
        onTap: onTap,
        child: Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
            color: isDecremental ? AppColors.surface : AppColors.primary,
            shape: BoxShape.circle,
            boxShadow: isDecremental ? AppStyles.softCardShadow : AppStyles.primaryButtonShadow,
          ),
          child: Icon(
            icon,
            size: size * 0.5,
            color: isDecremental ? AppColors.textPrimary : Colors.white,
          ),
        ),
      ),
    );
  }
}
