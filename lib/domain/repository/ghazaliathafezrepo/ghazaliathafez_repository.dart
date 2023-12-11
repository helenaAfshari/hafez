
import 'package:dio/dio.dart';

abstract class GhazaliatHafezRepository {
  Future<Response>ghazaliathafez(int perPage, int page);
}