import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_informations/utile/extensions/double_convert.dart';

import '../../../../utile/services/launchInWebViewOrVC.dart';

class MoreDetailsWidget extends StatelessWidget {
  const MoreDetailsWidget({super.key, required this.scientificName});

  final String scientificName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchInWebViewOrVc(Uri.parse("https://en.wikipedia.org/wiki/$scientificName"));
      },
      child: Container(
        width: double.infinity,
        height: 54.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: 10.r.toCircular,
        ),
        alignment: Alignment.center,
        child: Text(
          "More Details",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
