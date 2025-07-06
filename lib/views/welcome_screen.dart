// Path: lib/views/welcome_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter_svg/flutter_svg.dart'; // ✅ Agar koi aur SVG nahi hai to is line ko hata dein
import '../../controllers/welcome_controller.dart';

class WelcomeScreen extends GetView<WelcomeController> {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller;

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF00999A), // Main background color
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            // ✅ Full background PNG Image
            Positioned.fill(
              child: Image.asset( // Reverted to Image.asset for PNG
                'assets/images/full_background.png', // ✅ New path for your full background PNG
                fit: BoxFit.fill, // ✅ BoxFit.fill poori available space ko cover karega
                errorBuilder: (context, error, stackTrace) {
                  return Container(color: const Color(0xFF00999A)); // Fallback if image fails
                },
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: screenWidth * 0.85,
                  height: screenHeight * 0.50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(66, 0, 0, 0),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(
                        'assets/images/image.png', // This image (illustration) remains PNG
                        fit: BoxFit.contain,
                        height: screenHeight * 0.45,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.broken_image,
                            size: 150,
                            color: Colors.grey,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Column(
                  children: [
                    Text(
                      'WELCOME TO',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.07,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    Text(
                      'SUKKARI',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.09,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
