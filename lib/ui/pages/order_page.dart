import 'package:coffee_shop_app/ui/widgets/build_order_page_components.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  static const String id = "order_page";
  @override
  State<StatefulWidget> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  bool isDeliver = false; // Toggle between Deliver and Pick Up

  @override
  Widget build(BuildContext context) {
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
            buildProductSection(),
            const Divider(height: 35, thickness: 4, color: Color(0xFFF9F2ED)),
            buildDiscountSection(),
            const SizedBox(height: 20),
            buildPaymentSummary(),
            const Spacer(),
            buildPaymentMethodSection(),
          ],
        ),
      ),
    );
  }
}
