
import 'package:autharization_hanna/core/network/api_provider_impl.dart';
import 'package:autharization_hanna/data/remote/ghazaliathafez/ghazaliathafez_api.dart';
import 'package:autharization_hanna/service_locator.dart';
import 'package:dio/src/response.dart';

class GhazaliatHafezApiImpl extends GhazaliatHafezApi{
  @override
  Future<Response> poems(int page, int perPage)async {
    
   final poemsResponse = await serviceLocator<ApiProviderImp>().get(
     'https://api.hafezname.ir/api/poems?page=$page&per_page=$perPage',
   );
   return poemsResponse;
  }
}