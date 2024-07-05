import '../../domain/entities/zone_entity.dart';

class ZoneModel extends ZoneEntity {
  const ZoneModel(
    super.id,
    super.name,
    super.slug,
    super.tdwgCode,
    super.tdwgLevel,
    super.speciesCount,
  );

  factory ZoneModel.fromJson(Map<String, dynamic> json) {
    return ZoneModel(
      json['id'],
      json['name'],
      json['slug'],
      json['tdwg_code'],
      json['tdwg_level'],
      json['species_count'],
    );
  }

  ZoneEntity toEntity() => ZoneEntity(
        id,
        name,
        slug,
        tdwgCode,
        tdwgLevel,
        speciesCount,
      );
}
