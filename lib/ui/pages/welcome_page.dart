import 'coffee_home_page.dart';

import '../../core/themes/app_styles.dart';
import '../widgets/custom_button.dart';

import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  static const String id = "WelcomePage";

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

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                    'Fall in Love with Coffee in Blissful Delight!',
                    style: AppTextStyles.font32WhiteSemiBold,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  // Subtitle Text
                  Text(
                    'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                    style: AppTextStyles.font14WhiteRegular,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25),
                  CustomButton(
                    title: 'Get Started',
                    onPressed: () {
                      Navigator.pushNamed(context, CoffeeHomePage.id);
                    },
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
