import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {
  int quantity = 1;
  bool isFavorite = false;
  final notesController = TextEditingController();
  final Set<String> selectedAddons = {};

  final List<Map<String, dynamic>> addonOptions = [
    {"name": "Extra Cheddar Cheese", "price": 1.50, "icon": Icons.lunch_dining},
    {"name": "House Garlic Truffle Sauce", "price": 1.50, "icon": Icons.local_pizza},
    {"name": "Chilled Artisan Beverage", "price": 2.50, "icon": Icons.local_drink},
    {"name": "Crispy Beef Bacon Strip", "price": 2.00, "icon": Icons.kebab_dining},
  ];

  @override
  void onClose() {
    notesController.dispose();
    super.onClose();
  }

  double totalItemPrice(double basePrice) {
    final double addonTotal = selectedAddons.length * 1.50;
    return (basePrice + addonTotal) * quantity;
  }

  void toggleFavorite() {
    isFavorite = !isFavorite;
    update();
  }

  void incrementQuantity() {
    quantity++;
    update();
  }

  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
      update();
    }
  }

  void toggleAddon(String name) {
    if (selectedAddons.contains(name)) {
      selectedAddons.remove(name);
    } else {
      selectedAddons.add(name);
    }
    update();
  }
}
