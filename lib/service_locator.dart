
import 'package:autharization_hanna/core/network/api_provider.dart';
import 'package:autharization_hanna/core/network/api_provider_impl.dart';
import 'package:autharization_hanna/core/network/dio_wraper.dart';
import 'package:autharization_hanna/data/remote/auth/auth_api.dart';
import 'package:autharization_hanna/data/remote/auth/auth_api_impl.dart';
import 'package:autharization_hanna/domain/repository/auth/auth_repository.dart';
import 'package:autharization_hanna/domain/repository/auth/auth_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;
injector() {
  serviceLocator.registerSingleton<AuthApi>(AuthApiImp());
   serviceLocator.registerSingleton<AuthRepository>(AuthRepositoryImp());
   serviceLocator.registerSingleton<ApiProvider>(ApiProviderImp());
   serviceLocator.registerSingleton<Dio>(ViolationDioWrapper.provide());
   serviceLocator.registerSingleton<ApiProviderImp>(ApiProviderImp());
}