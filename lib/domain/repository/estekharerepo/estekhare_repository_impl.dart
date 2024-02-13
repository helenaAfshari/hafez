
import 'package:dio/dio.dart';
import 'package:hafez/data/remote/estekhare/estekhare_api.dart';
import 'package:hafez/domain/repository/estekharerepo/estekhare_repository.dart';
import 'package:hafez/service_locator.dart';

class EstekhareRepositoryImplement extends EstekhareRepository{
  @override
  Future<Response> estekhareRepository(int estekhareId)async {
    final estekhareResponse = await serviceLocator<EstekhareApi>().estekhare((estekhareId));
    return estekhareResponse;
  }
 
}