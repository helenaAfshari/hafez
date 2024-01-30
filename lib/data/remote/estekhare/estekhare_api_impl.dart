
import 'package:dio/dio.dart';
import 'package:hafez/core/network/api_provider_impl.dart';
import 'package:hafez/data/remote/estekhare/estekhare_api.dart';
import 'package:hafez/service_locator.dart';


class EstekhareApiImpl extends EstekhareApi{
  @override
  Future<Response> estekhare(int id) async {
   final estekhareResponse = await serviceLocator<ApiProviderImp>().get(
     'https://api.hafezname.ir/api/poems?id[]=$id',
   );
    print("ImplementEstekharehhhhh:::????$estekhareResponse");
   return estekhareResponse;
  }
 
}