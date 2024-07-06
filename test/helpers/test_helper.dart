import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:plants_information/features/plants/data/data_sources/plants_remote_dio.dart';
import 'package:plants_information/features/plants/domain/repositories/plants_repository.dart';
import 'package:plants_information/features/plants/domain/use_cases/get_plants_list_use_case.dart';

@GenerateMocks([
  // for test use case
  PlantsRepository,
  // for test repo
  PlantsRemoteDataSourceDioImp,
  // for test cubit
  GetPlantsListUseCase,

  //
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
