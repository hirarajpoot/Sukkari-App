// Path: lib/controllers/login_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var isLoading = false.obs; // ✅ Required by LoginScreen

  void login() async { // ✅ Required by LoginScreen
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter email and password',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }

    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));

    // Simple login simulation
    if (emailController.text == 'test@example.com' && passwordController.text == 'password123') {
      Get.snackbar('Success', 'Login Successful!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      Get.offAllNamed('/device-pairing');
    } else {
      Get.snackbar('Error', 'Invalid credentials',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
    isLoading.value = false;
  }

  void navigateToCreateAccount() {
    Get.toNamed('/create-account');
  }

  void navigateToForgotPassword() { // ✅ Required by LoginScreen
    Get.snackbar('Forgot Password', 'Forgot Password functionality coming soon!',
        snackPosition: SnackPosition.BOTTOM);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
