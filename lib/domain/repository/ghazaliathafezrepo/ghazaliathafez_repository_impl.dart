import 'package:hafez/data/remote/ghazaliathafez/ghazaliathafez_api.dart';
import 'package:hafez/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:hafez/domain/repository/ghazaliathafezrepo/ghazaliathafez_repository.dart';
import 'package:hafez/service_locator.dart';
import 'package:hive/hive.dart';

// class GhazalHafezRepositoryImplement extends GhazaliatHafezRepository{
//   @override
//   Future<Response> ghazaliathafez(int page, int perPage)async {
//      final ghazalHafezResponse = await serviceLocator<GhazaliatHafezApi>().poems(page,perPage);
//     return ghazalHafezResponse;
//   }
//   }

class GhazalHafezRepositoryImplement extends GhazaliatHafezRepository {
  final Box _likedGhazalBox = Hive.box<Map>(name: 'favBox');

  @override
  Future<List<GhazalItemModelEntity>> ghazaliathafez(
      int page, int perPage) async {
    final ghazaliatHafezList =
        await serviceLocator<GhazaliatHafezApi>().poems(page, perPage);
    return ghazaliatHafezList.map((e) {
      final isLiked = _likedGhazalBox.containsKey(e.id!.toString());
      return e.copyWith(isLiked: isLiked);
    }).toList();
  }
  
  @override
  void toggleFav(int id, GhazalItemModelEntity entity) {
    final likedGhazalId = _likedGhazalBox.containsKey(id.toString());
    if (likedGhazalId) {
      _likedGhazalBox.delete(id.toString());
    } else {
      _likedGhazalBox.put(id.toString(), entity.toJson());
    }
  }
}
