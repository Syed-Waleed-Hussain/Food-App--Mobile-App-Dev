import 'product_model.dart';

/// Represents an item in the shopping cart with quantity and customizable addons.
class CartItem {
  final Product product;
  int quantity;
  final List<String> selectedAddons;
  final String specialNote;

  CartItem({
    required this.product,
    this.quantity = 1,
    this.selectedAddons = const [],
    this.specialNote = '',
  });

  /// Calculates total price for this line item based on quantity and addon unit additions.
  double get totalPrice {
    final double addonCost = selectedAddons.length * 1.50;
    return (product.price + addonCost) * quantity;
  }
}
