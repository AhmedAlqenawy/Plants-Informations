import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/zones_list_entity.dart';
 import '../repositories/zones_repository.dart';

class GetZonesListUseCase {
  final ZonesRepository zonesRepository;

  const GetZonesListUseCase({required this.zonesRepository});

  Future<Either<Failure, ZonesListEntity>> call(int pageIndex) {
    return zonesRepository.getZonesList(pageIndex);
  }
}
