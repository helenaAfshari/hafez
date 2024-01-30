
import 'package:hafez/domain/model/detailsghazaliathafez/details_ghazaliat_hafez_model.dart';
import 'package:hafez/domain/repository/detailsghazaliathafez_repo/details_ghazaliat_hafez_repository.dart';
import 'package:hafez/pressentation/blocs/detailsghazaliathafezbloc/details_ghazaliat_hafez_event.dart';
import 'package:hafez/pressentation/blocs/detailsghazaliathafezbloc/details_ghazaliat_hafez_state.dart';
import 'package:hafez/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class DetailsGhazaliatHafezBloc extends Bloc<DetailsGhazaliatHafezEvent,DetailsGhazaliatHafezState>{
 DetailsGhazaliatHafezBloc() : super(DetailsGhazaliatHafezInitialState()) {
     List<DetailsGhazaliatHafezModel> detailsGhazaliatHafez = [];


     
    on<DetailsGhazaliatHafezEvent>((event, emit)async {
  emit(DetailsGhazaliatHafezLoadingState());
      if(event is LoadedddEvent){
       try{
          final detailsGhazaliatResponse =
              await serviceLocator<DetailsGhazaliatHafezRepository>().detailsGhazaliatHafezRepository(event.selectedPoemIdd);
              
                    print("DetailsGhazaliatRespons${detailsGhazaliatResponse}");
  detailsGhazaliatHafez = (detailsGhazaliatResponse.data['data'] as List).map((e) =>
   DetailsGhazaliatHafezModel.fromJason(e)).toList();
  if (detailsGhazaliatResponse.statusCode == 200) {
            print("55555555تتتتت");
            emit(DetailsGhazaliatHafezSuccesState(detailsGhazaliatHafez,));
            print("DetailsGhazaliatHafez${detailsGhazaliatHafez}");
          } else {
            emit(DetailsGhazaliatHafezErrorState("معتبر نیست"));
          }
       }catch (e) {
          print(" متصل نیست به اینترت");
          }
      }
    },);
}
}
 
