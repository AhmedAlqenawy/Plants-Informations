import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plants_information/utile/extensions/double_convert.dart';
import 'package:plants_information/utile/extensions/num_converts.dart';

import 'field_val_widget.dart';

class PlantWidget extends StatelessWidget {
  const PlantWidget(
      {super.key,
      required this.name,
      required this.imgUrl,
      required this.year,
      required this.status,
      this.onTap});

  final String name, year, status, imgUrl;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: 10.r.toCircular,
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 100.h,
              height: 100.h,
              decoration: BoxDecoration(
                color: Colors.amber,
                image: DecorationImage(
                  image: imgUrl.isEmpty
                      ? const AssetImage("assets/img/placeholder.jpeg")
                      : NetworkImage(imgUrl),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            8.toWidth,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FieldsValuesWidget(
                    field: "Name",
                    value: name,
                  ),
                  FieldsValuesWidget(
                    field: "Year",
                    value: year,
                  ),
                  FieldsValuesWidget(field: "Status", value: status),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
