import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  
  final emailController = TextEditingController(text: "syedwaleedhussain11@gmail.com");
  final passwordController = TextEditingController(text: "gourmet123");
  
}

