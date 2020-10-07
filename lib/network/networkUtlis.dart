import 'dart:convert';

import 'package:dio/dio.dart';

import 'network-mappers.dart';

class NetworkUtil {
  static NetworkUtil _instance = new NetworkUtil.internal();

  NetworkUtil.internal();

  factory NetworkUtil() => _instance;

  Dio dio = Dio();
  String base_url = "http://mowagdy.com/skroot/public/api/v1/";

  Future<ResponseType> get<ResponseType extends Mappable>(ResponseType responseType, String url, {Map headers , Map queryParameters}) async {
    var response;
    try {
      dio.options.baseUrl = base_url;
      print("HERE I COME");
      response = await dio.get(url,options: Options(headers: headers , ) ,queryParameters:queryParameters );
    } on DioError catch (e) {
      print("HERE I COMEW");

      print((e.message));
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse(response, responseType);
  }

  Future<ResponseType> post<ResponseType extends Mappable>(ResponseType responseType,String url,
      {Map headers, var body, encoding}) async {
    var response;
    dio.options.baseUrl =base_url;
    try {
      print(headers);
      response = await dio.post(url, data: jsonEncode(body), options: Options(headers: headers, requestEncoder: encoding));
    } on DioError catch (e) {
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse(response , responseType);
  }
  Future<ResponseType> put<ResponseType extends Mappable>(ResponseType responseType,String url,
      {Map headers, var body, encoding}) async {
    var response;
    dio.options.baseUrl =base_url;
    try {
      print(headers);
      response = await dio.put(url, data: jsonEncode(body), options: Options(headers: headers, requestEncoder: encoding ,));
    } on DioError catch (e) {
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse(response , responseType);
  }
  Future<ResponseType> delete<ResponseType extends Mappable>(ResponseType responseType,String url,
      {Map headers, var body, encoding}) async {
    var response;
    dio.options.baseUrl =base_url;
    try {
      print(headers);
      response = await dio.delete(url, data: jsonEncode(body), options: Options(headers: headers, requestEncoder: encoding));
    } on DioError catch (e) {
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse(response , responseType);
  }

  ResponseType handleResponse<ResponseType extends Mappable>(Response response , ResponseType responseType)  {
    final int statusCode = response.statusCode;
    if (statusCode >= 200 && statusCode < 300) {

      print("correrct request: " + response.toString());
      return Mappable(responseType, response.toString()) as ResponseType;
    } else {
      print("request error: " + response.toString());
      return Mappable(responseType, response.toString()) as ResponseType;
    }
  }
}
