import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
