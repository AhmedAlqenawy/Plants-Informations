import 'package:equatable/equatable.dart';
import 'package:plants_information/features/zone/domain/entities/meta_entity.dart';
import 'package:plants_information/features/zone/domain/entities/zone_entity.dart';

class ZonesListEntity extends Equatable {
  final List<ZoneEntity>? data;

  final MetaEntity? meta;

  const ZonesListEntity(
    this.data,
    this.meta,
  );

  @override
  List<Object?> get props => [
        data,
        meta,
      ];
}
