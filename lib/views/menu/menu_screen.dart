import 'package:flutter/material.dart';
import '../../bindings/app_bindings.dart';
import '../../models/category_model.dart';
import '../../models/product_model.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_styles.dart';
import '../widgets/category_item.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/food_card.dart';
import '../widgets/promo_banner.dart';
import '../widgets/section_title.dart';

/// Flagship Menu & Discovery screen featuring category filters, live searching,
/// promo carousel, and dynamic product grids.
class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategoryId = 'all';
  List<Product> _displayedProducts = [];
  List<CategoryModel> _categories = [];
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _loadData();
    _searchController.addListener(_onSearchChanged);
  }

  void _loadData() {
    _categories = AppBindings.foodRepository.getCategories();
    _displayedProducts = AppBindings.foodRepository.getAllProducts();
  }

  void _onSearchChanged() {
    final query = _searchController.text.trim();
    setState(() {
      _isSearching = query.isNotEmpty;
      if (_isSearching) {
        _displayedProducts = AppBindings.foodRepository.searchProducts(query);
      } else {
        _filterByCategory(_selectedCategoryId);
      }
    });
  }

  void _filterByCategory(String categoryId) {
    setState(() {
      _selectedCategoryId = categoryId;
      _isSearching = false;
      _searchController.clear();

      if (categoryId == 'all') {
        _displayedProducts = AppBindings.foodRepository.getAllProducts();
      } else {
        final category = _categories.firstWhere((c) => c.id == categoryId);
        _displayedProducts = AppBindings.foodRepository.getProductsByCategory(category.name);
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final popularProducts = AppBindings.foodRepository.getPopularProducts();

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: const CustomAppBar(
        title: AppStrings.appName,
        showBackButton: false,
        showCartButton: true,
        showProfileButton: true,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColors.primary,
          onRefresh: () async {
            setState(() {
              _loadData();
            });
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Greeting Subheader
                Row(
                  children: [
                    Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primary, width: 1.5),
                      ),
                      child: const ClipOval(
                        child: Image(
                          image: AssetImage('assets/images/Profile.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello, ${AppBindings.authController.userName.split(' ').first} 👋",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          "What delicious food will you try today?",
                          style: AppStyles.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Search Bar with Filter Icon
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: AppStyles.roundedMedium,
                    boxShadow: AppStyles.softCardShadow,
                    border: Border.all(color: AppColors.borderLight),
                  ),
                  child: TextField(
                    controller: _searchController,
                    style: const TextStyle(fontSize: 15, color: AppColors.textPrimary),
                    decoration: InputDecoration(
                      hintText: AppStrings.search,
                      hintStyle: const TextStyle(fontSize: 14, color: AppColors.textTertiary),
                      prefixIcon: const Icon(Icons.search, color: AppColors.primaryLight, size: 22),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.close, size: 18, color: AppColors.textSecondary),
                              onPressed: () {
                                _searchController.clear();
                              },
                            )
                          : Container(
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(Icons.tune, color: Colors.white, size: 18),
                            ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Promotional Banner
                const PromoBanner(
                  title: "Free Pizza Fries!",
                  subtitle: "On all gourmet orders above \$25 today.",
                  discountCode: "CHEF25",
                  assetImage: 'assets/images/fries-removebg-preview.png',
                ),

                const SizedBox(height: 24),

                // Week 06 Curriculum Highlights Card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: AppStyles.warmCardDecoration,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.school_outlined, color: AppColors.primary, size: 20),
                          SizedBox(width: 8),
                          Text(
                            AppStrings.listDemosHeader,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: AppColors.primaryDark,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.surface,
                                foregroundColor: AppColors.primaryDark,
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(color: AppColors.borderLight),
                                ),
                              ),
                              icon: const Icon(Icons.view_list, size: 16),
                              label: const Text(
                                "Static List",
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed(AppRoutes.listViewDemo);
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.surface,
                                foregroundColor: AppColors.primaryDark,
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(color: AppColors.borderLight),
                                ),
                              ),
                              icon: const Icon(Icons.dynamic_feed, size: 16),
                              label: const Text(
                                "List.builder",
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed(AppRoutes.listBuilderDemo);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Category Taxonomies
                const SectionTitle(
                  title: AppStrings.categories,
                  subtitle: "Browse by culinary category",
                ),

                const SizedBox(height: 8),

                SizedBox(
                  height: 52,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _categories.length,
                    itemBuilder: (context, index) {
                      final category = _categories[index];
                      final isSelected = category.id == _selectedCategoryId;
                      return CategoryItem(
                        category: category,
                        isSelected: isSelected,
                        onTap: () => _filterByCategory(category.id),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 24),

                // Popular Chef Specials (Horizontal Showcase)
                if (!_isSearching && _selectedCategoryId == 'all') ...[
                  SectionTitle(
                    title: "Chef's Specials",
                    subtitle: "Hand-picked favorites loved by customers",
                    actionTitle: AppStrings.seeAll,
                    onAction: () => _filterByCategory('burgers'),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 225,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: popularProducts.length,
                      itemBuilder: (context, index) {
                        final product = popularProducts[index];
                        return Container(
                          width: 170,
                          margin: const EdgeInsets.only(right: 14, bottom: 4),
                          child: FoodCard(product: product),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                ],

                // All Filtered Products Header
                SectionTitle(
                  title: _isSearching
                      ? "Search Results (${_displayedProducts.length})"
                      : (_selectedCategoryId == 'all' ? "All Gourmet Dishes" : "Selected Dishes"),
                  subtitle: "Tap any dish for customized ingredients and add-ons",
                ),

                const SizedBox(height: 12),

                // Product List/Grid View
                if (_displayedProducts.isEmpty)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        children: [
                          Icon(Icons.search_off_rounded, size: 64, color: AppColors.textTertiary),
                          const SizedBox(height: 12),
                          const Text(
                            "No dishes found",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Try searching with different keywords or reset filters.",
                            style: AppStyles.bodySmall,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.72,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                    ),
                    itemCount: _displayedProducts.length,
                    itemBuilder: (context, index) {
                      return FoodCard(product: _displayedProducts[index]);
                    },
                  ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
