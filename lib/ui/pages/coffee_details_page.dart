import 'package:coffee_shop_app/core/themes/app_colors.dart';
import 'package:coffee_shop_app/core/themes/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeDetailPage extends StatefulWidget {
  const CoffeeDetailPage({super.key});

  @override
  State<StatefulWidget> createState() => _CoffeeDetailPageState();
}

class _CoffeeDetailPageState extends State<CoffeeDetailPage> {
  String selectedSize = 'M';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 115,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Detail'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 327,
                height: 202,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/images/2.png",
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Caffe Mocha',
              style: GoogleFonts.sora(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Text(
                  'Ice/Hot',
                  style: TextStyle(color: Colors.grey),
                ),
                Spacer(),
                Icon(Icons.local_cafe, color: Colors.brown),
                SizedBox(width: 16),
                Icon(Icons.coffee, color: Colors.brown),
                SizedBox(width: 16),
                Icon(Icons.menu_book, color: Colors.brown),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 4),
                Text('4.8'),
                SizedBox(width: 8),
                Text('(230)', style: TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 16),
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
                    text:
                        'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo...',
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
            const SizedBox(height: 16),
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
                        color: selectedSize == size
                            ? AppColors.orange
                            : Colors.black,
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
            const Spacer(),
            Text(
              'Price',
              style: GoogleFonts.sora(
                fontSize: 14,
                fontWeight: FontWeightHelper.regular,
                color: const Color(0xff909090),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '\$4.53',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeightHelper.semiBold,
                    color: AppColors.orange,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
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
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
