import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repositories/zones_repository.dart';
import '../data_sources/zones_data_source.dart';
import '../models/zones_list_model.dart';

class ZonesRepositoryImp implements ZonesRepository {
  final ZonesDataSource dataSource;

  const ZonesRepositoryImp({required this.dataSource});

  @override
  Future<Either<Failure, ZonesListModel>> getZonesList(int pageIndex) async {
    try {
      final bids = await dataSource.getAllZones(pageIndex);
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
