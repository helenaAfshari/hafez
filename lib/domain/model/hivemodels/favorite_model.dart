
import 'package:hive_flutter/hive_flutter.dart';
part 'favorite_model.g.dart';
@HiveType(typeId: 0)
class FavoriteModel {
  @HiveField(0)
  final int ids; 
  @HiveField(1)
  final bool isLiked;
   FavoriteModel({required this.ids,required this.isLiked,});
   FavoriteModel copyWith({int?newisFavorite,bool?liked, required bool isLiked}){
    return FavoriteModel(ids: newisFavorite??ids,isLiked: liked?? isLiked);
   }
}