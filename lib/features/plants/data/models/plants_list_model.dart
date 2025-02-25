import 'dart:convert';

import 'package:plants_information/features/plants/data/models/plant_model.dart';

import '../../domain/entities/plants_list_entity.dart';
import 'meta_model.dart';

PlantsListModel plantsListFromJson(String str) => PlantsListModel.fromJson(json.decode(str));


class PlantsListModel extends PlantsListEntity {
  const PlantsListModel(
    super.data,
    super.meta,
  );

  factory PlantsListModel.fromJson(Map<String, dynamic> json) =>
      PlantsListModel(
        json["data"] == null
            ? []
            : List<PlantModel>.from(
                json["data"]!.map((x) => PlantModel.fromJson(x))),
        json["meta"] == null ? null : MetaModel.fromJson(json["meta"]),
      );

  PlantsListEntity toEntity() => PlantsListEntity(
        data,
        meta,
      );
}
