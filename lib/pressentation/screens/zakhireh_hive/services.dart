
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:autharization_hanna/domain/model/hivemodels/favorite_model.dart';
import 'package:hive/hive.dart';

class BadgeDatabase {
  GhazalItemModelEntity? id;
  final String _boxName = "characters";
  Future<Box<FavoriteModel>> noteBox() async {
    var box = await Hive.openBox<FavoriteModel>(_boxName);
    return box;
  }

//این برای زمانی که زدم روی ایکون
  Future<dynamic> addCharacter(FavoriteModel character) async {
    var box = await noteBox();
    await box.put(character.ids, character);
  }

  Future<void> updateCharacter(int index, FavoriteModel character) async {
    var box = await noteBox();
    await box.putAt(index, character);
  }

  Future<void> deleteCharacter(int index) async {
    var box = await noteBox();
    await box.deleteAt(index);
  }

  Future<List<FavoriteModel>> getCharacters() async {
    var box = await noteBox();
    var data = box.values.toList();
    if (data.isEmpty) {
      await addCharacter(FavoriteModel(ids: id?.id??0, isLiked: false));
     
    }
    return box.values.toList();
  }
}