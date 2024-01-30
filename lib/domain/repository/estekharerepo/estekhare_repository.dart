
import 'package:dio/dio.dart';

abstract class EstekhareRepository{
  Future<Response> estekhareRepository (int estekhare);
}