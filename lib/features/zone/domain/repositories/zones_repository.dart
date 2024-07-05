import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/zones_list_entity.dart';

abstract class ZonesRepository {
  Future<Either<Failure, ZonesListEntity>> getZonesList(int pageIndex);
}
