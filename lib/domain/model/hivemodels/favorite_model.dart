
import 'package:hive_flutter/hive_flutter.dart';
part 'favorite_model.g.dart';
@HiveType(typeId: 0)
class FavoriteModel {
  @HiveField(0)
  int? ids; 
  @HiveField(1)
  bool? isLiked;
   FavoriteModel({required this.ids,this.isLiked});
   FavoriteModel copyWith({int?newisFavorite,bool?liked}){
    return FavoriteModel(ids: newisFavorite??ids,isLiked: liked?? isLiked);
   }
}