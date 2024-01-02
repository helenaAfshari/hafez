
import 'package:autharization_hanna/domain/model/hivemodels/favorite_model.dart';

abstract class DBAdaptor{
  ///create hive
  Future<bool>createNote({required FavoriteModel favoriteModel});
  ///Read hive
  ///All read FavoriteModel in database All list 
  Future<List<FavoriteModel>> getAllFavoriteModel();
  /// read single Favorite model 
  Future<FavoriteModel>readSingleFavoriteModel(); 
  ///Update Hive
  Future<bool>updateFavoriteModel({required FavoriteModel favoriteModel,required bool currentfavorite});
  ///Delete Hive
  Future<bool>deleteFavoriteModel({required int index});
}