
// // import 'dart:ui';

// // import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
// // import 'package:autharization_hanna/domain/model/hivemodels/favorite_model.dart';
// // import 'package:autharization_hanna/pressentation/screens/zakhireh_hive/badge_event.dart';
// // import 'package:autharization_hanna/pressentation/screens/zakhireh_hive/badge_state.dart';
// // import 'package:autharization_hanna/pressentation/screens/zakhireh_hive/services.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';


// // class BadgeBloc extends Bloc<BadgeEvent, BadgeState> {
// //   BadgeBloc({required this.box}) : super(BadgeInitial()) {

// //     on<BadgeLoadedEvent>((event, emit) async {
// //       emit(BadgeLoading());
// //       try {
// //         emit(BadgeLoadedState(await box.getCharacters(),));
// //       } catch (e) {
// //         emit(BadgeErrorState(e.toString()));
// //         emit(BadgeInitial());
// //       }
// //     });
// // // on<ChangeColorButtomListClickedEvent>((event, emit) async {
// // //   emit(BadgeLoading());
// // //   try {
// // //     // دریافت اطلاعات از هایو
// // //     var characters = await box.addCharacter(event.character);
   
// // //     emit(BadgeLoadedState(characters, event.index));
// // //   } catch (e) {
// // //     emit(BadgeErrorState(e.toString()));
// // //   }
// // // });
// //   on<ChangeColorButtomListClickedEvent>((event, emit) async {
// //      final todos = [...(state as BadgeLoadedState).characters];
    
// //       final todoIndex = todos.indexWhere((e) => e.ids == event.id);
// //           final todo = todos[todoIndex];
// //     todos[todoIndex] = todo.copyWith(isLiked: !todo.isLiked);
// //        emit(BadgeLoadedState(todos));

// //       //  emit(BadgeLoading());
// //       //  try{
// //       //  emit(BadgeLoadedState(await box.addCharacter(event.character),event.index));
     
// //       //  }catch(e){
// //       //   emit(BadgeErrorState(e.toString()));
// //       //  }
// //   // emit(ChangeColorListState(event.index,event.isFirstTime));
 
// //     //emit(ChangeColorListState(event.index,));
// //   });

// //     on<BageEditedEvent>((event, emit) async {
// //       try {
// //         box.updateCharacter(event.index, event.character);
// //         emit(BadgeLoadedState(await box.getCharacters(),));
// //       } catch (e) {
// //         emit(BadgeErrorState(e.toString()));
// //         emit(BadgeInitial());
// //       }
// //     });
// //   }

// //   final BadgeDatabase box;

// // }


// import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
// import 'package:autharization_hanna/domain/model/hivemodels/favorite_model.dart';
// import 'package:autharization_hanna/domain/model/hivemodels/test_model.dart';
// import 'package:autharization_hanna/domain/repository/ghazaliathafezrepo/ghazaliathafez_repository.dart';
// import 'package:autharization_hanna/pressentation/screens/toggleScreenAndBloc/toggle_screen.dart';
// import 'package:autharization_hanna/pressentation/screens/zakhireh_hive/badge_event.dart';
// import 'package:autharization_hanna/pressentation/screens/zakhireh_hive/badge_state.dart';
// import 'package:autharization_hanna/pressentation/screens/zakhireh_hive/repository.dart';
// import 'package:autharization_hanna/service_locator.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class BadgeBloc extends Bloc<BadgeEvent,BadgeState>{
//    List<GhazalItemModelEntity> ghazaliatHafez = [];
//      int page =1;
//      int perPage=60;
//    //BadgeBloc({required IconRepository todoRepository}):super(BadgeLoadedState([])){
//     BadgeBloc() : super(BadgeInitialState()) {

//     on<BadgeEvent>((event, emit)async {
//       if(event is BadgeLoadEvent){
//           try {
//             final ghazaliatResponse =
//               await serviceLocator<GhazaliatHafezRepository>()
//                   .ghazaliathafez(page,perPage);
//           print("jjjjj${ghazaliatResponse}");
//     ghazaliatHafez = (ghazaliatResponse.data['data']as List).map((e) => GhazalItemModelEntity.fromJson(e)).toList();

//       final todos = await IconRepository().loadIcons([ghazaliatHafez.length]);
//       emit(BadgeLoadedState(todos));
//     } catch (e) {
//       emit(BadgeErrorState(e.toString()));
//       print("Error");
//     }
//       }
//     // if (event is ChangeColorButtomListClickedEvent) {
//     //   if (state is BadgeLoadedState) {
//     //     final todos = List<FavoriteModel>.from((state as BadgeLoadedState).characters);
//     //     final todoIndex = todos.indexWhere((e) => e.id == event.id);
//     //       final todo = todos[todoIndex];
//     //       todos[todoIndex] = todo.copyWith(isLiked: !todo.isLiked);
//     //      emit(BadgeLoadedState(todos));
        
//     //   }
//     // }
//     },);
    // on<ChangeColorButtomListClickedEvent>((event, emit) async {
    //     final todos = List<GhazalItemModelEntity>.from((state as BadgeLoadedState).fcharacters);
    //     final todoIndex = todos.indexWhere((e) => e.id == event.id);
    //       final todo = todos[todoIndex];
    //   //       final ghazaliatResponse =
    //   //         await serviceLocator<GhazaliatHafezRepository>()
    //   //             .ghazaliathafez(page,perPage);
    //   // ghazaliatHafez = (ghazaliatResponse.data['data']as List).map((e) => GhazalItemModelEntity.fromJson(e)).toList();

    //       todos[todoIndex] = todo.copyWith(isLiked: !todo.isLiked);
    //        // repo.saveLikedGhazal
    //       //اینارو منتقل میکنم به بلاک غزلیات حافظ
    //      emit(BadgeLoadedState(todos));
    // },);

//  on<LoadMoreBadgeEvent>((event, emit) async {
//    List<GhazalItemModelEntity> loadedData = [];
//   page++;
//   if (event is LoadMoreBadgeEvent) {
//     try {
//       final ghazaliatResponse = await serviceLocator<GhazaliatHafezRepository>()
//           .ghazaliathafez(page, perPage);
//       print("jjjjj${ghazaliatResponse}");
//        loadedData = (ghazaliatResponse.data['data'] as List).map((e) => GhazalItemModelEntity.fromJson(e)).toList();
//        ghazaliatHafez.addAll(loadedData);
//        print("LoadedEvent$loadedData");
//          final todos = await IconRepository().loadIcons([ghazaliatHafez.length]);
//       emit(BadgeLoadedState(todos));
      
//     } catch (e) {
//       emit(BadgeErrorState(e.toString()));
//       print("Error");
//     }
//   }
// });

 // }
  
//}

// // import 'package:autharization_hanna/domain/model/hivemodels/favorite_model.dart';
// // import 'package:autharization_hanna/pressentation/screens/zakhireh_hive/badge_event.dart';
// // import 'package:autharization_hanna/pressentation/screens/zakhireh_hive/badge_state.dart';
// // import 'package:autharization_hanna/pressentation/screens/zakhireh_hive/repository.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';

// // class BadgeBloc extends Bloc<BadgeEvent, BadgeState> {
// //   BadgeBloc({
// //     required IconRepository todoRepository,
// //   })  : _todoRepository = todoRepository,
// //         super(BadgeLoading()) {
          
// //     on<BadgeLoadEvent>(_onLoadTodos);
// //     on<ChangeColorButtomListClickedEvent>(_onToggleLikeEvent);
// //   }

// //   final IconRepository _todoRepository;
// // Future<void> _onLoadTodos(BadgeLoadEvent event, Emitter<BadgeState> emit) async {
// //   try {
   
// //     final todoss = await _todoRepository.loadIcons(event.id);
// //     emit(BadgeLoadedState(todoss));
// //   } catch (e) {
// //     emit(BadgeErrorState(e.toString()));
// //   }
// // }
// //   Future<void> _onToggleLikeEvent(ChangeColorButtomListClickedEvent event, Emitter<BadgeState> emit) async {
// //     final icons = [...(state as BadgeLoadedState).characters];
// //     final iconsIndex = icons.indexWhere((e) => e.id == event.id);
// //     final icon = icons[iconsIndex];
// //     icons[iconsIndex] = icon.copyWith(isLiked: !icon.isLiked);
// //     emit(BadgeLoadedState(icons));
// //   }

// // // Future<void> _onToggleLikeEvent(ChangeColorButtomListClickedEvent event, Emitter<BadgeState> emit) async {
// // //    final List<FavoriteModel> characters = [];
// // //   try {
// // //     // Your logic to toggle likes
// // //     emit(BadgeLoadedState(characters));
// // //   } catch (e) {
// // //     emit(BadgeErrorState(e.toString()));
// // //   }
// // // }

// // }