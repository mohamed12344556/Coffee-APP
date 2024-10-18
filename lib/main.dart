import 'data/models/coffee_model.dart';
import 'ui/pages/coffee_details_page.dart';
import 'ui/pages/delivery_page.dart';
import 'ui/pages/order_page.dart';
import 'ui/pages/welcome_page.dart';

import 'core/di/dependency_injection.dart';
import 'ui/pages/coffee_home_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        CoffeeHomePage.id: (context) => const CoffeeHomePage(),
        WelcomePage.id: (context) => const WelcomePage(),
        CoffeeDetailsPage.id: (context) => CoffeeDetailsPage(
              coffee: CoffeeModel(
                id: 1,
                name: 'Cappuccino',
                type: 'Latte',
                price: 4.99,
                image: 'assets/images/5.png',
                rate: 2.5,
              ),
            ),
        OrderPage.id: (context) => const OrderPage(),
        DeliveryPage.id: (context) => const DeliveryPage(),
      },
      initialRoute: WelcomePage.id,
    );
  }
}
