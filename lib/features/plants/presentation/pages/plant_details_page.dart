import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:plants_information/utile/extensions/num_converts.dart';

import '../../domain/entities/plant_entity.dart';
import '../widgets/details_widget.dart';
import '../widgets/img_widget.dart';
import '../widgets/more_details_widget.dart';

class PlantDetailsPage extends StatelessWidget {
  const PlantDetailsPage({super.key, required this.plantEntity});

  final PlantEntity plantEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plant Details'),
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            16.toHeight,
            ImgWidget(
              imgUrl: plantEntity.imageUrl ?? "",
            ),
            16.toHeight,
            Expanded(
              child: DetailsWidget(
                name: plantEntity.commonName ?? "NA",
                scientificName: plantEntity.scientificName ?? "NA",
                family: plantEntity.family ?? "NA",
                bibliography: plantEntity.bibliography ?? "NA",
                authors: plantEntity.author ?? "NA",
              ),
            ),
            16.toHeight,
            MoreDetailsWidget(
              scientificName: plantEntity.scientificName ?? "NA",
            ),
            16.toHeight,
            16.toHeight,
          ],
        ),
      ),
    );
  }
}
