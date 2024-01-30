import 'package:dio/dio.dart';

abstract class EstekhareApi  {
  Future<Response> estekhare (int id);

}