
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/create_account_controller.dart';
import 'common_widgets/custom_text_field.dart';
import 'common_widgets/primary_button.dart';

class CreateAccountScreen extends GetView<CreateAccountController> {
  const CreateAccountScreen({super.key});

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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 80),
                  const Center(
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: controller.nameController,
                          hintText: 'Name',
                        ),
                        CustomTextField(
                          controller: controller.emailController,
                          hintText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        CustomTextField(
                          controller: controller.passwordController,
                          hintText: 'Password',
                          obscureText: false,
                        ),
                        CustomTextField(
                          controller: controller.confirmPasswordController,
                          hintText: 'Confirm Password',
                          obscureText: false,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: controller.selectGenderOption,
                                child: Obx(() => Container(
                                      height: 50,
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      margin: const EdgeInsets.only(right: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            controller.selectedGender.value ?? 'Gender',
                                            style: const TextStyle(fontSize: 16, color: Colors.grey),
                                          ),
                                          const Icon(Icons.chevron_right, size: 10, color: Colors.grey),
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: controller.selectDiabetesTypeOption,
                                child: Obx(() => Container(
                                      height: 50,
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      margin: const EdgeInsets.only(left: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            controller.selectedDiabetesType.value ?? 'Diabetes Type',
                                            style: const TextStyle(fontSize: 16, color: Colors.grey),
                                          ),
                                          const Icon(Icons.chevron_right, size: 10, color: Colors.grey),
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: PrimaryButton(
                              text: 'Next',
                              onPressed: () {
                              
                                Get.toNamed('/device-pairing'); 
                              },
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
