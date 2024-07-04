import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_informations/utile/fonts/fonts.dart';

import '../../data/data_sources/plants_remote_data_source.dart';

class ZoneWidget extends StatelessWidget {
  const ZoneWidget({super.key, required this.zoneName});

  final String zoneName;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return GestureDetector(
      onTap: (){
        PlantsRemoteDataSourceImp().getAllPlants();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(
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
