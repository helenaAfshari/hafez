
import 'package:hafez/data/remote/detailsghazaliathafez/details_ghazaliat_hafez_api.dart';
import 'package:hafez/domain/repository/detailsghazaliathafez_repo/details_ghazaliat_hafez_repository.dart';
import 'package:dio/src/response.dart';
import 'package:hafez/service_locator.dart';

class DetailsGhazaliatHafezRepositoryImplement extends DetailsGhazaliatHafezRepository{
  @override
  Future<Response> detailsGhazaliatHafezRepository(int poemId)async {
   final detailsGhazalHafezResponse = await serviceLocator<DetailsGhazaliatHafezApi>().poemsStanzas(poemId);
    return detailsGhazalHafezResponse;
  }
}