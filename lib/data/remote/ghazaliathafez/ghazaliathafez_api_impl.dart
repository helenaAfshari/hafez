import 'package:autharization_hanna/core/network/api_provider_impl.dart';
import 'package:autharization_hanna/data/remote/ghazaliathafez/ghazaliathafez_api.dart';
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:autharization_hanna/service_locator.dart';
import 'package:dio/src/response.dart';

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

// class GhazaliatHafezApiImpl extends GhazaliatHafezApi {
//   @override
//   Future<List<GhazalItemModelEntity>> poems(int page, int perPage) async {
//     final poemsResponse = await serviceLocator<ApiProviderImp>().get(
//       'https://api.hafezname.ir/api/poems?page=$page&per_page=$perPage',
//     );

//     final ghazaliatHafez = (poemsResponse.data['data'] as List)
//         .map((e) => GhazalItemModelEntity.fromJson(e))
//         .toList();

//     // You can remove the check for statusCode here

//     // If you want to print or log the data, do it here
//     print("kooooooooo${ghazaliatHafez}");

//     return ghazaliatHafez;
//   }
// }
