
import 'package:hafez/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:dio/dio.dart';

 abstract class GhazaliatHafezApi{
Future<List<GhazalItemModelEntity>> poems(int page, int perPage);

 }