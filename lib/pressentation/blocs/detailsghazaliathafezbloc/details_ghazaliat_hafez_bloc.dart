
import 'package:autharization_hanna/domain/repository/detailsghazaliathafez_repo/details_ghazaliat_hafez_repository.dart';
import 'package:autharization_hanna/pressentation/blocs/detailsghazaliathafezbloc/details_ghazaliat_hafez_event.dart';
import 'package:autharization_hanna/pressentation/blocs/detailsghazaliathafezbloc/details_ghazaliat_hafez_state.dart';
import 'package:autharization_hanna/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsGhazaliatHafezBloc extends Bloc<DetailsGhazaliatHafezEvent,DetailsGhazaliatHafezState>{
 DetailsGhazaliatHafezBloc() : super(DetailsGhazaliatHafezInitialState()) {
    int id = 0;
    on<DetailsGhazaliatHafezEvent>((event, emit)async {
      print(event);
      if(event is LoadedEvent){
        print("ggggg");
       try{
         emit(DetailsGhazaliatHafezLoadingState());
          final detailsGhazaliatResponse =
              await serviceLocator<DetailsGhazaliatHafezRepository>().detailsGhazaliatHafezRepository(id);
                    print("DetailsGhazaliatRespons${detailsGhazaliatResponse}");
                    
       }catch(e){

       }
      }
    },);
}
}
 
