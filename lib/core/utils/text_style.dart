import 'package:afto_school_task/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  AppStyle._();

  static TextStyle get pageControllOn => GoogleFonts.manrope(
        textStyle: TextStyle(
          fontSize: 14.sp,
          color: AppColors.white,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.14,
        ),
      );

  static TextStyle get pageControllOff => GoogleFonts.manrope(
        textStyle: TextStyle(
          fontSize: 14.sp,
          color: const Color(0xFF2C4364),
          fontWeight: FontWeight.w400,
          letterSpacing: -0.14,
        ),
      );

  static TextStyle get quizeMainStyle => GoogleFonts.manrope(
        textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF27364E),
          letterSpacing: -0.16,
        ),
      );

  static TextStyle get authWelcome => GoogleFonts.manrope(
        textStyle: TextStyle(
          fontSize: 32.sp,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF27364E),
          letterSpacing: -0.32,
        ),
      );
}
