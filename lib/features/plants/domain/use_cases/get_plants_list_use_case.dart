import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/plants_list_entity.dart';
import '../repositories/plants_repository.dart';

class GetPlantsListUseCase {
  final PlantsRepository plantsRepository;

  const GetPlantsListUseCase({required this.plantsRepository});

  Future<Either<Failure, PlantsListEntity>> call(int pageIndex,String zoneId) {
    return plantsRepository.getPlantsList(pageIndex,zoneId);
  }
}
