import 'package:flutter/material.dart';
import '../data_dummy/dummy_data.dart';
import '../models/product_model.dart';
import '../views/auth/login_screen.dart';
import '../views/auth/signup_screen.dart';
import '../views/cart/cart_screen.dart';
import '../views/demos/list_builder_demo_screen.dart';
import '../views/demos/list_view_demo_screen.dart';
import '../views/details/details_screen.dart';
import '../views/home/home_screen.dart';
import '../views/menu/menu_screen.dart';
import '../views/profile/profile_screen.dart';
import '../views/settings/settings_screen.dart';
import 'app_routes.dart';

/// Standard Flutter onGenerateRoute handler managing route navigation,
/// argument extraction, and smooth transition animations.
class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return _buildRoute(const HomeScreen(), settings);

      case AppRoutes.login:
        return _buildRoute(const LoginScreen(), settings);

      case AppRoutes.signup:
        return _buildRoute(const SignupScreen(), settings);

      case AppRoutes.menu:
        return _buildRoute(const MenuScreen(), settings);

      case AppRoutes.cart:
        return _buildRoute(const CartScreen(), settings);

      case AppRoutes.profile:
        return _buildRoute(const ProfileScreen(), settings);

      case AppRoutes.settings:
        return _buildRoute(const SettingsScreen(), settings);

      case AppRoutes.productDetail:
        final Product product = settings.arguments is Product
            ? settings.arguments as Product
            : DummyData.products[0];
        return _buildRoute(DetailsScreen(product: product), settings);

      case AppRoutes.listViewDemo:
        return _buildRoute(const ListViewDemoScreen(), settings);

      case AppRoutes.listBuilderDemo:
        return _buildRoute(const ListBuilderDemoScreen(), settings);

      default:
        return _buildRoute(const HomeScreen(), settings);
    }
  }

  /// Builds a smooth slide & fade PageRouteBuilder using standard Flutter animation widgets.
  static PageRouteBuilder _buildRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.05, 0.0);
        const end = Offset.zero;
        final curve = CurvedAnimation(parent: animation, curve: Curves.easeOutCubic);
        final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeOutCubic));

        return SlideTransition(
          position: animation.drive(tween),
          child: FadeTransition(
            opacity: curve,
            child: child,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 280),
    );
  }
}
