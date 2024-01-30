
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hafez/domain/model/ghazaliathafez/ghazaliathafez_model.dart';
import 'package:hafez/domain/repository/estekharerepo/estekhare_repository.dart';
import 'package:hafez/domain/repository/ghazaliathafezrepo/ghazaliathafez_repository.dart';
import 'package:hafez/pressentation/blocs/estekharebloc/event_estekhare.dart';
import 'package:hafez/pressentation/blocs/estekharebloc/state_estekhare.dart';
import 'package:hafez/service_locator.dart';

class BlocEstekhare extends Bloc<EstekhareEvent,StekharehState>{
  List<GhazalItemModelEntity> ghazaliatHafez = [];
  int page = 1;
  int perPage = 50;
  BlocEstekhare() :super(InisialEstekhareState()){
 on<EstekhareEvent>((event, emit) async {
      print(event);
      if (event is EstekhareLoadedEvent) {
        print("kkkkkk");
        try {
          print("llllll");
          emit(LoadingEstekhareState());
          final ghazaliatResponse =
              await serviceLocator<GhazaliatHafezRepository>()
                  .ghazaliathafez(page, perPage);
          emit(SuccesEstekhareState(ghazaliatResponse));
        } 
       catch (e) {
          print("نیست به اینترت");
        }
    }
    });
  //  on<EstekhareEvent>((event, emit) async {
  //    if (event is EstekhareLoadedEvent)
  //    {
  // print("Estekhareh");
  //  try{
  //   print("kklllgEst");
  //    emit(LoadingEstekhareState());
     
  //     final estekhareResponse =
  //             await serviceLocator<EstekhareRepository>()
  //                 .estekhareRepository(event.selectEstekhareId);
  //                  ghazaliatHafez = (estekhareResponse.data['data'] as List).map((e) =>
  //          GhazalItemModelEntity.fromJson(e)).toList();
  //                 if (estekhareResponse.statusCode == 200) {
  //           print("777777");
  //           emit(SuccesEstekhareState(ghazaliatHafez));
  //           print("koohhhhho${ghazaliatHafez}");
  //         } else {
  //           emit(ErrorEstekhareState("معتبر نیست"));
  //         }
  //  }catch(e){
  // print("EstekharehError");
  //  }
  //    }
  //  },);
  }

}

