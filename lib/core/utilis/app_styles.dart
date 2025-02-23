import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppStyles {
  static TextStyle medium16White = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
  static TextStyle bold16White = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
  static TextStyle bold16Black = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );


  static TextStyle medium16Black = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );

  static TextStyle medium25White = GoogleFonts.inter(
    fontSize: 25,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );

  static TextStyle medium25Black = GoogleFonts.inter(
    fontSize: 25,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );

  static TextStyle medium12Grey = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.greyColor,
  );
}
