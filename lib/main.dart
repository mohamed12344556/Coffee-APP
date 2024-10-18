import 'package:coffee_shop_app/cubit/coffee_cubit.dart';
import 'package:coffee_shop_app/data/database_helper/sql_helper.dart';
import 'package:coffee_shop_app/ui/admin/pages/admain_page.dart';
import 'package:coffee_shop_app/ui/pages/coffee_home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/models/coffee_model.dart';
import 'ui/pages/coffee_details_page.dart';
import 'ui/pages/delivery_page.dart';
import 'ui/pages/order_page.dart';
import 'ui/pages/welcome_page.dart';

import 'core/di/dependency_injection.dart';
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
    return BlocProvider(
      create: (context) =>
          CoffeeCubit(databaseHelper: locator<DatabaseHelper>())
            ..fetchCoffees(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          CoffeeHomePage.id: (context) => const CoffeeHomePage(),
          WelcomePage.id: (context) => const WelcomePage(),
          CoffeeDetailsPage.id: (context) => const CoffeeDetailsPage(),
          OrderPage.id: (context) => const OrderPage(),
          DeliveryPage.id: (context) => const DeliveryPage(),
          AdminPage.id: (context) => const AdminPage(),
        },
        initialRoute: CoffeeHomePage.id,
      ),
    );
  }
}
