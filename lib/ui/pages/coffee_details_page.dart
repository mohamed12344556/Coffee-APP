import '../../data/models/coffee_model.dart';
import '../widgets/build_app_bar.dart';
import '../widgets/build_details_components.dart';
import 'package:flutter/material.dart';

class CoffeeDetailsPage extends StatefulWidget {
  final CoffeeModel coffee;

  const CoffeeDetailsPage({super.key, required this.coffee});

  static const String id = '/details_page';

  @override
  State<StatefulWidget> createState() => _CoffeeDetailsPageState();
}

class _CoffeeDetailsPageState extends State<CoffeeDetailsPage> {
  String selectedSize = 'M';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CoffeeImage(imagePath: widget.coffee.image),
            const SizedBox(height: 16),
            CoffeeName(name: widget.coffee.name),
            const SizedBox(height: 8),
            const CoffeeType(),
            const SizedBox(height: 16),
            CoffeeRating(rate: widget.coffee.rate),
            const Divider(
              height: 30,
              thickness: 1,
              color: Color(0xffE3E3E3),
              indent: 20,
              endIndent: 20,
            ),
            CoffeeDescription(description: widget.coffee.type),
            const SizedBox(height: 16),
            const SizeSelector(),
            const Spacer(),
            CoffeePriceAndBuy(price: widget.coffee.price),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  
}

