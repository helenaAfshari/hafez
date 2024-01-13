
import 'package:hafez/domain/model/ghazaliathafez/ghazaliathafez_model.dart';

// abstract class GhazaliatHafezRepository {

//   //Future<Response>ghazaliathafez(int perPage, int page);
//   Future<Response>ghazaliathafez(int page, int perPage,);
// }

abstract class GhazaliatHafezRepository {
  //Future<Response>ghazaliathafez(int perPage, int page);
  Future<List<GhazalItemModelEntity>>ghazaliathafez(int page, int perPage,);
  void toggleFav(int id, GhazalItemModelEntity entity);
}