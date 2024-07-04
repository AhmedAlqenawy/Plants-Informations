import 'package:dartz/dartz.dart';
import 'package:plants_informations/features/home/domain/entities/plants_list_entity.dart';

import '../../../../core/error/failure.dart';

abstract class PlantsRepository {
  Future<Either<Failure, PlantsListEntity>> getPlantsList();
}
