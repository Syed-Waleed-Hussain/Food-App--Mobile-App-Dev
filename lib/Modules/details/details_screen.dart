import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'details_controller.dart';
import '../../bindings/app_bindings.dart';
import '../../models/product_model.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_notification.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_styles.dart';
import '../widgets/custom_button.dart';
import '../widgets/quantity_selector.dart';

/// Masterpiece Details Screen with hero imagery, interactive add-on customization,
/// calorie/prep badges, and sticky checkout action bar.
class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({
    super.key,
    required this.product,
  });

  void _handleAddToCart(BuildContext context, DetailsController controller) {
    AppBindings.cartController.addToCart(
      product,
      quantity: controller.quantity,
      addons: controller.selectedAddons.toList(),
      note: controller.notesController.text.trim(),
    );

    AppNotification.showOrderAdded(
      context,
      itemName: product.name,
      quantity: controller.quantity,
      bottomMargin: 90.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(
      builder: (controller) {
        final totalItemPrice = controller.totalItemPrice(product.price);

        return Scaffold(
          backgroundColor: AppColors.scaffoldBackground,
          body: SafeArea(
            child: Column(
              children: [
                // Top Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          shape: BoxShape.circle,
                          boxShadow: AppStyles.softCardShadow,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new, size: 18, color: AppColors.textPrimary),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.surface,
                              shape: BoxShape.circle,
                              boxShadow: AppStyles.softCardShadow,
                            ),
                            child: IconButton(
                              icon: Icon(
                                controller.isFavorite ? Icons.favorite : Icons.favorite_border,
                                size: 22,
                                color: controller.isFavorite ? AppColors.primary : AppColors.textSecondary,
                              ),
                              onPressed: () => controller.toggleFavorite(),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ListenableBuilder(
                            listenable: AppBindings.cartController,
                            builder: (context, child) {
                              final count = AppBindings.cartController.itemCount;
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
                                      icon: const Icon(Icons.shopping_bag_outlined, size: 20, color: AppColors.textPrimary),
                                      onPressed: () {
                                        Navigator.of(context).pushNamed(AppRoutes.cart);
                                      },
                                    ),
                                  ),
                                  if (count > 0)
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
                                            '$count',
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
                        ],
                      ),
                    ],
                  ),
                ),

                // Scrollable Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Showcase Hero Image
                        Center(
                          child: Container(
                            height: 200,
                            width: 200,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.surface,
                              boxShadow: AppStyles.glowShadow,
                            ),
                            child: Hero(
                              tag: 'food-img-${product.id}',
                              child: Image.asset(
                                product.imageUrl,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) => const Icon(
                                  Icons.lunch_dining,
                                  size: 100,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Metrics Badges Row (Rating, Prep Time, Calories)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildMetricChip(
                              icon: Icons.star_rounded,
                              iconColor: AppColors.star,
                              label: "${product.rating} (${product.reviewCount})",
                            ),
                            _buildMetricChip(
                              icon: Icons.access_time_rounded,
                              iconColor: Colors.blue.shade700,
                              label: product.prepTime,
                            ),
                            _buildMetricChip(
                              icon: Icons.local_fire_department_rounded,
                              iconColor: AppColors.primary,
                              label: "${product.calories} kcal",
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // Title & Quantity Selector
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    style: AppStyles.heading2,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    product.category,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            QuantitySelector(
                              quantity: controller.quantity,
                              onIncrement: () => controller.incrementQuantity(),
                              onDecrement: () => controller.decrementQuantity(),
                            ),
                          ],
                        ),

                        const SizedBox(height: 18),

                        // Description Section
                        const Text(
                          "Description",
                          style: AppStyles.heading3,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          product.description,
                          style: AppStyles.bodyLarge.copyWith(color: AppColors.textSecondary),
                        ),

                        const SizedBox(height: 22),

                        // Ingredients Chips
                        const Text(
                          "Ingredients",
                          style: AppStyles.heading3,
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: product.ingredients.map((ingredient) {
                            return Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: AppColors.surface,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: AppColors.borderLight),
                              ),
                              child: Text(
                                ingredient,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            );
                          }).toList(),
                        ),

                        const SizedBox(height: 24),

                        // Add-On Options
                        const Text(
                          AppStrings.addOns,
                          style: AppStyles.heading3,
                        ),
                        const SizedBox(height: 10),
                        Column(
                          children: controller.addonOptions.map((addon) {
                            final String name = addon['name'] as String;
                            final double price = addon['price'] as double;
                            final IconData icon = addon['icon'] as IconData;
                            final isSelected = controller.selectedAddons.contains(name);

                            return Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              decoration: BoxDecoration(
                                color: isSelected ? AppColors.surfaceWarm : AppColors.surface,
                                borderRadius: AppStyles.roundedMedium,
                                border: Border.all(
                                  color: isSelected ? AppColors.primary : AppColors.borderLight,
                                  width: isSelected ? 1.5 : 1,
                                ),
                              ),
                              child: ListTile(
                                leading: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: isSelected ? AppColors.primary : AppColors.surfaceVariant,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    icon,
                                    size: 18,
                                    color: isSelected ? Colors.white : AppColors.textSecondary,
                                  ),
                                ),
                                title: Text(
                                  name,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                trailing: Text(
                                  "+ \$${price.toStringAsFixed(2)}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primary,
                                  ),
                                ),
                                onTap: () => controller.toggleAddon(name),
                              ),
                            );
                          }).toList(),
                        ),

                        const SizedBox(height: 20),

                        // Special Cooking Instructions
                        const Text(
                          AppStrings.specialInstructions,
                          style: AppStyles.heading3,
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: AppStyles.cardDecoration,
                          child: TextField(
                            controller: controller.notesController,
                            maxLines: 2,
                            decoration: const InputDecoration(
                              hintText: AppStrings.instructionHint,
                              hintStyle: TextStyle(fontSize: 13, color: AppColors.textTertiary),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(14),
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),

                // Bottom Sticky Checkout Bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: AppStyles.roundedTopLarge,
                    boxShadow: AppStyles.softCardShadow,
                    border: Border.all(color: AppColors.borderSubtle),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Total Price",
                            style: AppStyles.bodySmall,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "\$${totalItemPrice.toStringAsFixed(2)}",
                            style: AppStyles.priceText.copyWith(fontSize: 22),
                          ),
                        ],
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: CustomButton(
                          text: AppStrings.addToCart,
                          icon: Icons.shopping_bag_outlined,
                          onPressed: () => _handleAddToCart(context, controller),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMetricChip({
    required IconData icon,
    required Color iconColor,
    required String label,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppStyles.softCardShadow,
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: iconColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
