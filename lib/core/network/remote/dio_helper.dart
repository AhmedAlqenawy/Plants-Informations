import 'dart:core';

import 'package:dio/dio.dart';

import '../../../utile/constants/constants.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(baseUrl: baseUrl, receiveDataWhenStatusError: true, headers: {

      }),
    );
  }

  static Future<Response> getData({
    required String url,
    String? parameters,
  }) async {


    return await dio.get(
      "$baseUrl$url?token=$token&$parameters",
    );
  }

  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String lang = 'en ',
      String? token}) async {
    dio.options.headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json-patch+json',
      'lang': lang,
      'Authorization': token,
    };
    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> deleteData(
      {required String url,
      Map<String, dynamic>? query,
      Map<String, dynamic>? data,
      String lang = 'en ',
      String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };
    return dio.delete(url, queryParameters: query);
  }

  static Future<Response> putData(
      {required String url,
      Map<String, dynamic>? query,
      Map<String, dynamic>? data,
      String lang = 'en ',
      String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };
    return dio.put(url, queryParameters: query!, data: data);
  }
}
