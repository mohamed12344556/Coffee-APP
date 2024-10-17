import 'package:coffee_shop_app/ui/pages/coffee_details_page.dart';
import 'package:coffee_shop_app/ui/pages/welcome_page.dart';

import 'core/di/dependancy_injection.dart';
import 'ui/pages/coffee_home_page.dart';
import 'package:flutter/material.dart';

void main() async {
  await setupLocator();
  runApp(const CoffeeApp());
}

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/coffee_home': (context) => const CoffeeHomePage(),
        '/welcome': (context) => const WelcomePage(),
        '/details': (context) => const CoffeeDetailPage(),
      },
      initialRoute: '/details',
    );
  }
}
