

import 'package:autharization_hanna/core/network/api_provider_impl.dart';
import 'package:autharization_hanna/service_locator.dart';
import 'package:dio/dio.dart';
import 'details_ghazaliat_hafez_api.dart';

class DetailsGhazaliatHafezApiImpl extends DetailsGhazaliatHafezApi{
  @override
  Future<Response> poemsStanzas(int id,int poemId)async {
   final responsePoemsStanzas = await serviceLocator<ApiProviderImp>().get(
     'https://api.hafezname.ir/api/poems/$poemId/stanzas?id=$id',
   );
   return responsePoemsStanzas;
  }
}