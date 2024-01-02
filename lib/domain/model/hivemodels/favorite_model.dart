
import 'package:hive_flutter/hive_flutter.dart';
part 'favorite_model.g.dart';
@HiveType(typeId: 0)
class FavoriteModel {
  @HiveField(0)
  List<int> ids;
   FavoriteModel({required this.ids});
   FavoriteModel copyWith({List<int>?newisFavorite}){
    return FavoriteModel(ids: newisFavorite??ids,);
   }
}