// Path: lib/views/login_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/login_controller.dart';
import 'common_widgets/custom_text_field.dart';
import 'common_widgets/primary_button.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

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
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              child: Column(
                children: [
                  const Text(
                    'Login Here',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomTextField(
                    controller: controller.emailController,
                    hintText: 'Email',
                  ),
                  CustomTextField(
                    controller: controller.passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {}, 
                      child: const Text(
                        'Forgot Your Password?',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                 
                  PrimaryButton(
                    text: 'Log in',
                    onPressed: controller.login, 
                    backgroundColor: const Color(0xFF164242), 
                  ),
                  TextButton(
                    onPressed: controller.navigateToCreateAccount,
                    child: const Text(
                      'Create New Account',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: const [ 
                      Expanded(
                        child: Divider(color: Colors.grey, thickness: 1),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Or Login with',
                          style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Expanded(
                        child: Divider(color: Colors.grey, thickness: 1),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Image(
                          image: AssetImage('assets/images/google_logo.png'),
                          height: 24,
                          width: 24,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Google',
                          style: TextStyle(fontSize: 14, color: Colors.black,),
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
