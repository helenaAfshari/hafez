
import 'package:autharization_hanna/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_event.dart';
import 'package:autharization_hanna/pressentation/blocs/ghazaliathafezbloc/ghazaliat_hafez_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GhazaliatHafezBloc extends Bloc<GhazaliatHafezEvent,GhazaliatHafezState>{
 GhazaliatHafezBloc() : super(GhazaliatHafezInitial()) {
   on<GhazaliatHafezEvent>((event, emit) async {
    if(event is LoadedEvent){
      
    }
   });
}
}