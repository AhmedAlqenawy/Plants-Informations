import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:plants_information/features/plants/data/models/plants_list_model.dart';
import 'package:plants_information/features/plants/domain/entities/plants_list_entity.dart';
import 'package:plants_information/features/plants/domain/use_cases/get_plants_list_use_case.dart';

import '../../../../helpers/read_json.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late GetPlantsListUseCase getPlantsListUseCase;
  late MockPlantsRepository mockPlantsRepository;

  setUp(() {
    mockPlantsRepository = MockPlantsRepository();
    getPlantsListUseCase =
        GetPlantsListUseCase(plantsRepository: mockPlantsRepository);
  });
  PlantsListEntity plantsListEntity =
      plantsListFromJson(readJson("helpers/dummy_data/plants_list.json"))
          .toEntity();

  test('should return plants list', () async {
    //arrange
    when(mockPlantsRepository.getPlantsList(1, "asd"))
        .thenAnswer((_) async => Right(plantsListEntity));
    //act
    final result = await getPlantsListUseCase.call(1, "asd");
    //assert
    expect(result, Right(plantsListEntity));
  });
}
