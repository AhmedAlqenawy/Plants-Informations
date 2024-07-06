import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:plants_information/features/plants/domain/repositories/plants_repository.dart';

@GenerateMocks([
  // for test use case
  PlantsRepository,
  // for test repo
  //BidRemoteDataSourceImp,
  //BidLocalDataSourceImp,
  // for test cubit
  //GetBidUseCase,
  //GetHistoryBidUseCase,

  //
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
