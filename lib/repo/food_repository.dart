import '../data_dummy/dummy_data.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

/// Simple repository for retrieving food products, categories, and promotions
/// without any external backend dependencies or prohibited complex frameworks.
class FoodRepository {
  const FoodRepository();

  /// Returns all available products.
  List<Product> getAllProducts() {
    return List.unmodifiable(DummyData.products);
  }

  /// Returns products marked as popular for the menu showcase.
  List<Product> getPopularProducts() {
    return DummyData.products.where((p) => p.isPopular).toList();
  }

  /// Returns all food category taxonomies.
  List<CategoryModel> getCategories() {
    return List.unmodifiable(DummyData.categories);
  }

  /// Filters products based on selected category name.
  List<Product> getProductsByCategory(String categoryName) {
    if (categoryName.toLowerCase() == 'all items' || categoryName.toLowerCase() == 'all') {
      return getAllProducts();
    }
    return DummyData.products
        .where((p) => p.category.toLowerCase().contains(categoryName.toLowerCase()))
        .toList();
  }

  /// Performs instant client-side search across product name, category, and ingredients.
  List<Product> searchProducts(String query) {
    if (query.trim().isEmpty) return getAllProducts();
    final lower = query.toLowerCase().trim();
    return DummyData.products.where((product) {
      final matchesName = product.name.toLowerCase().contains(lower);
      final matchesCategory = product.category.toLowerCase().contains(lower);
      final matchesIngredient = product.ingredients.any((ing) => ing.toLowerCase().contains(lower));
      return matchesName || matchesCategory || matchesIngredient;
    }).toList();
  }

  /// Fetches a single product by ID.
  Product? getProductById(String id) {
    try {
      return DummyData.products.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }
}
