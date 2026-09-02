import 'package:flutter/material.dart';
import '../Modules/auth/signup_binding.dart';
import '../Modules/auth/signup_screen.dart';
import '../Modules/cart/cart_binding.dart';
import '../Modules/cart/cart_screen.dart';
import '../Modules/demos/list_builder_demo_screen.dart';
import '../Modules/demos/list_view_demo_screen.dart';
import '../Modules/details/details_binding.dart';
import '../Modules/details/details_screen.dart';
import '../Modules/home/home_binding.dart';
import '../Modules/home/home_screen.dart';
import '../Modules/login/login_binding.dart';
import '../Modules/login/login_screen.dart';
import '../Modules/menu/menu_binding.dart';
import '../Modules/menu/menu_screen.dart';
import '../Modules/profile/profile_binding.dart';
import '../Modules/profile/profile_screen.dart';
import '../Modules/settings/settings_binding.dart';
import '../Modules/settings/settings_screen.dart';
import '../data_dummy/dummy_data.dart';
import '../models/product_model.dart';
import 'app_routes.dart';

/// Standard Flutter onGenerateRoute handler managing route navigation,
/// module binding dependencies, argument extraction, and smooth transitions.
class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        HomeBinding().dependencies();
        return _buildRoute(const HomeScreen(), settings);

      case AppRoutes.login:
        LoginBinding().dependencies();
        return _buildRoute(const LoginScreen(), settings);

      case AppRoutes.signup:
        SignupBinding().dependencies();
        return _buildRoute(const SignupScreen(), settings);

      case AppRoutes.menu:
        MenuBinding().dependencies();
        return _buildRoute(const MenuScreen(), settings);

      case AppRoutes.cart:
        CartModuleBinding().dependencies();
        return _buildRoute(const CartScreen(), settings);

      case AppRoutes.profile:
        ProfileBinding().dependencies();
        return _buildRoute(const ProfileScreen(), settings);

      case AppRoutes.settings:
        SettingsBinding().dependencies();
        return _buildRoute(const SettingsScreen(), settings);

      case AppRoutes.productDetail:
        DetailsBinding().dependencies();
        final Product product = settings.arguments is Product
            ? settings.arguments as Product
            : DummyData.products[0];
        return _buildRoute(DetailsScreen(product: product), settings);

      case AppRoutes.listViewDemo:
        return _buildRoute(const ListViewDemoScreen(), settings);

      case AppRoutes.listBuilderDemo:
        return _buildRoute(const ListBuilderDemoScreen(), settings);

      default:
        HomeBinding().dependencies();
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
