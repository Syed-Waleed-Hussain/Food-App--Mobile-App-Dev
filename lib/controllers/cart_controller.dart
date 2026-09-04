import 'package:flutter/material.dart';
import '../models/cart_item_model.dart';
import '../models/product_model.dart';

class CartController extends ChangeNotifier {
  final List<CartItem> _items = [];
  String _appliedCoupon = '';
  double _discountPercent = 0.0;
  static const double _deliveryFee = 2.99;
  static const double _taxRate = 0.05; // 5%

  List<CartItem> get items => List.unmodifiable(_items);
  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);
  bool get isEmpty => _items.isEmpty;
  String get appliedCoupon => _appliedCoupon;

  void addToCart(Product product, {int quantity = 1, List<String> addons = const [], String note = ''}) {
   
    final existingIndex = _items.indexWhere(
      (item) => item.product.id == product.id && _areAddonsEqual(item.selectedAddons, addons),
    );

    if (existingIndex >= 0) {
      _items[existingIndex].quantity += quantity;
    } else {
      _items.add(CartItem(
        product: product,
        quantity: quantity,
        selectedAddons: List.from(addons),
        specialNote: note,
      ));
    }
    notifyListeners();
  }

  void incrementQuantity(int index) {
    if (index >= 0 && index < _items.length) {
      _items[index].quantity++;
      notifyListeners();
    }
  }

  void decrementQuantity(int index) {
    if (index >= 0 && index < _items.length) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  void removeItem(int index) {
    if (index >= 0 && index < _items.length) {
      _items.removeAt(index);
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    _appliedCoupon = '';
    _discountPercent = 0.0;
    notifyListeners();
  }

  bool applyCoupon(String code) {
    final trimmed = code.trim().toUpperCase();
    if (trimmed == 'CHEF25' || trimmed == 'GOURMET25') {
      _appliedCoupon = trimmed;
      _discountPercent = 0.25; // 25% off
      notifyListeners();
      return true;
    } else if (trimmed == 'WELCOME10') {
      _appliedCoupon = trimmed;
      _discountPercent = 0.10;
      notifyListeners();
      return true;
    }
    return false;
  }

  void removeCoupon() {
    _appliedCoupon = '';
    _discountPercent = 0.0;
    notifyListeners();
  }

  // Financial Calculations
  double get subtotal => _items.fold(0.0, (sum, item) => sum + item.totalPrice);
  double get deliveryFee => _items.isEmpty ? 0.0 : (subtotal >= 25.0 ? 0.0 : _deliveryFee);
  double get discountAmount => subtotal * _discountPercent;
  double get taxAmount => (subtotal - discountAmount) * _taxRate;
  double get totalAmount => _items.isEmpty ? 0.0 : (subtotal - discountAmount + deliveryFee + taxAmount);

  bool _areAddonsEqual(List<String> list1, List<String> list2) {
    if (list1.length != list2.length) return false;
    for (int i = 0; i < list1.length; i++) {
      if (!list2.contains(list1[i])) return false;
    }
    return true;
  }
}
