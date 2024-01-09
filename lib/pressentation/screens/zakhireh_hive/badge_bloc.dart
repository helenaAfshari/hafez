
// import 'dart:ui';

// import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
// import 'package:autharization_hanna/domain/model/hivemodels/favorite_model.dart';
// import 'package:autharization_hanna/pressentation/screens/zakhireh_hive/badge_event.dart';
// import 'package:autharization_hanna/pressentation/screens/zakhireh_hive/badge_state.dart';
// import 'package:autharization_hanna/pressentation/screens/zakhireh_hive/services.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';


// class BadgeBloc extends Bloc<BadgeEvent, BadgeState> {
//   BadgeBloc({required this.box}) : super(BadgeInitial()) {

//     on<BadgeLoadedEvent>((event, emit) async {
//       emit(BadgeLoading());
//       try {
//         emit(BadgeLoadedState(await box.getCharacters(),));
//       } catch (e) {
//         emit(BadgeErrorState(e.toString()));
//         emit(BadgeInitial());
//       }
//     });
// // on<ChangeColorButtomListClickedEvent>((event, emit) async {
// //   emit(BadgeLoading());
// //   try {
// //     // دریافت اطلاعات از هایو
// //     var characters = await box.addCharacter(event.character);
   
// //     emit(BadgeLoadedState(characters, event.index));
// //   } catch (e) {
// //     emit(BadgeErrorState(e.toString()));
// //   }
// // });
//   on<ChangeColorButtomListClickedEvent>((event, emit) async {
//      final todos = [...(state as BadgeLoadedState).characters];
    
//       final todoIndex = todos.indexWhere((e) => e.ids == event.id);
//           final todo = todos[todoIndex];
//     todos[todoIndex] = todo.copyWith(isLiked: !todo.isLiked);
//        emit(BadgeLoadedState(todos));

//       //  emit(BadgeLoading());
//       //  try{
//       //  emit(BadgeLoadedState(await box.addCharacter(event.character),event.index));
     
//       //  }catch(e){
//       //   emit(BadgeErrorState(e.toString()));
//       //  }
//   // emit(ChangeColorListState(event.index,event.isFirstTime));
 
//     //emit(ChangeColorListState(event.index,));
//   });

//     on<BageEditedEvent>((event, emit) async {
//       try {
//         box.updateCharacter(event.index, event.character);
//         emit(BadgeLoadedState(await box.getCharacters(),));
//       } catch (e) {
//         emit(BadgeErrorState(e.toString()));
//         emit(BadgeInitial());
//       }
//     });
//   }

//   final BadgeDatabase box;

// }

import 'package:autharization_hanna/domain/model/hivemodels/favorite_model.dart';
import 'package:autharization_hanna/pressentation/screens/zakhireh_hive/badge_event.dart';
import 'package:autharization_hanna/pressentation/screens/zakhireh_hive/badge_state.dart';
import 'package:autharization_hanna/pressentation/screens/zakhireh_hive/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BadgeBloc extends Bloc<BadgeEvent, BadgeState> {
  BadgeBloc({
    required TodoRepository todoRepository,
  })  : _todoRepository = todoRepository,
        super(BadgeLoading()) {
          
    on<BadgeLoadEvent>(_onLoadTodos);
    on<ChangeColorButtomListClickedEvent>(_onToggleLikeEvent);
  }

  final TodoRepository _todoRepository;
Future<void> _onLoadTodos(BadgeLoadEvent event, Emitter<BadgeState> emit) async {
  try {
    //final todos = await _todoRepository.loadTodos(event.index);
    final todoss = await _todoRepository.loadTodos();
    emit(BadgeLoadedState(todoss));
  } catch (e) {
    emit(BadgeErrorState(e.toString()));
  }
}

  // Future<void> _onLoadTodos(BadgeLoadEvent event, Emitter<BadgeState> emit) async {
  //   try {
  //     final todos = await _todoRepository.loadTodos(5);
  //     emit(BadgeLoadedState(todos));
  //   } catch (e) {
  //     emit(BadgeErrorState(e.toString()));
  //   }
  // }

  Future<void> _onToggleLikeEvent(ChangeColorButtomListClickedEvent event, Emitter<BadgeState> emit) async {
    final todos = [...(state as BadgeLoadedState).characters];
    final todoIndex = todos.indexWhere((e) => e.id == event.id);
    final todo = todos[todoIndex];
    todos[todoIndex] = todo.copyWith(isLiked: !todo.isLiked);
    emit(BadgeLoadedState(todos));
  }

// Future<void> _onToggleLikeEvent(ChangeColorButtomListClickedEvent event, Emitter<BadgeState> emit) async {
//    final List<FavoriteModel> characters = [];
//   try {
//     // Your logic to toggle likes
//     emit(BadgeLoadedState(characters));
//   } catch (e) {
//     emit(BadgeErrorState(e.toString()));
//   }
// }

}