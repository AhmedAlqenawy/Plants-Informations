import 'package:plants_information/features/zone/data/models/zone_model.dart';

import '../../domain/entities/zones_list_entity.dart';
import 'meta_model.dart';

class ZonesListModel extends ZonesListEntity {
  const ZonesListModel(
    super.data,
    super.meta,
  );

  factory ZonesListModel.fromJson(Map<String, dynamic> json) => ZonesListModel(
        json["data"] == null
            ? []
            : List<ZoneModel>.from(
                json["data"]!.map((x) => ZoneModel.fromJson(x))),
        json["meta"] == null ? null : MetaModel.fromJson(json["meta"]),
      );

  ZonesListEntity toEntity() => ZonesListEntity(
        data,
        meta,
      );
}
