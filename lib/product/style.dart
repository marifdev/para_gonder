import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle openSans = TextStyle(
    fontFamily: GoogleFonts.openSans().fontFamily,
  );
  static TextStyle title = openSans.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  static TextStyle subtitle = openSans.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static TextStyle body = openSans.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
  static TextStyle bodyBold = openSans.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static TextStyle bodySmall = openSans.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w300,
  );
  static TextStyle bodySmallBold = openSans.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
  static TextStyle bodyBigBold = openSans.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
}

class AppColors {
  static const Color lightBlue = Color(0xFF37C7FF);
  static const Color darkBlue = Color(0xFF1B016A);
  static const Color shadowColor = Colors.black12;
  static const Color grey = Color(0xFFEFEFEF);
  static const Color darkGrey = Color(0xFFA4A8AA);
  static const Color orange = Color(0xFFFF722B);
  static const Color red = Color(0xFFFF355D);
}
