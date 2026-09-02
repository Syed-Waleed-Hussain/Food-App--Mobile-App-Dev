import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../bindings/app_bindings.dart';
import '../../models/category_model.dart';
import '../../models/product_model.dart';

class MenuController extends GetxController {
  final searchController = TextEditingController();
  String selectedCategoryId = 'all';
  List<Product> displayedProducts = [];
  List<CategoryModel> categories = [];
  bool isSearching = false;

  @override
  void onInit() {
    super.onInit();
    loadData();
    searchController.addListener(onSearchChanged);
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void loadData() {
    categories = AppBindings.foodRepository.getCategories();
    displayedProducts = AppBindings.foodRepository.getAllProducts();
    update();
  }

  void onSearchChanged() {
    final query = searchController.text.trim();
    isSearching = query.isNotEmpty;
    if (isSearching) {
      displayedProducts = AppBindings.foodRepository.searchProducts(query);
    } else {
      filterByCategory(selectedCategoryId);
    }
    update();
  }

  void filterByCategory(String categoryId) {
    selectedCategoryId = categoryId;
    isSearching = false;
    searchController.clear();

    if (categoryId == 'all') {
      displayedProducts = AppBindings.foodRepository.getAllProducts();
    } else {
      final category = categories.firstWhere((c) => c.id == categoryId);
      displayedProducts = AppBindings.foodRepository.getProductsByCategory(category.name);
    }
    update();
  }
}
