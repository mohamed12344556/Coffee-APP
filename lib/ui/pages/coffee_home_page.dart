import 'package:coffee_shop_app/ui/widgets/BuildAppBar.dart';
import 'package:coffee_shop_app/ui/widgets/BuildBanner.dart';
import 'package:coffee_shop_app/ui/widgets/CoffeeBottomNavigationBar.dart';
import 'package:coffee_shop_app/ui/widgets/CoffeeList.dart';
import '../../data/models/coffee_model.dart';
import 'package:flutter/material.dart';

class CoffeeHomePage extends StatefulWidget {
  const CoffeeHomePage({super.key});

  static const String id = "coffee_home_page";

  @override
  State<StatefulWidget> createState() => _CoffeeHomePageState();
}

class _CoffeeHomePageState extends State<CoffeeHomePage> {
  int selectedCategoryIndex = 0;
  int selectedIndex = 0;
  List<CoffeeModel> coffeeItems = [
    CoffeeModel(
        id: 1,
        name: 'Coffee Mocha',
        type: 'Deep Foam',
        price: 4.53,
        image: 'assets/images/2.png',
        rate: 4.5),
    CoffeeModel(
        id: 2,
        name: 'Flat White',
        type: 'Espresso',
        price: 3.53,
        image: 'assets/images/3.png',
        rate: 4.5),
    CoffeeModel(
        id: 3,
        name: 'Caffe Mocha',
        type: 'Deep Foam',
        price: 4.53,
        image: 'assets/images/4.png',
        rate: 4.5),
    CoffeeModel(
        id: 4,
        name: 'Flat White',
        type: 'Espresso',
        price: 3.53,
        image: 'assets/images/5.png',
        rate: 4.5),
  ];

  void updateCategory(int index) {
    setState(() {
      selectedCategoryIndex = index;
    });
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF9F9F9),
        body: Stack(
          children: [
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: BuildCustomAppBar(),
            ),
            // Promo Banner
            const Positioned(
              top: 200,
              left: 20,
              right: 20,
              child: BuildBanner(),
            ),
            Positioned.fill(
              top: 380,
              child: CoffeeList(
                coffeeItems: coffeeItems,
                selectedCategoryIndex: selectedCategoryIndex,
                updateCategory: updateCategory,
              ),
            ),
          ],
        ),
        bottomNavigationBar: CoffeeBottomNavigationBar(
          selectedIndex: selectedIndex,
          onItemTapped: onItemTapped,
        ),
      ),
    );
  }
}
