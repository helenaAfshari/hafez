
import 'package:dio/dio.dart';

 abstract class GhazaliatHafezApi{
Future<Response> poems(int page, int perPage);

 }