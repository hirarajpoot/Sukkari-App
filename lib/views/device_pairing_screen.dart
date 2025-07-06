import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/device_pairing_controller.dart';
import 'common_widgets/primary_button.dart';

class DevicePairingScreen extends GetView<DevicePairingController> {
  const DevicePairingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00999A),
      body: SafeArea( 
        child: Stack( 
          fit: StackFit.expand,
          children: [
            
            Positioned.fill(
              child: Image.asset(
                'assets/images/full_background.png', 
                fit: BoxFit.fill, 
                errorBuilder: (context, error, stackTrace) {
                  return Container(color: const Color(0xFF00999A));
                },
              ),
            ),
            SingleChildScrollView( 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 80),
                  const Center(
                    child: Text(
                      'Device Pairing',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      children: [
                        Center(
                          child: Obx(() => Container( 
                                width: 220,
                                height: 100,
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                  color: controller.isCGMPaired.value ? Colors.green.shade50 : Colors.white, // ✅ Color change on pair
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: controller.pairCGM,
                                  child: Text( 
                                    controller.isCGMPaired.value ? 'CGM Paired!' : 'Pair CGM',
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: controller.isCGMPaired.value ? Colors.green.shade800 : const Color.fromARGB(255, 148, 147, 147), // ✅ Color change on pair
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              )),
                        ),
                        Center(
                          child: Obx(() => Container( 
                                width: 220,
                                height: 100,
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                  color: controller.isInsulinPumpPaired.value ? Colors.green.shade50 : Colors.white, // ✅ Color change on pair
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: controller.pairInsulinPump,
                                  child: Text( 
                                    controller.isInsulinPumpPaired.value ? 'Pair Insulin\nPump Paired!' : 'Pair Insulin\nPump',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: controller.isInsulinPumpPaired.value ? Colors.green.shade800 : const Color.fromARGB(255, 148, 147, 147), 
                                      fontWeight: FontWeight.w600,
                                      height: 1.2,
                                    ),
                                  ),
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: controller.setTargetGlucoseRange,
                          child: Obx(() => Container( 
                                key: const Key('target_range'),
                                height: 50,
                                margin: const EdgeInsets.only(bottom: 20),
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  controller.targetRange.value == 'Not Set'
                                      ? 'Target Blood Glucose Range'
                                      : 'Target Blood Glucose Range: ${controller.targetRange.value}', 
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: controller.targetRange.value == 'Not Set'
                                        ? Colors.grey[600]
                                        : Colors.grey,
                                  ),
                                ),
                              )),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: PrimaryButton(
                              text: 'Sign Up',
                              onPressed: controller.signUp,
                              backgroundColor: const Color(0xFF164242), 
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
