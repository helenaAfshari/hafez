
import 'package:autharization_hanna/core/network/api_provider_impl.dart';
import 'package:autharization_hanna/data/remote/ghazaliathafez/ghazaliathafez_api.dart';
import 'package:autharization_hanna/service_locator.dart';
import 'package:dio/src/response.dart';

class GhazaliatHafezApiImpl extends GhazaliatHafezApi{
  @override
  Future<Response> poems(int perPage, int page)async {
   final poemsResponse = await serviceLocator<ApiProviderImp>().get(
     'https://api.hafezname.ir/api/poems?page=$page&per_page=$perPage',
   );
  // print("pppppppp${poemsResponse}");
   return poemsResponse;
  }
}