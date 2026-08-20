import 'package:flutter/material.dart';
import '../../data_dummy/dummy_data.dart';
import '../../models/product_model.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_styles.dart';
import '../widgets/custom_app_bar.dart';

/// Demonstration of dynamic ListView.builder (Week 06 Curriculum)
/// featuring memory-efficient on-demand lazy rendering, item dismissal, and undo.
class ListBuilderDemoScreen extends StatefulWidget {
  const ListBuilderDemoScreen({super.key});

  @override
  State<ListBuilderDemoScreen> createState() => _ListBuilderDemoScreenState();
}

class _ListBuilderDemoScreenState extends State<ListBuilderDemoScreen> {
  late List<Product> _products;

  @override
  void initState() {
    super.initState();
    _resetProducts();
  }

  void _resetProducts() {
    setState(() {
      _products = List.from(DummyData.products);
    });
  }

  void _deleteProduct(int index) {
    final deletedItem = _products[index];
    setState(() {
      _products.removeAt(index);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Removed ${deletedItem.name}"),
        backgroundColor: AppColors.textPrimary,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        dismissDirection: DismissDirection.horizontal,
        showCloseIcon: true,
        closeIconColor: Colors.white70,
        action: SnackBarAction(
          label: "UNDO",
          textColor: AppColors.accent,
          onPressed: () {
            setState(() {
              _products.insert(index, deletedItem);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: CustomAppBar(
        title: AppStrings.listBuilderTitle,
        showBackButton: true,
        showCartButton: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded, color: AppColors.textPrimary),
            tooltip: "Reset List",
            onPressed: _resetProducts,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Informational Header
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
              padding: const EdgeInsets.all(16),
              decoration: AppStyles.warmCardDecoration,
              child: Row(
                children: [
                  const Icon(Icons.bolt, color: AppColors.primary, size: 24),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "ListView.builder dynamically renders visible items on demand (${_products.length} items currently loaded).",
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryDark,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: _products.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.delete_sweep_outlined, size: 56, color: AppColors.textTertiary),
                          const SizedBox(height: 12),
                          const Text("All items cleared", style: AppStyles.heading3),
                          const SizedBox(height: 8),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                            ),
                            icon: const Icon(Icons.refresh),
                            label: const Text("Restore Products"),
                            onPressed: _resetProducts,
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 6.0),
                      itemCount: _products.length,
                      itemBuilder: (context, index) {
                        final product = _products[index];

                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: AppStyles.cardDecoration,
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                            leading: Container(
                              height: 52,
                              width: 52,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: AppColors.surfaceWarm,
                                borderRadius: AppStyles.roundedSmall,
                              ),
                              child: Image.asset(
                                product.imageUrl,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) => const Icon(
                                  Icons.lunch_dining,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                            title: Text(
                              product.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            subtitle: Text(
                              "\$${product.price.toStringAsFixed(2)} • Rating: ${product.rating} ★",
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                              tooltip: "Delete item",
                              onPressed: () => _deleteProduct(index),
                            ),
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                AppRoutes.productDetail,
                                arguments: product,
                              );
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
