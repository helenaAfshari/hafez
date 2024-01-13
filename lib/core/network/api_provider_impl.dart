import 'package:hafez/core/network/api_provider.dart';
import 'package:hafez/service_locator.dart';
import 'package:dio/dio.dart';

class ApiProviderImp extends ApiProvider {
  @override
  Future<Response> post(String path,
      {Map<String, dynamic>? headerParametr,
      Map<String, dynamic>? queryParameter,
      bodyParameter}) async {
          final dio = await serviceLocator<Dio>();  
 if (headerParametr?.isNotEmpty == true) {
      dio.options.headers.addAll(headerParametr!);
    }
    return await dio.post(
      path,
      data: bodyParameter,
      queryParameters: queryParameter,
    );
  }

  @override
  Future<Response> delete(String path,
      {Map<String, dynamic>? headerParameter,
      Map<String, dynamic>? queryParameter,
      bodyParameter}) async {
    final dio = serviceLocator<Dio>();
    if (headerParameter?.isNotEmpty == true) {
      dio.options.headers.addAll(headerParameter!);
    }
    return await dio.delete(path,
        data: bodyParameter, queryParameters: queryParameter);
  }

  @override
  Future<Response> get(String path,
      {Map<String, dynamic>? headerParameter,
      Map<String, dynamic>? queryParameter}) async {
    final dio = serviceLocator<Dio>();
    if (headerParameter?.isNotEmpty == true) {
      dio.options.headers.addAll(headerParameter!);
    }
    return await dio.get(
      path,
      queryParameters: queryParameter,
    );
  }


  @override
  Future<Response> put(String path,
      {Map<String, dynamic>? headerParameter,
      Map<String, dynamic>? queryParameter,
      bodyParametr}) async {
    final dio = await serviceLocator<Dio>();
    if (headerParameter?.isNotEmpty == true) {
      dio.options.headers.addAll(headerParameter!);
    }
    return await dio.post(path,
        data: bodyParametr, queryParameters: queryParameter);
  }
}