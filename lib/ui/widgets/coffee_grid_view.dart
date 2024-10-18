import '../../data/models/coffee_model.dart';
import 'coffee_card.dart';
import 'package:flutter/material.dart';

class CoffeeGridView extends StatelessWidget {
  final List<CoffeeModel> coffeeItems;

  const CoffeeGridView({super.key, required this.coffeeItems});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemCount: coffeeItems.length,
      itemBuilder: (context, index) {
        final coffee = coffeeItems[index];
        return CoffeeCard(coffee: coffee);
      },
    );
  }
}