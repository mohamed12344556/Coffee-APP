import 'package:coffee_shop_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/6.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  // Get Started Button
                  // Title Text
                  const Text(
                    'Fall in Love with Coffee in Blissful Delight!',
                    style: TextStyle(
                      fontSize: 32,
                      letterSpacing: 2,
                      height: 1.5,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  // Subtitle Text
                  Text(
                    'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1.2,
                      height: 1.5,
                      color: Colors.white.withOpacity(0.8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () {
                      // TODO Define the action here
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(327, 56),
                      backgroundColor: AppColors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
