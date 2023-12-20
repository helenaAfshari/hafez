
import 'package:autharization_hanna/data/remote/ghazaliathafez/ghazaliathafez_api.dart';
import 'package:autharization_hanna/domain/repository/ghazaliathafezrepo/ghazaliathafez_repository.dart';
import 'package:autharization_hanna/service_locator.dart';
import 'package:dio/dio.dart';

class GhazalHafezRepositoryImplement extends GhazaliatHafezRepository{
  @override
  Future<Response> ghazaliathafez(int page, int perPage)async {
     final ghazalHafezResponse = await serviceLocator<GhazaliatHafezApi>().poems(page,perPage);
    return ghazalHafezResponse;
  }
  }