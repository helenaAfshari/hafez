import 'package:dio/dio.dart';

abstract class ApiProvider {
  Future<Response> get(String path,
  {Map<String,dynamic>? headerParameter,Map<String, dynamic>? queryParameter});
  Future<Response> post(String path,
      {Map<String, dynamic>? headerParametr,
      Map<String, dynamic>? queryParameter,
      dynamic bodyParameter});
  Future<Response> delete(String path,
      {Map<String, dynamic>? headerParameter,
      Map<String, dynamic>? queryParameter,
      dynamic bodyParameter});
  Future<Response> put(String path,
      {Map<String, dynamic>? headerParameter,
      Map<String, dynamic>? queryParameter,
      dynamic bodyParametr});
}