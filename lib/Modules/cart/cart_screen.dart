import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cart_controller.dart';
import '../../bindings/app_bindings.dart';
import '../../models/cart_item_model.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_notification.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_styles.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/quantity_selector.dart';

/// Shopping Cart screen with real-time financial recalculations, coupon redemption,
/// and order confirmation modal using pure Flutter.
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final controller = Get.find<CartModuleController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        AppNotification.clear(context);
      }
    });
  }

  void _showOrderSuccessDialog() {
    AppBindings.authController.addRewardPoints(50);
    AppBindings.cartController.clearCart();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: AppStyles.roundedLarge),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: AppColors.success.withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(Icons.check_circle_rounded, size: 50, color: AppColors.success),
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  AppStrings.orderSuccess,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  AppStrings.orderSuccessSubtitle,
                  textAlign: TextAlign.center,
                  style: AppStyles.bodyMedium,
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.accentLight,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.military_tech, color: AppColors.accent, size: 18),
                      SizedBox(width: 6),
                      Text(
                        "+50 VIP Loyalty Points Earned!",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF7A4B00),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                CustomButton(
                  text: AppStrings.backToMenu,
                  icon: Icons.restaurant_menu,
                  onPressed: () {
                    Navigator.of(context).pop(); // Close dialog
                    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.menu, (route) => false);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: const CustomAppBar(
        title: AppStrings.cartTitle,
        showBackButton: true,
        showCartButton: false,
      ),
      body: ListenableBuilder(
        listenable: AppBindings.cartController,
        builder: (context, child) {
          final cart = AppBindings.cartController;

          if (cart.isEmpty) {
            return _buildEmptyCart(context);
          }

          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Cart Items List
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${AppStrings.itemsInCart} (${cart.itemCount})",
                              style: AppStyles.heading3,
                            ),
                            TextButton(
                              onPressed: () => cart.clearCart(),
                              child: const Text(
                                "Clear All",
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cart.items.length,
                          separatorBuilder: (context, index) => const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final item = cart.items[index];
                            return _buildCartItemCard(item, index);
                          },
                        ),

                        const SizedBox(height: 20),

                        // Special Instructions
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: AppStyles.cardDecoration,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  Icon(Icons.edit_note, color: AppColors.primary, size: 20),
                                  SizedBox(width: 8),
                                  Text(
                                    AppStrings.specialInstructions,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                controller: controller.instructionsController,
                                decoration: const InputDecoration(
                                  hintText: "Special delivery or kitchen requests...",
                                  hintStyle: TextStyle(fontSize: 13, color: AppColors.textTertiary),
                                  border: InputBorder.none,
                                ),
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Promo Coupon Box
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: AppStyles.cardDecoration,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Have a Promo Code?",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      decoration: BoxDecoration(
                                        color: AppColors.surfaceVariant,
                                        borderRadius: AppStyles.roundedSmall,
                                      ),
                                      child: TextField(
                                        controller: controller.couponController,
                                        textCapitalization: TextCapitalization.characters,
                                        decoration: const InputDecoration(
                                          hintText: "Enter CHEF25",
                                          hintStyle: TextStyle(fontSize: 13, color: AppColors.textTertiary),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary,
                                      foregroundColor: Colors.white,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(borderRadius: AppStyles.roundedSmall),
                                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                                    ),
                                    onPressed: () {
                                      final success = cart.applyCoupon(controller.couponController.text);
                                      AppNotification.showMessage(
                                        context,
                                        message: success
                                            ? "Promo code applied successfully (25% OFF)!"
                                            : "Invalid code. Try using 'CHEF25'",
                                        isError: !success,
                                        bottomMargin: 90.0,
                                      );
                                    },
                                    child: const Text("Apply", style: TextStyle(fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                              if (cart.appliedCoupon.isNotEmpty) ...[
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(Icons.check_circle, color: AppColors.success, size: 16),
                                    const SizedBox(width: 6),
                                    Text(
                                      "Applied: ${cart.appliedCoupon}",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.success,
                                      ),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        cart.removeCoupon();
                                        controller.couponController.clear();
                                      },
                                      child: const Text(
                                        "Remove",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Bill Summary Card
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: AppStyles.cardDecoration,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Order Summary",
                                style: AppStyles.heading3,
                              ),
                              const SizedBox(height: 14),
                              _buildSummaryRow(AppStrings.subtotal, "\$${cart.subtotal.toStringAsFixed(2)}"),
                              if (cart.discountAmount > 0)
                                _buildSummaryRow(
                                  AppStrings.discount,
                                  "- \$${cart.discountAmount.toStringAsFixed(2)}",
                                  textColor: AppColors.success,
                                ),
                              _buildSummaryRow(
                                AppStrings.deliveryFee,
                                cart.deliveryFee == 0.0 ? "FREE" : "\$${cart.deliveryFee.toStringAsFixed(2)}",
                                textColor: cart.deliveryFee == 0.0 ? AppColors.success : null,
                              ),
                              _buildSummaryRow(AppStrings.tax, "\$${cart.taxAmount.toStringAsFixed(2)}"),
                              const Divider(height: 24),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    AppStrings.total,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  Text(
                                    "\$${cart.totalAmount.toStringAsFixed(2)}",
                                    style: AppStyles.priceText.copyWith(fontSize: 22),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),

                // Sticky Bottom Checkout
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: AppStyles.roundedTopLarge,
                    boxShadow: AppStyles.softCardShadow,
                    border: Border.all(color: AppColors.borderSubtle),
                  ),
                  child: CustomButton(
                    text: "${AppStrings.checkout} • \$${cart.totalAmount.toStringAsFixed(2)}",
                    icon: Icons.check_circle_outline,
                    onPressed: _showOrderSuccessDialog,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyCart(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: AppColors.surfaceWarm,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primaryLight.withValues(alpha: 0.2)),
              ),
              child: const Icon(Icons.remove_shopping_cart_outlined, size: 56, color: AppColors.primary),
            ),
            const SizedBox(height: 24),
            const Text(
              AppStrings.emptyCart,
              style: AppStyles.heading2,
            ),
            const SizedBox(height: 8),
            const Text(
              AppStrings.emptyCartSubtitle,
              textAlign: TextAlign.center,
              style: AppStyles.bodyMedium,
            ),
            const SizedBox(height: 32),
            CustomButton(
              text: "Explore Gourmet Menu",
              icon: Icons.restaurant_menu,
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.menu, (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItemCard(CartItem item, int index) {
    return Container(
      decoration: AppStyles.cardDecoration,
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Item Image
          Container(
            height: 70,
            width: 70,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppColors.surfaceWarm,
              borderRadius: AppStyles.roundedSmall,
            ),
            child: Image.asset(
              item.product.imageUrl,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.lunch_dining,
                size: 32,
                color: AppColors.primary,
              ),
            ),
          ),

          const SizedBox(width: 14),

          // Info Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                if (item.selectedAddons.isNotEmpty) ...[
                  Text(
                    "Addons: ${item.selectedAddons.join(', ')}",
                    style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                ],
                Text(
                  "\$${item.totalPrice.toStringAsFixed(2)}",
                  style: AppStyles.priceText.copyWith(fontSize: 16),
                ),
              ],
            ),
          ),

          // Quantity Selector
          QuantitySelector(
            quantity: item.quantity,
            size: 32.0,
            onIncrement: () => AppBindings.cartController.incrementQuantity(index),
            onDecrement: () => AppBindings.cartController.decrementQuantity(index),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {Color? textColor}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppStyles.bodyMedium),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: textColor ?? AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
