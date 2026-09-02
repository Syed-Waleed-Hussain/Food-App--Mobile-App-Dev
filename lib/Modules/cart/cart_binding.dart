import 'package:get/get.dart';
import 'cart_controller.dart';

class CartModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartModuleController>(() => CartModuleController());
  }
}
