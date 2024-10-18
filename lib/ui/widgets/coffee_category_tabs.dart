import 'package:coffee_shop_app/ui/widgets/coffee_category_tab.dart';
import 'package:flutter/material.dart';

class CoffeeCategoryTabs extends StatelessWidget {
  final int selectedCategoryIndex;
  final Function(int) updateCategory;

  const CoffeeCategoryTabs({
    super.key,
    required this.selectedCategoryIndex,
    required this.updateCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CoffeeCategoryTab(
          title: 'All Coffee',
          isSelected: selectedCategoryIndex == 0,
          onTap: () => updateCategory(0),
        ),
        CoffeeCategoryTab(
          title: 'Macchiato',
          isSelected: selectedCategoryIndex == 1,
          onTap: () => updateCategory(1),
        ),
        CoffeeCategoryTab(
          title: 'Latte',
          isSelected: selectedCategoryIndex == 2,
          onTap: () => updateCategory(2),
        ),
        CoffeeCategoryTab(
          title: 'Americano',
          isSelected: selectedCategoryIndex == 3,
          onTap: () => updateCategory(3),
        ),
      ],
    );
  }
}