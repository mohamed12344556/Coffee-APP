import '../../data/models/coffee_model.dart';
import 'coffee_category_tabs.dart';
import 'coffee_grid_view.dart';
import 'package:flutter/material.dart';

class CoffeeList extends StatelessWidget {
  final List<CoffeeModel> coffeeItems;
  final int selectedCategoryIndex;
  final Function(int) updateCategory;

  const CoffeeList({
    super.key,
    required this.coffeeItems,
    required this.selectedCategoryIndex,
    required this.updateCategory,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        const SizedBox(height: 20),
        CoffeeCategoryTabs(
          selectedCategoryIndex: selectedCategoryIndex,
          updateCategory: updateCategory,
        ),
        const SizedBox(height: 20),
        CoffeeGridView(coffeeItems: coffeeItems),
      ],
    );
  }
}