

import 'package:autharization_hanna/domain/model/detailsghazaliathafez/details_ghazaliat_hafez_model.dart';
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:autharization_hanna/domain/repository/ghazaliathafezrepo/ghazaliathafez_repository.dart';
import 'package:autharization_hanna/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_event.dart';
import 'package:autharization_hanna/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_state.dart';
import 'package:autharization_hanna/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GhazaliatHafezBloc extends Bloc<GhazaliatHafezEvent, GhazaliatHafezState> {
     int page =1;
     int perPage=50;
      List<GhazalItemModelEntity> ghazaliatHafez = [];
      List<DetailsGhazaliatHafezModel> detailsGhazaliatHafez = [];
      
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
            emit(GhazaliatHafezSuccesState(ghazaliatHafez,));
            print("kooooooooo${ghazaliatHafez}");
          } else {
            emit(GhazaliatHafezErrorState("معتبر نیست"));
          }
        } catch (e) {
          print(" متصل نیست به اینترت");
          } 
        }
  });
 
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
          emit(GhazaliatHafezSuccesState(ghazaliatHafez,));
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


  




