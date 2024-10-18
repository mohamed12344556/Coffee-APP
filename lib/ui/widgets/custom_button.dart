import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/themes/font_weight_helper.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final Size? size;

  const CustomButton(
      {super.key, required this.title, this.onPressed, this.size});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: size ?? const Size(327, 56),
        backgroundColor: const Color(0xffC67C4E),
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: Text(
        title.toString(),
        style: GoogleFonts.sora(
          fontSize: 16,
          fontWeight: FontWeightHelper.semiBold,
        ),
      ),
    );
  }
}
