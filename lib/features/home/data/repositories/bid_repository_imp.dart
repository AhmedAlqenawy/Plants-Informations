import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repositories/plants_repository.dart';
import '../data_sources/plants_data_source.dart';
import '../models/plants_list_model.dart';

class PlantsRepositoryImp implements PlantsRepository {
  final PlantsDataSource dataSource;

  const PlantsRepositoryImp({required this.dataSource});

  @override
  Future<Either<Failure, PlantsListModel>> getPlantsList() async {
    try {
      final bids = await dataSource.getAllPlants();
      return Right(bids);
    } on ServerException {
      return left(const ServerFailure(""));
    } on EmptyCacheException {
      return const Left(EmptyCacheFailure(""));
    } on OfflineException {
      return const Left(OfflineFailure(""));
    }
  }
}
