import 'core/di/dependancy_injection.dart';
import 'ui/pages/coffee_home_page.dart';
import 'package:flutter/material.dart';

void main() async {
  await setupLocator();
  runApp(const CoffeeApp());
}

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CoffeeHomePage(),
    );
  }
}
