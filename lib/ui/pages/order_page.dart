import 'package:coffee_shop_app/core/themes/app_colors.dart';
import 'package:coffee_shop_app/core/themes/font_weight_helper.dart';
import 'package:coffee_shop_app/my_icons.dart';
import 'package:coffee_shop_app/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  bool isDeliver = false; // Toggle between Deliver and Pick Up
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Order",
          style: GoogleFonts.sora(
            fontSize: 16,
            fontWeight: FontWeightHelper.semiBold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 100,
        leading: IconButton(
          icon: const Icon(
            MyIcons.type_regular__state_outline__library_arrow___left_2,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: size.width * 0.9,
                height: 43,
                decoration: BoxDecoration(
                  color: const Color(0xffF2F2F2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isDeliver = false;
                        });
                      },
                      child: Container(
                        width: size.width * 0.45,
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isDeliver == false
                              ? const Color(0xffC67C4E)
                              : const Color(0xfffff),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Deliver",
                          style: GoogleFonts.sora(
                            color: isDeliver == false
                                ? Colors.white
                                : Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeightHelper.semiBold,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isDeliver = true;
                        });
                      },
                      child: Container(
                        width: size.width * 0.45,
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isDeliver == true
                              ? const Color(0xffC67C4E)
                              : const Color(0xfffff),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Pick Up",
                          style: GoogleFonts.sora(
                            color:
                                isDeliver == true ? Colors.white : Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeightHelper.semiBold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Delivery Address Section
            if (!isDeliver) ...{
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Delivery Address",
                      style: GoogleFonts.sora(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Jl. Kpg Sutoyo",
                      style: GoogleFonts.sora(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.",
                      style: GoogleFonts.sora(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff808080),
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 120,
                          height: 27,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xffDEDEDE),
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.edit_location_outlined,
                                size: 14,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Edit Address",
                                style: GoogleFonts.sora(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 101,
                          height: 27,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xffDEDEDE),
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.note_add_outlined,
                                size: 14,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Add Note",
                                style: GoogleFonts.sora(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 30,
                thickness: 1,
                color: Color(0xffE3E3E3),
                indent: 20,
                endIndent: 20,
              ),
            },
            // Product Section
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 54,
                  height: 54,
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
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cappucino",
                      style: GoogleFonts.sora(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff2F2D2C),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "with Chocolate",
                      style: GoogleFonts.sora(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff9B9B9B),
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "-",
                        style: GoogleFonts.sora(
                          color: const Color(0xffA2A2A2),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      "1",
                      style: GoogleFonts.sora(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 28,
                      height: 28,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "+",
                        style: GoogleFonts.sora(
                          color: const Color(0xffAAADB0),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              height: 30,
              thickness: 4,
              color: Color(0xFFF9F2ED),
            ),
            // Discount Section
            Center(
              child: Container(
                height: 56,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xffEAEAEA),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      MyIcons.type_regular__state_outline__library_discount,
                      size: 24,
                      color: Color(0xffC67C4E),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      "1 Discount is applied",
                      style: GoogleFonts.sora(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.chevron_right,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Payment Summary Section
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment Summary",
                    style: GoogleFonts.sora(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Price",
                        style: GoogleFonts.sora(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "\$ 4.53",
                        style: GoogleFonts.sora(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery Fee",
                        style: GoogleFonts.sora(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "\$ 2.0",
                            style: GoogleFonts.sora(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "\$ 1.0",
                            style: GoogleFonts.sora(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Payment Method Section
            Container(
              width: 375,
              height: 165,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Column(
                children: [
                  // Payment Method Section
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(
                        MyIcons.type_regular__state_outline__library_bag,
                        color: AppColors.orange,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cash/Wallet',
                            style: GoogleFonts.sora(
                              fontSize: 14,
                              fontWeight: FontWeightHelper.semiBold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '\$5.53',
                            style: GoogleFonts.sora(
                              fontSize: 12,
                              fontWeight: FontWeightHelper.semiBold,
                              color: AppColors.orange,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Icon(
                        MyIcons
                            .type_regular__state_outline__library_arrow___down_2,
                        color: Colors.black,
                        size: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: CustomButton(
                        title: 'Order',
                        onPressed: () {
                          // TODO:  Navigate to Payment Page
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
