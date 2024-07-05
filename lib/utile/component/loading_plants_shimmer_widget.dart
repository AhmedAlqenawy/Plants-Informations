import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_information/utile/extensions/double_convert.dart';
import 'package:shimmer/shimmer.dart';

class LoadingPlantsShimmerWidget extends StatelessWidget {
  const LoadingPlantsShimmerWidget({super.key, required this.isList});

  final bool isList;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < (isList ? 4 : 1); i++)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
          padding:   EdgeInsets.symmetric(vertical: 16.h,horizontal: 16.w),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: 10.r.toCircular
          ),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Row(
              children: [
                // Image Box
                Container(
                  width: 100.0.w,
                  height: 100.0.h,
                  color: Colors.white,
                ),
                  SizedBox(width: 8.0.w),
                // Column with 3 rows
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 60.0.w,
                            height: 20.0.h,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8.0.w),
                          Container(
                            width: 118.0.w,
                            height: 20.h,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          Container(
                            width: 60.0.w,
                            height: 20.0.h,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8.0.w),
                          Container(
                            width: 118.0.w,
                            height: 20.h,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          Container(
                            width: 60.0.w,
                            height: 20.0.h,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8.0.w),
                          Container(
                            width: 118.0.w,
                            height: 20.h,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
