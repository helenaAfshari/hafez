
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazal_hafez.dart';
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:autharization_hanna/domain/model/ghazaliathafez/stanzas.dart';
import 'package:autharization_hanna/domain/repository/ghazaliathafezrepo/ghazaliathafez_repository.dart';
import 'package:autharization_hanna/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_event.dart';
import 'package:autharization_hanna/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_state.dart';
import 'package:autharization_hanna/service_locator.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class GhazaliatHafezBloc extends Bloc<GhazaliatHafezEvent, GhazaliatHafezState> {
     int page =1;
     int perPage=50;
      List<GhazalItemModelEntity> ghazaliatHafez = [];
      List<StanzasModel> s = [];
      
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
    s = (ghazaliatResponse.data['stanzas']as List).map((e) => StanzasModel.fromJson(e)).toList();

          if (ghazaliatResponse.statusCode == 200) {
            print("55555555");
            emit(GhazaliatHafezSuccesState(ghazaliatHafez,s));
            print("kooooooooo${ghazaliatHafez}");
            print("SSSSSSSSTTTTTTTTTTAAAAAAAA${s}");
          } else {
            emit(GhazaliatHafezErrorState("معتبر نیست"));
          }
        } catch (e) {
          // ignore: deprecated_member_use
          print(" متصل نیست به اینترت");
          } 
      
        }else if (event is ItemSelectedEvent) {
        emit(ItemSelectedState(event.selectedItemId,event.selectedPoemId));
  }});
 

   on<LoadMoreEvent>((event, emit) async {
   String message;
   List<GhazalItemModelEntity> loadedData = [];
    List<StanzasModel> s = [];
  page++;

  if (event is LoadMoreEvent) {
    try {
      final ghazaliatResponse = await serviceLocator<GhazaliatHafezRepository>()
          .ghazaliathafez(page, perPage);

      print("jjjjj${ghazaliatResponse}");

       loadedData = (ghazaliatResponse.data['data'] as List).map((e) => GhazalItemModelEntity.fromJson(e)).toList();
           s = (ghazaliatResponse.data['stanzas']as List).map((e) => StanzasModel.fromJson(e)).toList();

      ghazaliatHafez.addAll(loadedData);
      s.addAll(s);

      if (loadedData.isEmpty || s.isEmpty) {
        emit(GhazaliatHafezEndOfListState());
      } else {
        if (ghazaliatResponse.statusCode == 200) {
          emit(GhazaliatHafezSuccesState(ghazaliatHafez,s));
          print("kooooooooo${ghazaliatHafez}");
        } else {
          emit(GhazaliatHafezErrorState("معتبر نیست"));
        }
      }
    } catch (e) {
      print(" متصل نیست به اینترنت");
    }
  }
});

  }

}


  




