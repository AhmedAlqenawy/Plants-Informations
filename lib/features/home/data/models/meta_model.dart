import 'package:plants_information/features/home/domain/entities/meta_entity.dart';

class MetaModel extends MetaEntity {
  const MetaModel(
    super.total,
  );

  factory MetaModel.fromJson(Map<String, dynamic> json) {
    return MetaModel(
      json['total'],
    );
  }

  MetaEntity toEntity() => MetaEntity(
        total,
      );
}
