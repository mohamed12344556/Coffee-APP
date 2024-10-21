import 'dart:io';

import '../../data/models/coffee_model.dart';
import '../pages/order_page.dart';

import '../../core/themes/app_colors.dart';
import '../../core/themes/font_weight_helper.dart';
import '../../my_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeImage extends StatelessWidget {
  final String imagePath;

  const CoffeeImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 327,
        height: 202,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: FileImage(File(imagePath)),
          ),
        ),
      ),
    );
  }
}

class CoffeeName extends StatelessWidget {
  final String name;

  const CoffeeName({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: GoogleFonts.sora(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class CoffeeType extends StatelessWidget {
  const CoffeeType({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'Ice/Hot',
          style: TextStyle(color: Color(0xffA2A2A2)),
        ),
        Spacer(),
        Icon(Icons.local_cafe, color: AppColors.orange),
        SizedBox(width: 16),
        Icon(Icons.coffee, color: AppColors.orange),
        SizedBox(width: 16),
        Icon(Icons.menu_book, color: AppColors.orange),
      ],
    );
  }
}

class CoffeeRating extends StatelessWidget {
  final double rate;

  const CoffeeRating({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(MyIcons.type_regular__state_outline__library_star,
            color: Color(0xffFBBE21)),
        const SizedBox(width: 4),
        Text(
          rate.toString(),
          style: GoogleFonts.sora(
            fontSize: 16,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
        const SizedBox(width: 2),
        Text(
          '(230)',
          style: GoogleFonts.sora(
            color: const Color(0xffA2A2A2),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class CoffeeDescription extends StatelessWidget {
  final String description;

  const CoffeeDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: GoogleFonts.sora(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: description,
                style: GoogleFonts.sora(
                  fontSize: 14,
                  fontWeight: FontWeightHelper.light,
                  color: const Color(0xffA2A2A2),
                  letterSpacing: 1.1,
                ),
              ),
              const TextSpan(
                text: ' Read More',
                style: TextStyle(
                  color: AppColors.orange,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key});

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  String selectedSize = 'M';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Size',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: ['S', 'M', 'L'].map((size) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ChoiceChip(
                showCheckmark: false,
                label: Text(
                  size,
                  style: GoogleFonts.sora(
                    fontSize: 14,
                    fontWeight: FontWeightHelper.regular,
                    color:
                        selectedSize == size ? AppColors.orange : Colors.black,
                  ),
                ),
                selected: selectedSize == size,
                onSelected: (bool selected) {
                  setState(() {
                    selectedSize = size;
                  });
                },
                selectedColor: const Color(0xffC67C4E).withOpacity(0.1),
                backgroundColor: Colors.grey[200],
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 7,
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: selectedSize == size
                        ? const Color(0xffC67C4E)
                        : const Color(0xffE3E3E3),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class CoffeePriceAndBuy extends StatelessWidget {
  final double price;
  final CoffeeModel selectedCoffee;

  const CoffeePriceAndBuy(
      {super.key, required this.price, required this.selectedCoffee});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              'Price',
              style: GoogleFonts.sora(
                fontSize: 14,
                fontWeight: FontWeightHelper.regular,
                color: const Color(0xff909090),
              ),
            ),
            Text(
              '\$ ${price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeightHelper.semiBold,
                color: AppColors.orange,
              ),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              OrderPage.id,
              arguments: [selectedCoffee],
            );
          },
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(217, 56),
            backgroundColor: AppColors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Text(
            'Buy Now',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
