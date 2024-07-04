import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_informations/utile/extensions/num_converts.dart';

import '../../fonts/fonts.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: 0xfff8f8f6.toColor,
  primaryColor: Colors.white,
  //extensions: <ThemeExtension<dynamic>>[],
  dividerColor: Colors.black.withOpacity(.10),
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    centerTitle: true,
    titleTextStyle: openSans(20.sp, Colors.black, FontWeight.bold),
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Colors.black,
    ),
  ),
  hintColor: Colors.black,
);
