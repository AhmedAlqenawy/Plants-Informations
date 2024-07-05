import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_information/utile/extensions/double_convert.dart';
import 'package:plants_information/utile/fonts/fonts.dart';

class ZoneWidget extends StatelessWidget {
  const ZoneWidget({super.key, required this.zoneName, this.onTap, required this.isSelected});
final bool isSelected;
  final String zoneName;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return GestureDetector(
      onTap:onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(
          borderRadius: 8.r.toCircular,
          border: Border.all(color: isSelected?Colors.amber:Colors.transparent),
          color: theme.primaryColor,
        ),
        child: Text(
          zoneName,
          style: openSans(16.sp, Colors.black, AppFontWeight.medium),
        ),
      ),
    );
  }
}
