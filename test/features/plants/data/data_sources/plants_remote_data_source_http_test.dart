import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:plants_information/core/error/exceptions.dart';
import 'package:plants_information/features/plants/data/data_sources/plants_remote_http.dart';
import 'package:plants_information/features/plants/data/models/plants_list_model.dart';

import '../../../../helpers/read_json.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late PlantsRemoteDataSourceHttpImp plantsRemoteDataSourceHttpImp;

  setUp(() {
    mockHttpClient = MockHttpClient();
    plantsRemoteDataSourceHttpImp =
        PlantsRemoteDataSourceHttpImp(mockHttpClient);
  });

  group(" test bid Remote Data Source Imp", () {
    // happy scenario
    test("get bids from api with success", () async {
      //arrange
      when(mockHttpClient.get(Uri.parse(
              "https://mocki.io/v1/77087eb2-937c-4990-9c0f-075b5d369740")))
          .thenAnswer((realInvocation) async => http.Response(
              readJson("helpers/dummy_data/plants_list.json"), 200));

      //act
      final res = await plantsRemoteDataSourceHttpImp.getAllPlants(1, "asd");

      //assert
      expect(res, isA<PlantsListModel>());
    });

    // server exception scenario
    test(
        'should throw a server exception when the response code is 404 or other',
            () async {
          // arrange
          when(
            mockHttpClient.get(Uri.parse(
                "https://mocki.io/v1/77087eb2-937c-4990-9c0f-075b5d369740")),
          ).thenAnswer(
                (_) async => http.Response('Not found', 404),
          );

          // act
          final call = plantsRemoteDataSourceHttpImp.getAllPlants(1, "asd");

          // assert
          expect(() => call, throwsA(isA<ServerException>()));
        });

  });
}
