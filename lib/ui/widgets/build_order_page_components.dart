import '../../core/themes/app_colors.dart';
import '../../core/themes/font_weight_helper.dart';
import '../../my_icons.dart';
import 'custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
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
  );
}

Widget buildDeliveryPickupToggle(
    Size size, bool isDelivery, VoidCallback onTap) {
  return Center(
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
          buildToggleButton(size, "Deliver", !isDelivery, onTap),
          buildToggleButton(size, "Pick Up", isDelivery, onTap),
        ],
      ),
    ),
  );
}

Widget buildToggleButton(
    Size size, String text, bool isSelected, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: size.width * 0.45,
      height: 35,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xffC67C4E) : Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: GoogleFonts.sora(
          color: isSelected ? Colors.white : Colors.black,
          fontSize: 16,
          fontWeight: FontWeightHelper.semiBold,
        ),
      ),
    ),
  );
}

Widget buildDeliveryAddressSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Delivery Address",
        style: GoogleFonts.sora(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 16),
      buildAddressText("Jl. Kpg Sutoyo"),
      buildAddressText("Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.",
          isSubText: true),
      const SizedBox(height: 16),
      buildAddressActions(),
      const SizedBox(height: 20),
    ],
  );
}

Widget buildAddressText(String text, {bool isSubText = false}) {
  return Text(
    text,
    style: GoogleFonts.sora(
      fontSize: isSubText ? 12 : 14,
      fontWeight: FontWeight.w600,
      color: isSubText ? const Color(0xff808080) : Colors.black,
    ),
  );
}

Widget buildAddressActions() {
  return Row(
    children: [
      buildActionChip("Edit Address", Icons.edit_location_outlined),
      const SizedBox(width: 8),
      buildActionChip("Add Note", Icons.note_add_outlined),
    ],
  );
}

Widget buildActionChip(String text, IconData icon) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    height: 27,
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xffDEDEDE)),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      children: [
        Icon(icon, size: 14),
        const SizedBox(width: 4),
        Text(
          text,
          style: GoogleFonts.sora(fontSize: 12),
        ),
      ],
    ),
  );
}

Widget buildProductSection() {
  return Row(
    children: [
      buildProductImage(),
      const SizedBox(width: 12),
      buildProductDetails(),
      const Spacer(),
      buildProductQuantityControl(),
    ],
  );
}

Widget buildProductImage() {
  return Container(
    width: 54,
    height: 54,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      image: const DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage("assets/images/2.png"),
      ),
    ),
  );
}

Widget buildProductDetails() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Cappucino",
        style: GoogleFonts.sora(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 4),
      Text(
        "with Chocolate",
        style: GoogleFonts.sora(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: const Color(0xff9B9B9B),
        ),
      ),
    ],
  );
}

Widget buildProductQuantityControl() {
  return Row(
    children: [
      buildQuantityButton("-", () {}),
      const SizedBox(width: 15),
      Text(
        "1",
        style: GoogleFonts.sora(fontSize: 14, fontWeight: FontWeight.w600),
      ),
      const SizedBox(width: 15),
      buildQuantityButton("+", () {}),
    ],
  );
}

Widget buildQuantityButton(String label, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 28,
      height: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        label,
        style: GoogleFonts.sora(
          color: const Color(0xffA2A2A2),
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}

Widget buildDiscountSection() {
  return Center(
    child: Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffEAEAEA)),
      ),
      child: Row(
        children: [
          const Icon(
            MyIcons.type_regular__state_outline__library_discount,
            size: 24,
            color: Color(0xffC67C4E),
          ),
          const SizedBox(width: 12),
          Text(
            "1 Discount is applied",
            style: GoogleFonts.sora(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          const Icon(Icons.chevron_right, size: 20),
        ],
      ),
    ),
  );
}

Widget buildPaymentSummary() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Payment Summary",
        style: GoogleFonts.sora(
          fontSize: 16,
          fontWeight: FontWeightHelper.semiBold,
        ),
      ),
      const SizedBox(height: 13),
      buildSummaryRow("Price", "\$ 4.53", false),
      const SizedBox(height: 7),
      buildSummaryRow("Delivery Fee", "\$ 4.53", true),
      const SizedBox(height: 7),
      // buildSummaryRow("Cash/Wallet", "\$ 8.53", isTotal: true),
    ],
  );
}

Widget buildSummaryRow(String label, String value, bool hasDiscount) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: GoogleFonts.sora(
          fontSize: 14,
          fontWeight: FontWeightHelper.regular,
          color: Colors.black,
        ),
      ),
      const Spacer(),
      Text(
        value,
        style: GoogleFonts.sora(
          fontSize: 14,
          fontWeight: FontWeightHelper.regular,
          decoration: hasDiscount ? TextDecoration.lineThrough : null,
          color: hasDiscount ? Colors.black : Colors.transparent,
        ),
      ),
      const SizedBox(height: 4),
      const SizedBox(width: 8),
      Text(
        value,
        style: GoogleFonts.sora(
          fontSize: 14,
          fontWeight: FontWeightHelper.semiBold,
          color: Colors.black,
        ),
      ),
    ],
  );
}

Widget buildCashWallet(String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Icon(
        MyIcons.type_regular__state_outline__library_heart,
        color: AppColors.orange,
      ),
      const SizedBox(width: 8),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cash/Wallet",
            style: GoogleFonts.sora(
              fontSize: 14,
              fontWeight: FontWeightHelper.semiBold,
              color: Colors.black,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.sora(
              fontSize: 12,
              fontWeight: FontWeightHelper.semiBold,
              color: AppColors.orange,
            ),
          ),
        ],
      ),
      const Spacer(),
      const Icon(MyIcons.type_regular__state_outline__library_arrow___down_2,
          color: Colors.black),
    ],
  );
}

Widget buildPaymentMethodSection() {
  return Container(
    height: 170,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Colors.white,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildCashWallet("\$ 8.53"),
        const SizedBox(height: 10),
        CustomButton(
          title: "Order",
          size: const Size(400, 56),
          onPressed: () {},
        ),
      ],
    ),
  );
}
