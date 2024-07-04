import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension NumConverts on int {
  Color get toColor => Color(this);

  SizedBox get toHeight => SizedBox(height: (this).h);

  SizedBox get toWidth => SizedBox(width: (this).w);
}
