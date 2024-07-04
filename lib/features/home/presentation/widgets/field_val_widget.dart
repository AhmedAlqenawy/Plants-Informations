import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_informations/utile/extensions/num_converts.dart';

class FieldsValuesWidget extends StatelessWidget {
  const FieldsValuesWidget({
    super.key,
    required this.field,
    required this.value,
    this.maxLine = 1,
  });

  final String field, value;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 70.w,
          child: Text(
            field,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 20.sp),
          ),
        ),
        10.toWidth,
        Expanded(
          child: Text(
            value.isEmpty?"N/A":value,
            maxLines: maxLine,
            style: TextStyle(fontSize: 20.sp),
          ),
        ),
      ],
    );
  }
}
