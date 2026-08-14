import '../controllers/auth_controller.dart';
import '../controllers/cart_controller.dart';
import '../repo/food_repository.dart';

/// Clean, lightweight service locator / bindings container.
/// Provides centralized access to repositories and controllers without using GetX or external packages.
class AppBindings {
  AppBindings._();

  static final FoodRepository _foodRepository = const FoodRepository();
  static final CartController _cartController = CartController();
  static final AuthController _authController = AuthController();

  /// Global accessor for FoodRepository
  static FoodRepository get foodRepository => _foodRepository;

  /// Global accessor for CartController
  static CartController get cartController => _cartController;

  /// Global accessor for AuthController
  static AuthController get authController => _authController;

  /// Optional reset helper for testing
  static void reset() {
    _cartController.clearCart();
  }
}
