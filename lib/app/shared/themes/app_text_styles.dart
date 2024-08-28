import 'package:flutter/material.dart';
import 'package:forkify_app/app/shared/themes/appcolors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final TextStyle title = GoogleFonts.urbanist(
    fontSize: 30,
    color: AppColors.primary,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle subtile = GoogleFonts.urbanist(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.grey,
  );

  static final TextStyle link = GoogleFonts.urbanist(
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
    fontSize: 15,
  );
  static final TextStyle listTileTitle = GoogleFonts.urbanist(
    fontSize: 16,
    color: AppColors.black,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle listTileDescription = GoogleFonts.urbanist(
    fontSize: 14,
    color: AppColors.grey,
  );
  static final TextStyle text =
      GoogleFonts.urbanist(fontSize: 14, color: AppColors.black);
}
