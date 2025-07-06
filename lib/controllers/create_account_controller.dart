// Path: lib/controllers/create_account_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  var selectedGender = Rx<String?>(null);
  var selectedDiabetesType = Rx<String?>(null);

  var isLoading = false.obs;
  var registrationSuccess = false.obs; // Added for dead code fix simulation

  void selectGenderOption() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Select Gender', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            RadioListTile<String>(
              title: const Text('Male'),
              value: 'Male',
              groupValue: selectedGender.value,
              onChanged: (val) {
                selectedGender.value = val;
                Get.back();
              },
              activeColor: const Color(0xFF00C896),
            ),
            RadioListTile<String>(
              title: const Text('Female'),
              value: 'Female',
              groupValue: selectedGender.value,
              onChanged: (val) {
                selectedGender.value = val;
                Get.back();
              },
              activeColor: const Color(0xFF00C896),
            ),
          ],
        ),
      ),
    );
  }

  void selectDiabetesTypeOption() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Select Diabetes Type', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            RadioListTile<String>(
              title: const Text('Type 1'),
              value: 'Type 1',
              groupValue: selectedDiabetesType.value,
              onChanged: (val) {
                selectedDiabetesType.value = val;
                Get.back();
              },
              activeColor: const Color(0xFF00C896),
            ),
            RadioListTile<String>(
              title: const Text('Type 2'),
              value: 'Type 2',
              groupValue: selectedDiabetesType.value,
              onChanged: (val) {
                selectedDiabetesType.value = val;
                Get.back();
              },
              activeColor: const Color(0xFF00C896),
            ),
          ],
        ),
      ),
    );
  }

  void register() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty ||
        selectedGender.value == null ||
        selectedDiabetesType.value == null) {
      Get.snackbar('Error', 'Please fill all required fields',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar('Error', 'Passwords do not match',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }

    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));

  
    registrationSuccess.value = emailController.text.contains('@') && passwordController.text.length >= 6; // Simple validation for simulation

    if (registrationSuccess.value) { 
      Get.snackbar('Success', 'Account created successfully!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      Get.offAllNamed('/device-pairing');
    } else {
      Get.snackbar('Error', 'Registration failed (Invalid Email or Password too short for simulation)',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
    isLoading.value = false;
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
