// Path: lib/controllers/device_pairing_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/common_widgets/primary_button.dart';

class DevicePairingController extends GetxController {
  var isCGMPaired = false.obs;
  var isInsulinPumpPaired = false.obs;
  var targetRange = 'Not Set'.obs;

  void pairCGM() async {
    if (isCGMPaired.value) {
      Get.snackbar('Info', 'CGM already paired!', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    Get.snackbar('Pairing', 'Pairing CGM...', snackPosition: SnackPosition.BOTTOM);
    await Future.delayed(const Duration(seconds: 2));
    isCGMPaired.value = true;
    Get.snackbar('Success', 'CGM Paired!', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green, colorText: Colors.white);
  }

  void pairInsulinPump() async {
    if (isInsulinPumpPaired.value) {
      Get.snackbar('Info', 'Insulin Pump already paired!', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    Get.snackbar('Pairing', 'Pairing Insulin Pump...', snackPosition: SnackPosition.BOTTOM);
    await Future.delayed(const Duration(seconds: 2));
    isInsulinPumpPaired.value = true;
    Get.snackbar('Success', 'Insulin Pump Paired!', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green, colorText: Colors.white);
  }

  void setTargetGlucoseRange() {
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
            const Text('Set Target Glucose Range', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            TextFormField(
              initialValue: targetRange.value == 'Not Set' ? '' : targetRange.value,
              decoration: const InputDecoration(
                hintText: 'e.g., 70-120 mg/dL',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                targetRange.value = value;
              },
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              text: 'Save Range',
              onPressed: () {
                Get.back();
                Get.snackbar('Info', 'Target Range Saved!', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.blueAccent, colorText: Colors.white);
              },
              backgroundColor: const Color(0xFF00C896),
            ),
          ],
        ),
      ),
    );
  }

  void signUp() {
    Get.snackbar('Success', 'Signed Up! Welcome to Sukkari App!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF00C896),
        colorText: Colors.white);
    Get.offAllNamed('/home_dashboard');
  }
}
