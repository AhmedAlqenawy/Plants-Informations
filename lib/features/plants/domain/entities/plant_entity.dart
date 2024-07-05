import 'package:equatable/equatable.dart';

class PlantEntity extends Equatable {
  final int? id;
  final String? commonName;
  final String? slug;
  final String? scientificName;
  final int? year;
  final String? bibliography;
  final String? author;
  final String? status;
  final String? rank;
  final String? familyCommonName;
  final int? genusId;
  final String? imageUrl;
  final List<String>? synonyms;
  final String? genus;
  final String? family;

  const PlantEntity(
    this.id,
    this.commonName,
    this.slug,
    this.scientificName,
    this.year,
    this.bibliography,
    this.author,
    this.status,
    this.rank,
    this.familyCommonName,
    this.genusId,
    this.imageUrl,
    this.synonyms,
    this.genus,
    this.family,
  );

  @override
  List<Object?> get props => [
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
      ];
}
