import 'package:get/get.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/menu_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/setting_screen.dart';
import '../screens/details_screen.dart';
import '../views/list_demo/list_view.dart';
import '../views/list_demo/list_builder_view.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupScreen(),
    ),
    GetPage(
      name: AppRoutes.menu,
      page: () => const MenuScreen(),
    ),
    GetPage(
      name: AppRoutes.cart,
      page: () => const CartScreen(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => const SettingsScreen(),
    ),
    GetPage(
      name: AppRoutes.productDetail,
      page: () => const DetailsScreen(),
    ),
    GetPage(
      name: AppRoutes.listViewDemo,
      page: () => const ListViewDemoScreen(),
    ),
    GetPage(
      name: AppRoutes.listBuilderDemo,
      page: () => const ListBuilderDemoScreen(),
    ),
  ];
}