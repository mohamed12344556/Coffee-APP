import 'dart:io';

import 'package:coffee_shop_app/ui/pages/delivery_page.dart';
import 'package:flutter/material.dart';

import '../../data/models/coffee_model.dart';
import '../widgets/build_order_page_components.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  static const String id = "order_page";

  @override
  State<StatefulWidget> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  bool isDeliver = false;

  @override
  Widget build(BuildContext context) {
    final selectedCoffees =
        ModalRoute.of(context)!.settings.arguments as List<CoffeeModel>;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildDeliveryPickupToggle(
              size,
              isDeliver,
              () {
                setState(() {
                  isDeliver = !isDeliver;
                });
              },
            ),
            const SizedBox(height: 30),
            if (!isDeliver) buildDeliveryAddressSection(),
            const Divider(height: 20, thickness: 1, color: Color(0xffE3E3E3)),
            buildProductSection(
              selectedCoffees,
            ),
            const Divider(height: 35, thickness: 4, color: Color(0xFFF9F2ED)),
            buildDiscountSection(),
            const SizedBox(height: 20),
            buildPaymentSummary(),
            const Spacer(),
            buildPaymentMethodSection(
              () {
                Navigator.pushNamed(context, DeliveryPage.id);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProductSection(List<CoffeeModel> coffees) {
    return Column(
      children: coffees.map((coffee) {
        return ListTile(
          title: Text(coffee.name),
          subtitle: Text('${coffee.price} \$'),
          leading: Image.file(File(coffee.image), width: 50),
          trailing: Text('Rating: ${coffee.rate}'),
        );
      }).toList(),
    );
  }
}
