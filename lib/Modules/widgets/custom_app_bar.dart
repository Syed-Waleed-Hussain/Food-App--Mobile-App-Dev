import 'package:flutter/material.dart';
import '../../bindings/app_bindings.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

/// Top bar with back navigation, screen title, and live reactive cart badge
/// using pure ListenableBuilder (native Flutter).
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final bool showCartButton;
  final bool showProfileButton;
  final VoidCallback? onBack;
  final List<Widget>? actions;
  final Color backgroundColor;
  final Color foregroundColor;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.showCartButton = true,
    this.showProfileButton = false,
    this.onBack,
    this.actions,
    this.backgroundColor = Colors.transparent,
    this.foregroundColor = AppColors.textPrimary,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left Action / Back Button
            if (showBackButton)
              Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  shape: BoxShape.circle,
                  boxShadow: AppStyles.softCardShadow,
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_new, size: 18, color: foregroundColor),
                  onPressed: onBack ?? () => Navigator.of(context).pop(),
                ),
              )
            else
              const SizedBox(width: 44),

            // Title
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppStyles.heading3.copyWith(color: foregroundColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // Right Actions
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...?actions,
                if (showCartButton)
                  ListenableBuilder(
                    listenable: AppBindings.cartController,
                    builder: (context, child) {
                      final cartCount = AppBindings.cartController.itemCount;
                      return Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.surface,
                              shape: BoxShape.circle,
                              boxShadow: AppStyles.softCardShadow,
                            ),
                            child: IconButton(
                              icon: Icon(Icons.shopping_bag_outlined, size: 20, color: foregroundColor),
                              onPressed: () {
                                Navigator.of(context).pushNamed(AppRoutes.cart);
                              },
                            ),
                          ),
                          if (cartCount > 0)
                            Positioned(
                              top: -2,
                              right: -2,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  color: AppColors.primary,
                                  shape: BoxShape.circle,
                                ),
                                constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
                                child: Center(
                                  child: Text(
                                    '$cartCount',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                if (showProfileButton) ...[
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      shape: BoxShape.circle,
                      boxShadow: AppStyles.softCardShadow,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.person_outline, size: 20, color: AppColors.textPrimary),
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.profile);
                      },
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
