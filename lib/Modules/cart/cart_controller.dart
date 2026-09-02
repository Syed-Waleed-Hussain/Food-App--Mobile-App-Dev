import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartModuleController extends GetxController {
  final couponController = TextEditingController();
  final instructionsController = TextEditingController();

  @override
  void onClose() {
    couponController.dispose();
    instructionsController.dispose();
    super.onClose();
  }
}
