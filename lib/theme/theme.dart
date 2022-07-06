import 'package:flutter/material.dart';
import 'package:flutter_bukit_vista_assessment/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const TextStyle h1 = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle body = TextStyle(
    color: AppColor.ink01,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle caption = TextStyle(
    color: AppColor.dark,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle subtitle = TextStyle(
    color: AppColor.ink03,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle h3 = TextStyle(
    color: AppColor.primary,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle h2 = TextStyle(
    color: AppColor.dark,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static ThemeData light() {
    return ThemeData(
      primaryColor: AppColor.primary,
      scaffoldBackgroundColor: Colors.white,
      textTheme: GoogleFonts.robotoTextTheme().copyWith(
        bodyText1: body,
      ),
    );
  }
}
