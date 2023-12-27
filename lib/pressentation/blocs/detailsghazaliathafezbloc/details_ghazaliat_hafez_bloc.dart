
import 'package:autharization_hanna/domain/model/detailsghazaliathafez/details_ghazaliat_hafez_model.dart';
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:autharization_hanna/domain/repository/detailsghazaliathafez_repo/details_ghazaliat_hafez_repository.dart';
import 'package:autharization_hanna/pressentation/blocs/detailsghazaliathafezbloc/details_ghazaliat_hafez_event.dart';
import 'package:autharization_hanna/pressentation/blocs/detailsghazaliathafezbloc/details_ghazaliat_hafez_state.dart';
import 'package:autharization_hanna/pressentation/screens/ghazaliathafez/ghazaliat_hafez_screen.dart';
import 'package:autharization_hanna/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsGhazaliatHafezBloc extends Bloc<DetailsGhazaliatHafezEvent,DetailsGhazaliatHafezState>{
  //  int poemId =5;
 DetailsGhazaliatHafezBloc() : super(DetailsGhazaliatHafezInitialState()) {
     List<DetailsGhazaliatHafezModel> detailsGhazaliatHafez = [];
    //  List<GhazalItemModelEntity> gGhazaliatHafez = [];
    on<DetailsGhazaliatHafezEvent>((event, emit)async {
      // print(event);
  emit(DetailsGhazaliatHafezLoadingState());

    //  print("poemI?iddddd::::::::::::$poemId");
      if(event is LoadedddEvent){
        //  poemId++;
        print("ggggg");
       try{
          final detailsGhazaliatResponse =
              await serviceLocator<DetailsGhazaliatHafezRepository>().detailsGhazaliatHafezRepository(event.selectedPoemIdd);
                    print("DetailsGhazaliatRespons${detailsGhazaliatResponse}");
  detailsGhazaliatHafez = (detailsGhazaliatResponse.data['data'] as List).map((e) =>
   DetailsGhazaliatHafezModel.fromJason(e)).toList();
  
  if (detailsGhazaliatResponse.statusCode == 200) {
            print("55555555");
            emit(DetailsGhazaliatHafezSuccesState(detailsGhazaliatHafez,));
            print("koohhhhho${detailsGhazaliatHafez}");
          } else {
            emit(DetailsGhazaliatHafezErrorState("معتبر نیست"));
          }
       }catch (e) {
          print(" متصل نیست به اینترت");
          }
      }
      // else if(event is ItemSelectedEvent){
      //       event.selectedPoemIdd;
      //   }
    },);
}
}
 
