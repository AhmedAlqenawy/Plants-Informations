import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'field_val_widget.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget(
      {super.key,
      required this.name,
      required this.family,
      required this.bibliography,
      required this.scientificName,
      required this.authors});

  final String name, family, bibliography, scientificName, authors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FieldsValuesWidget(
            field: 'Name',
            value: name,
          ),
          FieldsValuesWidget(
            field: 'Family',
            value: family,
          ),
          FieldsValuesWidget(
            field: 'Index',
            maxLine: 2,
            value: "$bibliography\n$scientificName",
          ),
          FieldsValuesWidget(
            field: 'Author',
            value: authors,
          ),
        ],
      ),
    );
  }
}
