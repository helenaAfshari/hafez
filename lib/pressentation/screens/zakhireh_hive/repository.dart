
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:autharization_hanna/domain/model/hivemodels/favorite_model.dart';
import 'package:autharization_hanna/pressentation/screens/zakhireh_hive/badge_event.dart';
import 'package:autharization_hanna/pressentation/screens/zakhireh_hive/badge_state.dart';

// class TodoRepository {
//   Future<List<FavoriteModel>> loadTodos() async {
//     await Future.delayed(const Duration(seconds: 2));
//     return [
//      FavoriteModel(ids: 0,isLiked: false),
//      FavoriteModel(ids: 1,isLiked: false),
//      FavoriteModel(ids: 2,isLiked: false),
//      FavoriteModel(ids: 3,isLiked: false),
//     ];
//   }
// }
// class TodoRepository {
//   Future<List<FavoriteModel>> loadTodos() async {
//     await Future.delayed(const Duration(seconds: 2));

//     // تعداد بینهایت مورد نظر خود را اینجا وارد کنید
//     final int infiniteCount = 10;

//     List<FavoriteModel> infiniteFavorites = [];
//     for (int i = 0; i < infiniteCount; i++) {
//       infiniteFavorites.add(FavoriteModel(ids: i, isLiked: false));
//     }

//     return infiniteFavorites;
//   }
// }

class IconRepository {
  Future<List<FavoriteModel>> loadIcons(List<int> itemCount) async {
    await Future.delayed(const Duration(seconds: 2));
  
    List<FavoriteModel> dynamicFavorites = [];
    for (int i = 0; i < itemCount[0]+1; i++) {
      dynamicFavorites.add(FavoriteModel(id: i, isLiked: false));
    }

    return dynamicFavorites;
  }

}
// import 'package:hive/hive.dart';

// class TodoRepository {
 
// Future<List<FavoriteModel>> loadIcon() async {
//   int itemCount =5;
//     await Future.delayed(const Duration(seconds: 2));

//     List<FavoriteModel> dynamicFavorites = [];
//     for (int i = 0; i < itemCount; i++) {
//       dynamicFavorites.add(FavoriteModel(id: i, isLiked: false));
//     }

//     return dynamicFavorites;
//   }
//   // Future<dynamic> saveTodoAtIndex(int index) async {
//   //   FavoriteModel todo = FavoriteModel(id: index, isLiked: false);
//   //   await _todoBox.putAt(index, todo);
//   //    FavoriteModel savedTodo = _todoBox.getAt(index);
//   // print('Saved Todo at index $index: $savedTodo');
//   //   }
// }

// class TodoRepository {
//   Future<List<FavoriteModel>> loadTodos(BadgeEvent event) async {
//     await Future.delayed(const Duration(seconds: 2));
//     List<FavoriteModel> todos = [];

//     if (event is ChangeeeTabEvent) {
//       // استفاده از مقدار مرتبط با LoadTodosEvent
//       int numberOfTodos = event.selectedIndex;

//       for (int i = 0; i < numberOfTodos; i++) {
//         todos.add(FavoriteModel(ids: i, isLiked: false));
//       }
//     }

//     return todos;
//   }
// }


// import 'package:hive/hive.dart';

// class TodoRepository {
//   Future<List<FavoriteModel>> loadTodos() async {
//     await Future.delayed(const Duration(seconds: 2));
//     List<FavoriteModel> todos = [];
//     List<GhazalItemModelEntity> ghazalItems = []; // لیست GhazalItemModelEntity را در اینجا تعریف کنید و مقداردهی کنید.

//     // در اینجا لیست GhazalItemModelEntity پر می‌شود.

//     final Box<FavoriteModel> favoriteBox = await Hive.openBox('favoriteBox');

//     for (int i = 0; i < ghazalItems.length; i++) {
//       FavoriteModel favoriteModel = FavoriteModel(ids: i, isLiked: false);
//       todos.add(favoriteModel);
      
//       // ذخیره FavoriteModel در دیتابیس Hive
//       favoriteBox.put(i, favoriteModel);
//     }

//     return todos;
//   }
// }

