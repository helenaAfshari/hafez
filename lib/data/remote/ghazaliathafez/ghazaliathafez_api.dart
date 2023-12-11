
import 'package:dio/dio.dart';

abstract class GhazaliatHafezApi{
  Future<Response> poems(int perPage, int page);
}