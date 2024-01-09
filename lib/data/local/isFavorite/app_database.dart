
// import 'dart:developer';

// import 'package:autharization_hanna/data/local/isFavorite/database_adaptor.dart';
// import 'package:autharization_hanna/domain/model/hivemodels/favorite_model.dart';
// import 'package:hive/hive.dart';

// class AppDatabase implements DBAdaptor{
//   AppDatabase._();
//   static final AppDatabase _shared = AppDatabase._();
//   factory AppDatabase.instance()=>_shared;
//   static const String _boxName = 'favorites';
//   @override
//   Future<bool> createNote({required FavoriteModel favoriteModel}) async {
//     try{
//       await Hive.box(_boxName).add(favoriteModel);
//       return true;
//     }catch(e){
//       log(e.toString());
//       return false;

//   }
//   }

//   @override
//   Future<bool> deleteFavoriteModel({required int index})async {
//      try{
//     await Hive.box(_boxName).deleteAt(index);
//     return true;
//      }catch(e){
//     log(e.toString());
//     return false;
//      }
//   }

//   @override
//   Future<List<FavoriteModel>> getAllFavoriteModel()async {
//     try{ 
//       return Hive.box<FavoriteModel>(_boxName).values.toList();
      
//     }catch(e){
//    log(e.toString());
//     return [];
//     }
//   }

// @override
// Future<FavoriteModel> readSingleFavoriteModel() async {
//   int index =0;
//   try {
//     final favorite = Hive.box(_boxName).getAt(index);
//     return favorite!;
//   } catch (e) {
//     log(e.toString());
//     throw Exception("Error reading single favorite model");
//   }
// }

//   @override
//   Future<bool> updateFavoriteModel({required FavoriteModel favoriteModel, required bool currentfavorite}) {
//     Hive.box<FavoriteModel>(_boxName).putAt(0, value)
//   //  var box = await noteBox();
//     // await box.putAt(index, character);
//     throw UnimplementedError();
//   }
  
// }