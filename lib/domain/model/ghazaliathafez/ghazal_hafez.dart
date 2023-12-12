
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazaliathafez_model.dart';

class GhazaliatHafez{
  final List<GhazalItemModelEntity>ghazaliatHafezToList;
  GhazaliatHafez.fromList(List<dynamic>list):
  ghazaliatHafezToList=GhazalItemModelEntity.parseGhazalTo(list);
}