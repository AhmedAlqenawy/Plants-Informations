import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:plants_information/core/error/exceptions.dart';
import 'package:plants_information/core/error/failure.dart';
import 'package:plants_information/features/plants/data/models/plants_list_model.dart';
import 'package:plants_information/features/plants/data/repositories/plants_repository_imp.dart';

import '../../../../helpers/read_json.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockPlantsRemoteDataSourceDioImp mockPlantsRemoteDataSourceDioImp;
  late PlantsRepositoryImp plantsRepositoryImp;

  setUp(() {
    mockPlantsRemoteDataSourceDioImp = MockPlantsRemoteDataSourceDioImp();
    plantsRepositoryImp =
        PlantsRepositoryImp(dataSource: mockPlantsRemoteDataSourceDioImp);
  });
  final plantsList =
      plantsListFromJson(readJson("helpers/dummy_data/plants_list.json"));

  group("test repo calling datasource", () {
    test("should return bids when a call to data source is successful",
        () async {
      // arrange
      when(mockPlantsRemoteDataSourceDioImp.getAllPlants(1, "asd"))
          .thenAnswer((realInvocation) async => plantsList);

      // act
      final res = await plantsRepositoryImp.getPlantsList(1, "asd");

      //assert
      verify(mockPlantsRemoteDataSourceDioImp.getAllPlants(1, "asd"));
      expect(res, equals(Right(plantsList)));
    });

    test("should return Server Failure when a call to data source", () async {
      // arrange
      when(mockPlantsRemoteDataSourceDioImp.getAllPlants(1, "asd"))
          .thenThrow(ServerException());

      // act
      final res = await plantsRepositoryImp.getPlantsList(1, "asd");

      //assert
      verify(mockPlantsRemoteDataSourceDioImp.getAllPlants(1, "asd"));
      expect(res, equals(const Left(ServerFailure(""))));
    });

    test("should return Offline Failure when a call to data source", () async {
      // arrange
      when(mockPlantsRemoteDataSourceDioImp.getAllPlants(1, "asd"))
          .thenThrow(OfflineException());

      // act
      final res = await plantsRepositoryImp.getPlantsList(1, "asd");

      //assert
      verify(mockPlantsRemoteDataSourceDioImp.getAllPlants(1, "asd"));
      expect(res, equals(const Left(OfflineFailure(""))));
    });
  });
}
