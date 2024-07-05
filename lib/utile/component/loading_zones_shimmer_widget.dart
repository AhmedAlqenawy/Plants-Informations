import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_information/utile/extensions/double_convert.dart';
import 'package:shimmer/shimmer.dart';

class LoadingZonesShimmerWidget extends StatelessWidget {
  const LoadingZonesShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for(int i = 0; i <4;i++)
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
          decoration:
              BoxDecoration(color: Colors.white, borderRadius: 10.r.toCircular),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Row(
              children: [
                Container(
                  width: 60.0.w,
                  height: 39.0.h,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
