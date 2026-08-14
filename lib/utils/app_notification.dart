import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import 'app_colors.dart';
import 'app_styles.dart';

/// Global non-blocking notification & snackbar manager.
/// Ensures toasts never obscure primary CTA buttons, support swipe-to-dismiss,
/// and provide responsive "View Cart" touch targets.
class AppNotification {
  AppNotification._();

  /// Displays an elevated, dismissible order confirmation banner that never blocks bottom buttons.
  static void showOrderAdded(
    BuildContext context, {
    required String itemName,
    required int quantity,
    double bottomMargin = 85.0,
  }) {
    // Clear any lingering notifications to avoid stacking or blocking
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.horizontal,
        margin: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: bottomMargin,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        backgroundColor: AppColors.primaryDark,
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: AppStyles.roundedMedium,
          side: BorderSide(
            color: Colors.white.withValues(alpha: 0.15),
            width: 1,
          ),
        ),
        showCloseIcon: true,
        closeIconColor: Colors.white70,
        content: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Added to Order!",
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "$quantity x $itemName",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withValues(alpha: 0.85),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
        action: SnackBarAction(
          label: "VIEW CART",
          textColor: AppColors.accent,
          disabledTextColor: Colors.grey,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            Navigator.of(context).pushNamed(AppRoutes.cart);
          },
        ),
      ),
    );
  }

  /// Displays standard informational or success messages with auto-dismiss.
  static void showMessage(
    BuildContext context, {
    required String message,
    bool isError = false,
    double bottomMargin = 85.0,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.horizontal,
        margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: bottomMargin),
        backgroundColor: isError ? Colors.red.shade900 : AppColors.primaryDark,
        shape: RoundedRectangleBorder(borderRadius: AppStyles.roundedMedium),
        content: Text(
          message,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  /// Clears all active snackbars immediately.
  static void clear(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
  }
}
