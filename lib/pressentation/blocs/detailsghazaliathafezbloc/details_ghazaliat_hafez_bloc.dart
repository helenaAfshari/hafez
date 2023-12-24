
import 'package:autharization_hanna/domain/model/detailsghazaliathafez/details_ghazaliat_hafez_model.dart';
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:autharization_hanna/domain/repository/detailsghazaliathafez_repo/details_ghazaliat_hafez_repository.dart';
import 'package:autharization_hanna/pressentation/blocs/detailsghazaliathafezbloc/details_ghazaliat_hafez_event.dart';
import 'package:autharization_hanna/pressentation/blocs/detailsghazaliathafezbloc/details_ghazaliat_hafez_state.dart';
import 'package:autharization_hanna/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsGhazaliatHafezBloc extends Bloc<DetailsGhazaliatHafezEvent,DetailsGhazaliatHafezState>{
 DetailsGhazaliatHafezBloc() : super(DetailsGhazaliatHafezInitialState()) {
    int id = 0;
     List<DetailsGhazaliatHafezModel> detailsGhazaliatHafez = [];
     List<GhazalItemModelEntity> gGhazaliatHafez = [];
    on<DetailsGhazaliatHafezEvent>((event, emit)async {
      print(event);
      if(event is LoadedddEvent){
        print("ggggg");
       try{
         emit(DetailsGhazaliatHafezLoadingState());
          final detailsGhazaliatResponse =
              await serviceLocator<DetailsGhazaliatHafezRepository>().detailsGhazaliatHafezRepository(id);
                    print("DetailsGhazaliatRespons${detailsGhazaliatResponse}");
 detailsGhazaliatHafez = (detailsGhazaliatResponse.data['data'] as List).map((e) =>
  DetailsGhazaliatHafezModel.fromJason(e)).toList();



  if (detailsGhazaliatResponse.statusCode == 200) {
            print("55555555");
            emit(DetailsGhazaliatHafezSuccesState(detailsGhazaliatHafez,gGhazaliatHafez));
            print("koohhhhho${detailsGhazaliatHafez}");
          } else {
            emit(DetailsGhazaliatHafezErrorState("معتبر نیست"));
          }
       }catch (e) {
          // ignore: deprecated_member_use
          print(" متصل نیست به اینترت");
          } 
      }
    },);
}
}
 
