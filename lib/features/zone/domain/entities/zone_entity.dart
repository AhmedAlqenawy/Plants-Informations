import 'package:equatable/equatable.dart';

class ZoneEntity extends Equatable {
  final int? id;
  final String? name;
  final String? slug;
  final String? tdwgCode;
  final int? tdwgLevel;
  final int? speciesCount;

  const ZoneEntity(
    this.id,
    this.name,
    this.slug,
    this.tdwgCode,
    this.tdwgLevel,
    this.speciesCount,
  );

  @override
  List<Object?> get props => [
        id,
        name,
        slug,
        tdwgCode,
        tdwgLevel,
        speciesCount,
      ];
}
