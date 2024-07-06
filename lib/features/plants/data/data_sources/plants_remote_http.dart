import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:plants_information/features/plants/data/data_sources/plants_data_source.dart';
import 'package:plants_information/features/plants/data/models/plants_list_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../utile/constants/constants.dart';

class PlantsRemoteDataSourceHttpImp extends PlantsDataSource {
  PlantsRemoteDataSourceHttpImp(this.httpClient);

  final http.Client httpClient;

  @override
  Future<PlantsListModel> getAllPlants(int pageIndex, String zoneId) async {
    String parameter = "page=$pageIndex";
    if (zoneId != "") {
      parameter += "&zone_id=$zoneId";
    }

    try {
      final http.Response response = await httpClient
          .get(Uri.parse("${baseUrl}plants?token=$token&$parameter"));

      if (kDebugMode) {
        print(response.request?.url);
      }
      if (response.statusCode == 200) {
        PlantsListModel plantsListModel = plantsListFromJson((response.body));

        return plantsListModel;
      } else {
        throw ServerException();
      }
    } catch (e) {
      if (e is SocketException) {
        throw OfflineException();
      } else {
        rethrow;
      }
    }
  }
}
