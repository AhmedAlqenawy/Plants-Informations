import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:plants_information/features/home/data/data_sources/plants_data_source.dart';
import 'package:plants_information/features/home/data/models/plants_list_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/remote/dio_helper.dart';

class PlantsRemoteDataSourceImp extends PlantsDataSource {
  PlantsRemoteDataSourceImp();

  @override
  Future<PlantsListModel> getAllPlants() async {
    await Future.delayed(const Duration(milliseconds: 500), () {});

    try {
      Response response = await DioHelper.getData(url: "plants");

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
