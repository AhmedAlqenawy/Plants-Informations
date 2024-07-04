import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFontWeight {
  AppFontWeight._();

  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
}

TextStyle openSans(double fontSize, Color? color, FontWeight fontWeight,
    {bool underline = false,
    bool overLine = false,
    Color decorationColor = Colors.black}) {
  return GoogleFonts.openSans(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    decoration: underline != false
        ? TextDecoration.underline
        : overLine != false
            ? TextDecoration.lineThrough
            : TextDecoration.none,
    decorationColor: decorationColor,
  );
}
