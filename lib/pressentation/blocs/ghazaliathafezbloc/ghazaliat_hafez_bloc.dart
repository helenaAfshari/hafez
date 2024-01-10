

import 'package:autharization_hanna/domain/model/detailsghazaliathafez/details_ghazaliat_hafez_model.dart';
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:autharization_hanna/domain/model/hivemodels/favorite_model.dart';
import 'package:autharization_hanna/domain/repository/ghazaliathafezrepo/ghazaliathafez_repository.dart';
import 'package:autharization_hanna/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_event.dart';
import 'package:autharization_hanna/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_state.dart';
import 'package:autharization_hanna/pressentation/screens/zakhireh_hive/badge_event.dart';
import 'package:autharization_hanna/pressentation/screens/zakhireh_hive/services.dart';
import 'package:autharization_hanna/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GhazaliatHafezBloc extends Bloc<GhazaliatHafezEvent, GhazaliatHafezState> {
     int page =1;
     int perPage=50;
      List<GhazalItemModelEntity> ghazaliatHafez = [];
      List<DetailsGhazaliatHafezModel> detailsGhazaliatHafez = [];
      
// List<bool> toggle = List.generate(GhazalItemModelEntity as int, (index) => false);

GhazaliatHafezBloc() : super(GhazaliatHafezInitialState()) {
  on<GhazaliatHafezEvent>((event, emit) async {
    print(event);

      if (event is LoadedEvent) {
        print("kkkkkk");
        try {
          print("llllll");
          emit(GhazaliatHafezLoadingState());
          final ghazaliatResponse =
              await serviceLocator<GhazaliatHafezRepository>()
                  .ghazaliathafez(page,perPage);
          print("jjjjj${ghazaliatResponse}");
    ghazaliatHafez = (ghazaliatResponse.data['data']as List).map((e) => GhazalItemModelEntity.fromJson(e)).toList();
 
          if (ghazaliatResponse.statusCode == 200) {
            print("55555555");
            emit(GhazaliatHafezSuccesState(ghazaliatHafez));
            print("kooooooooo${ghazaliatHafez}");
          } else {
            emit(GhazaliatHafezErrorState("معتبر نیست"));
          }
        } catch (e) {
          print(" متصل نیست به اینترت");
          } 
        }
  });
    //   on<cccccc>((event, emit) async {
    //     final todos = List<FavoriteModel>.from((state as GhazaliatHafezSuccesState).fcharacters);
    //     final todoIndex = todos.indexWhere((e) => e.id == event.id);
    //       final todo = todos[todoIndex];
    //   //       final ghazaliatResponse =
    //   //         await serviceLocator<GhazaliatHafezRepository>()
    //   //             .ghazaliathafez(page,perPage);
    //   // ghazaliatHafez = (ghazaliatResponse.data['data']as List).map((e) => GhazalItemModelEntity.fromJson(e)).toList();

    //       todos[todoIndex] = todo.copyWith(isLiked: !todo.isLiked);
    //      emit(GhazaliatHafezSuccesState(ghazaliatHafez,todos));
    // },);
  // on<GhazaliatHafezEvent>((event, emit) async {
  //   print(event);

  //  if (event is cccccc) {
  //     if (state is GhazaliatHafezSuccesState) {
  //       final todos = List<GhazalItemModelEntity>.from((state as GhazaliatHafezSuccesState).ghazaliatHafez);
  //       final todoIndex = todos.indexWhere((e) => e.id == event.id);
  //         final todo = todos[todoIndex];
  //        // todos[todoIndex] = todo.copyWith(isLiked: !todo.isLiked);
  //        emit(GhazaliatHafezSuccesState(todos));
        
  //     }
  //   }});

 
  //   //   if (event is LoadedEvent) {
  //   //     print("kkkkkk");
  //   //     try {
  //   //       print("llllll");
  //   //       emit(GhazaliatHafezLoadingState());
        
  //   //       final ghazaliatResponse =
  //   //           await serviceLocator<GhazaliatHafezRepository>()
  //   //               .ghazaliathafez(page,perPage);
  //   //       print("jjjjj${ghazaliatResponse}");
  //   // ghazaliatHafez = (ghazaliatResponse.data['data']as List).map((e) => GhazalItemModelEntity.fromJson(e)).toList();
 
  //   //       if (ghazaliatResponse.statusCode == 200) {
  //   //         print("55555555");
  //   //         emit(GhazaliatHafezSuccesState(ghazaliatHafez));
  //   //         print("kooooooooo${ghazaliatHafez}");
  //   //       } else {
  //   //         emit(GhazaliatHafezErrorState("معتبر نیست"));
  //   //       }
  //   //     } catch (e) {
  //   //       print(" متصل نیست به اینترت");
  //   //       } 
  //   //     }
    
  // });
  //  if (event is ChangeColorButtomListClickedEvent) {
  //     if (state is BadgeLoadedState) {
  //       final todos = List<FavoriteModel>.from((state as BadgeLoadedState).characters);
  //       final todoIndex = todos.indexWhere((e) => e.id == event.id);
  //         final todo = todos[todoIndex];
  //         todos[todoIndex] = todo.copyWith(isLiked: !todo.isLiked);
  //        emit(BadgeLoadedState(todos));
        
  //     }
  //   }
 
   on<LoadMoreEvent>((event, emit) async {
   List<GhazalItemModelEntity> loadedData = [];
  page++;
  
  if (event is LoadMoreEvent) {
    try {
      final ghazaliatResponse = await serviceLocator<GhazaliatHafezRepository>()
          .ghazaliathafez(page, perPage);

      print("jjjjj${ghazaliatResponse}");

       loadedData = (ghazaliatResponse.data['data'] as List).map((e) => GhazalItemModelEntity.fromJson(e)).toList();
       ghazaliatHafez.addAll(loadedData);
       print("LoadedEvent$loadedData");
        if (ghazaliatResponse.statusCode == 200) {
          emit(GhazaliatHafezSuccesState(ghazaliatHafez));
          print("kooooooooo${ghazaliatHafez}");
        } else {
          emit(GhazaliatHafezErrorState("معتبر نیست"));
        }

    } catch (e) {
      print(" متصل نیست به اینترنت");
    }
  }
});
  }

}
  




