import 'app_colors.dart';

import 'font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle font24WhiteBold = GoogleFonts.sora(
    fontSize: 24,
    fontWeight: FontWeightHelper.bold,
    color: Colors.white,
  );

  static TextStyle font32WhiteSemiBold = GoogleFonts.sora(
    fontSize: 32,
    letterSpacing: 2,
    height: 1.5,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static TextStyle font14WhiteRegular = GoogleFonts.sora(
    fontSize: 14,
    letterSpacing: 1.2,
    height: 1.5,
    color: AppColors.grayLighter2,
    fontWeight: FontWeightHelper.regular,
  );
}
