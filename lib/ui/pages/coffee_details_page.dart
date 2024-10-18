import 'package:flutter/material.dart';
import '../../data/models/coffee_model.dart';
import '../widgets/build_app_bar.dart';
import '../widgets/build_details_components.dart';

class CoffeeDetailsPage extends StatefulWidget {
  static const String id = '/details_page';

  const CoffeeDetailsPage({super.key});

  @override
  State<StatefulWidget> createState() => _CoffeeDetailsPageState();
}

class _CoffeeDetailsPageState extends State<CoffeeDetailsPage> {
  String selectedSize = 'M';

  @override
  Widget build(BuildContext context) {
    final coffee = ModalRoute.of(context)!.settings.arguments
        as CoffeeModel; // استلام كائن CoffeeModel

    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CoffeeImage(imagePath: coffee.image),
            const SizedBox(height: 16),
            CoffeeName(name: coffee.name),
            const SizedBox(height: 8),
            const CoffeeType(),
            const SizedBox(height: 16),
            CoffeeRating(rate: coffee.rate),
            const Divider(
              height: 30,
              thickness: 1,
              color: Color(0xffE3E3E3),
              indent: 20,
              endIndent: 20,
            ),
            CoffeeDescription(description: coffee.type),
            const SizedBox(height: 16),
            const SizeSelector(),
            const Spacer(),
            CoffeePriceAndBuy(
  price: coffee.price,
  selectedCoffee: coffee, // تمرير القهوة المختارة
),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
