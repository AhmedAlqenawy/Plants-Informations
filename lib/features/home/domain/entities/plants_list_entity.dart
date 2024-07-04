import 'package:equatable/equatable.dart';
import 'package:plants_informations/features/home/domain/entities/meta_entity.dart';
import 'package:plants_informations/features/home/domain/entities/plant_entity.dart';

class PlantsListEntity extends Equatable {
  final List<PlantEntity>? data;

  final MetaEntity? meta;

  const PlantsListEntity(
    this.data,
    this.meta,
  );

  @override
  List<Object?> get props => [
        data,
        meta,
      ];
}
