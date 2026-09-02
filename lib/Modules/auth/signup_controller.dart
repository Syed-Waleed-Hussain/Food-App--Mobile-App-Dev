import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController(text: "Syed Waleed Hussain");
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
}
