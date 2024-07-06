import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:plants_information/features/plants/data/data_sources/plants_data_source.dart';
import 'package:plants_information/features/plants/data/models/plants_list_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/remote/dio_helper.dart';

class PlantsRemoteDataSourceImp extends PlantsDataSource {
  PlantsRemoteDataSourceImp();

  @override
  Future<PlantsListModel> getAllPlants(int pageIndex, String zoneId) async {
    await Future.delayed(const Duration(milliseconds: 500), () {});

    String par = "page=$pageIndex";
    if (zoneId != "") {
      par += "&zone_id=$zoneId";
    }
    try {
      Response response =
          await DioHelper.getData(url: "plants", parameters: par);

      if (kDebugMode) {
        print(response.requestOptions.uri);
      }
      if (response.statusCode == 200) {
        PlantsListModel plantsListModel =
            PlantsListModel.fromJson((response.data));

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
