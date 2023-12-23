
import 'package:autharization_hanna/data/remote/detailsghazaliathafez/details_ghazaliat_hafez_api.dart';
import 'package:autharization_hanna/domain/repository/detailsghazaliathafez_repo/details_ghazaliat_hafez_repository.dart';
import 'package:dio/src/response.dart';
import 'package:autharization_hanna/service_locator.dart';

class DetailsGhazaliatHafezRepositoryImplement extends DetailsGhazaliatHafezRepository{
  @override
  Future<Response> detailsGhazaliatHafezRepository(int id)async {
   final detailsGhazalHafezResponse = await serviceLocator<DetailsGhazaliatHafezApi>().poemsStanzas(id);
    return detailsGhazalHafezResponse;
  }
}