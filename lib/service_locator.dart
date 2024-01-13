
import 'package:hafez/core/network/api_provider.dart';
import 'package:hafez/core/network/api_provider_impl.dart';
import 'package:hafez/core/network/dio_wraper.dart';
import 'package:hafez/data/remote/auth/auth_api.dart';
import 'package:hafez/data/remote/auth/auth_api_impl.dart';
import 'package:hafez/data/remote/detailsghazaliathafez/details_ghazaliat_hafez_api.dart';
import 'package:hafez/data/remote/detailsghazaliathafez/details_ghazaliat_hafez_api_impl.dart';
import 'package:hafez/data/remote/ghazaliathafez/ghazaliathafez_api.dart';
import 'package:hafez/data/remote/ghazaliathafez/ghazaliathafez_api_impl.dart';
import 'package:hafez/domain/repository/auth/auth_repository.dart';
import 'package:hafez/domain/repository/auth/auth_repository_impl.dart';
import 'package:hafez/domain/repository/detailsghazaliathafez_repo/details_ghazaliat_hafez_repository.dart';
import 'package:hafez/domain/repository/detailsghazaliathafez_repo/details_ghazaliat_hafez_repository_impl.dart';
import 'package:hafez/domain/repository/ghazaliathafezrepo/ghazaliathafez_repository.dart';
import 'package:hafez/domain/repository/ghazaliathafezrepo/ghazaliathafez_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;
injector() {
  serviceLocator.registerSingleton<AuthApi>(AuthApiImp());
   serviceLocator.registerSingleton<AuthRepository>(AuthRepositoryImp());
   serviceLocator.registerSingleton<ApiProvider>(ApiProviderImp());
   serviceLocator.registerSingleton<Dio>(ViolationDioWrapper.provide());
   serviceLocator.registerSingleton<ApiProviderImp>(ApiProviderImp());
   serviceLocator.registerSingleton<GhazaliatHafezApi>(GhazaliatHafezApiImpl());
   serviceLocator.registerSingleton<DetailsGhazaliatHafezApi>(DetailsGhazaliatHafezApiImpl());
    serviceLocator.registerSingleton<GhazaliatHafezRepository>(GhazalHafezRepositoryImplement());
    serviceLocator.registerSingleton<DetailsGhazaliatHafezRepository>(DetailsGhazaliatHafezRepositoryImplement());
}