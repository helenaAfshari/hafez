import 'package:hafez/core/network/api_provider_impl.dart';
import 'package:hafez/data/remote/ghazaliathafez/ghazaliathafez_api.dart';
import 'package:hafez/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:hafez/service_locator.dart';

// class GhazaliatHafezApiImpl extends GhazaliatHafezApi{
//   @override
//   Future<Response> poems(int page, int perPage)async {
//    final poemsResponse = await serviceLocator<ApiProviderImp>().get(
//      'https://api.hafezname.ir/api/poems?page=$page&per_page=$perPage',
//    );
//    return poemsResponse;
//   }
// }

class GhazaliatHafezApiImpl extends GhazaliatHafezApi {
   List<GhazalItemModelEntity> ghazaliatHafez = [];
  @override
  Future<List<GhazalItemModelEntity>> poems(int page, int perPage) async {
    final poemsResponse = await serviceLocator<ApiProviderImp>().get(
      'https://api.hafezname.ir/api/poems?page=$page&per_page=$perPage',
    );
    //  ghazaliatHafez = (poemsResponse.data['data']as List).map((e) => GhazalItemModelEntity.fromJson(e)).toList();
    final loadedData = (poemsResponse.data['data'] as List)
        .map((e) => GhazalItemModelEntity.fromJson(e))
        .toList();
        ghazaliatHafez.addAll(loadedData);
    if (poemsResponse.statusCode == 200) {
      print("55555555");
      // emit(GhazaliatHafezSuccesState(ghazaliatHafez));
      print("kooooooooo${ghazaliatHafez}");
    }
    return ghazaliatHafez;
  }
}
