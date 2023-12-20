
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:dio/dio.dart';

 abstract class GhazaliatHafezApi{
//   Future<List<GhazaliatHafezModel>> poems
Future<Response> poems(int page, int perPage);

 }