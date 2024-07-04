import 'package:plants_information/features/home/domain/entities/plant_entity.dart';

class PlantModel extends PlantEntity {
  const PlantModel(
    super.id,
    super.commonName,
    super.slug,
    super.scientificName,
    super.year,
    super.bibliography,
    super.author,
    super.status,
    super.rank,
    super.familyCommonName,
    super.genusId,
    super.imageUrl,
    super.synonyms,
    super.genus,
    super.family,
  );

  factory PlantModel.fromJson(Map<String, dynamic> json) {
    return PlantModel(
      json['id'],
      json['common_name'],
      json['slug'],
      json['scientific_name'],
      json['year'],
      json['bibliography'],
      json['author'],
      json['status'],
      json['rank'],
      json['family_commonName'],
      json['genus_id'],
      json['image_url'],
      json["synonyms"] == null ? [] : List<String>.from(json["synonyms"]!.map((x) => x)),
      json['genus'],
      json['family'],
    );
  }

  PlantEntity toEntity() => PlantEntity(
        id,
        commonName,
        slug,
        scientificName,
        year,
        bibliography,
        author,
        status,
        rank,
        familyCommonName,
        genusId,
        imageUrl,
        synonyms,
        genus,
        family,
      );
}
