import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_styles.dart';
import '../widgets/custom_app_bar.dart';

/// Demonstration of standard static ListView (Week 06 Curriculum)
/// refactored with elevated styling and layered shadow cards.
class ListViewDemoScreen extends StatelessWidget {
  const ListViewDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: const CustomAppBar(
        title: AppStrings.listViewTitle,
        showBackButton: true,
        showCartButton: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14.0),
          children: [
            // Informational Header Card
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: AppStyles.warmCardDecoration,
              child: const Row(
                children: [
                  Icon(Icons.info_outline, color: AppColors.primary, size: 24),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Static ListView renders all explicit child widgets in the widget tree at once.",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryDark,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            _buildStaticCard(
              title: "Signature Zinger Burger",
              subtitle: "Crispy chicken patty with spicy garlic mayo",
              price: "\$8.99",
              icon: Icons.lunch_dining,
              color: AppColors.primary,
            ),
            _buildStaticCard(
              title: "Artisan Margherita Pizza",
              subtitle: "San Marzano tomatoes, buffalo mozzarella & basil",
              price: "\$14.99",
              icon: Icons.local_pizza,
              color: Colors.orange.shade800,
            ),
            _buildStaticCard(
              title: "Smokey Chicken Tikka",
              subtitle: "Charcoal grilled spiced boneless tender cuts",
              price: "\$12.50",
              icon: Icons.kebab_dining,
              color: Colors.deepOrange,
            ),
            _buildStaticCard(
              title: "Royal Prime Beef Burger",
              subtitle: "Angus beef patty with caramelized sweet onions",
              price: "\$10.99",
              icon: Icons.lunch_dining,
              color: Colors.brown.shade700,
            ),
            _buildStaticCard(
              title: "Loaded Pizza Cheese Fries",
              subtitle: "Golden potato fries baked with pizza toppings",
              price: "\$6.49",
              icon: Icons.fastfood,
              color: Colors.amber.shade800,
            ),
            _buildStaticCard(
              title: "Gourmet Feast Combo Platter",
              subtitle: "Trio of skewers, mini sliders, and loaded sides",
              price: "\$24.99",
              icon: Icons.restaurant_menu,
              color: AppColors.primaryDark,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStaticCard({
    required String title,
    required String subtitle,
    required String price,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: AppStyles.cardDecoration,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        leading: Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: AppColors.textPrimary),
        ),
        subtitle: Text(
          subtitle,
          style: AppStyles.bodySmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text(
          price,
          style: AppStyles.priceText.copyWith(fontSize: 16),
        ),
      ),
    );
  }
}
