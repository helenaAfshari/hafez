
import 'package:autharization_hanna/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:autharization_hanna/pressentation/screens/toggleScreenAndBloc/event_toggle.dart';
import 'package:autharization_hanna/pressentation/screens/toggleScreenAndBloc/state_toggle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocs extends Bloc<AppEvents, AppSatate> {
  AppBlocs(List<GhazalItemModelEntity> ghazaliatHafez)
      : super(
        AppSatate(
          iconStatusList: List.filled(ghazaliatHafez.length, true),
          ghazaliatHafez: ghazaliatHafez,
        ),
      ) {
    on<ChangeTabEvent>(_changeTabs);
  }

  void _changeTabs(
    ChangeTabEvent event,
    Emitter<AppSatate> emit,
  ) async {
    AppSatate newState = state.changeTab(selectedIndex: event.index);
    emit(newState);
  }
}




// class AppBlocs extends Bloc<AppEvents, AppSatate> {
//     AppBlocs() : super(changeTab(tabStatuse: true)) {
//     on<AppEvents>((event, emit) {
//       if(event is ChangeTabEvent){
//       emit(changeTab(tabStatuse: false));

//       }
//     },);
//    }
  
// }
