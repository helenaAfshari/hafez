

import 'package:hafez/core/network/api_provider_impl.dart';
import 'package:hafez/service_locator.dart';
import 'package:dio/dio.dart';
import 'details_ghazaliat_hafez_api.dart';

class DetailsGhazaliatHafezApiImpl extends DetailsGhazaliatHafezApi{
  @override
  Future<Response> poemsStanzas(int poemId)async {
   final responsePoemsStanzas = await serviceLocator<ApiProviderImp>().get(
     'https://api.hafezname.ir/api/poems/$poemId/stanzas',
   );
   return responsePoemsStanzas;
  }
}