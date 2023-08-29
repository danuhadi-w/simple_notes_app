import 'package:flutter/material.dart';
import 'package:simple_notes_app/controllers/user_controller.dart';
import 'package:get/get.dart';

final controller = Get.find<UserController>();

InputDecoration reusableInputDecoration(String label) {
  return InputDecoration(
    label: Text(label),
    border: OutlineInputBorder(),
  );
}

Widget emailField() {
  return TextFormField(
    controller: controller.emailController,
    decoration: reusableInputDecoration("Email"),
  );
}

Widget passwordField() {
  return TextFormField(
    obscureText: true,
    controller: controller.passwordController,
    decoration: reusableInputDecoration("Password"),
  );
}

Widget confirmPasswordField() {
  return TextFormField(
    obscureText: true,
    decoration: reusableInputDecoration("Confirm Password"),
  );
}
