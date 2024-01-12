
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:dio/dio.dart';

// abstract class GhazaliatHafezRepository {

//   //Future<Response>ghazaliathafez(int perPage, int page);
//   Future<Response>ghazaliathafez(int page, int perPage,);
// }

abstract class GhazaliatHafezRepository {
  //Future<Response>ghazaliathafez(int perPage, int page);
  Future<List<GhazalItemModelEntity>>ghazaliathafez(int page, int perPage,);
  void toggleFav(int id, GhazalItemModelEntity entity);
}