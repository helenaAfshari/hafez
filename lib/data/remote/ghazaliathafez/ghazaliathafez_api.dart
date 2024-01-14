
import 'package:hafez/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
 abstract class GhazaliatHafezApi{
Future<List<GhazalItemModelEntity>> poems(int page, int perPage);

 }