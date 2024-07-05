import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:plants_information/features/zone/data/data_sources/zones_data_source.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/remote/dio_helper.dart';
import '../models/zones_list_model.dart';

class ZonesRemoteDataSourceImp extends ZonesDataSource {
  ZonesRemoteDataSourceImp();

  @override
  Future<ZonesListModel> getAllZones(int pageIndex) async {
    await Future.delayed(const Duration(milliseconds: 500), () {});

    try {
      Response response = await DioHelper.getData(
          url: "distributions", parameters: "&range[species_count]=1");

      if (response.statusCode == 200) {
        ZonesListModel zonesListModel =
            ZonesListModel.fromJson((response.data));

        return zonesListModel;
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
