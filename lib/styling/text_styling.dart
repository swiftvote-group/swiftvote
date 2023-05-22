import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swiftally/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyle {
  static TextStyle boldTextStyle({
    double fontSize = 16,
    Color color = AppColors.blackColor,
  }) {
    return GoogleFonts.nunito(
        fontSize: fontSize.sp, fontWeight: FontWeight.bold, color: color);
  }

  static TextStyle extraBoldTextStyle({
    double fontSize = 16,
    Color color = AppColors.blackColor,
  }) {
    return GoogleFonts.nunito(
        fontSize: fontSize.sp, fontWeight: FontWeight.w800, color: color);
  }

  static TextStyle mediumTextStyle({
    double fontSize = 14,
    Color color = AppColors.blackColor,
  }) {
    return GoogleFonts.nunito(
      fontSize: fontSize.sp,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }
}
