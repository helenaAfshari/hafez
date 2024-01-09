
// import 'package:hive_flutter/hive_flutter.dart';
// part 'favorite_model.g.dart';
// @HiveType(typeId: 0)
// class FavoriteModel {
//   @HiveField(0)
//   final int ids; 
//   @HiveField(1)
//   final bool isLiked;
//    FavoriteModel({required this.ids,required this.isLiked});
//    FavoriteModel copyWith({int?newisFavorite,bool?liked, required bool isLiked}){
//     return FavoriteModel(ids: newisFavorite??ids,isLiked: liked?? isLiked);
//    }
// }


import 'package:equatable/equatable.dart';

final class FavoriteModel extends Equatable {
  const FavoriteModel({
    required this.id,
  
    required this.isLiked,
  });

  final int id;
 
  final bool isLiked;

  FavoriteModel copyWith({
    int? id,
  
    bool? isLiked,
  }) {
    return FavoriteModel(
      id: id ?? this.id,
    
      isLiked: isLiked ?? this.isLiked,
    );
  }

  @override
  List<Object?> get props => [id, isLiked];
}