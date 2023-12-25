


import 'package:dio/dio.dart';

abstract class DetailsGhazaliatHafezApi{
  Future<Response> poemsStanzas(int id, int poemId);
}